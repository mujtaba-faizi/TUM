import org.apache.spark.sql.SparkSession
import org.apache.spark.SparkContext
import org.apache.spark.SparkContext._
import org.apache.spark.SparkConf
import org.apache.spark.sql.types._
import org.apache.spark.sql.functions._
import org.apache.spark.sql.Column
import org.apache.spark.sql.Dataset
import org.apache.spark.sql.Row
import org.apache.spark.broadcast.Broadcast

// (c) 2021 Thomas Neumann, Timo Kersten, Alexander Beischl, Maximilian Reif

object ReturnTrips {

  def compute(trips : Dataset[Row], dist : Double, spark : SparkSession) : Dataset[Row] = {

    import spark.implicits._
    spark.conf.set("spark.default.parallelism", 6)

    // constants
    val earthRadius = 6371000.0
    val hours = 8 * 60 * 60
    val r = lit(dist)
    val div1 = r / earthRadius   //latitude => meters to radians
    val div2 = acos((r * 180)/ (earthRadius*Math.PI))   //longitude => meters to radians

    // haversine distance
    val distance = (lat1 : Column, lon1 : Column, lat2 : Column, lon2 : Column) => {
      val dLat = (abs(lat2 - lat1))
      val dLon = (abs(lon2 - lon1))
      val hav = pow(sin(dLat*0.5),2) + pow(sin(dLon*0.5),2) * cos(lat1) * cos(lat2)
      abs(lit(earthRadius * 2) * asin(sqrt(hav)))
    }

    val www = trips.select(
      $"pickup_longitude", $"pickup_latitude",
      $"dropoff_longitude", $"dropoff_latitude",
      $"tpep_pickup_datetime".as("pickup_datetime"),
      $"tpep_dropoff_datetime".as("dropoff_datetime"))

    // get seconds since '1970-01-01 00:00:00' UTC
    val dada = www
      .withColumn("pickup_datetime", unix_timestamp($"pickup_datetime"))
      .withColumn("dropoff_datetime", unix_timestamp($"dropoff_datetime"))
      .withColumn("pickup_latitude", toRadians($"pickup_latitude"))
      .withColumn("pickup_longitude", toRadians($"pickup_longitude"))
      .withColumn("dropoff_latitude", toRadians($"dropoff_latitude"))
      .withColumn("dropoff_longitude", toRadians($"dropoff_longitude"))
    //.cache()

    val distBuck = dada
      .withColumn("pickup_time_bucket", floor($"pickup_datetime" / hours))
      .withColumn("dropoff_time_bucket", floor($"dropoff_datetime" / hours))
      .withColumn("pickup_lat_bucket", floor($"pickup_latitude" / div1))
      .withColumn("pickup_long_bucket", floor($"pickup_longitude" / div2))
      .withColumn("dropoff_lat_bucket", floor($"dropoff_latitude" / div1))
      .withColumn("dropoff_long_bucket", floor($"dropoff_longitude" / div2))
    //.cache()

    val distBuckNeighbors = broadcast(distBuck
      .withColumn("dropoff_time_bucket", explode(array($"dropoff_time_bucket"-1,$"dropoff_time_bucket", $"dropoff_time_bucket"+1)))
      .withColumn("pickup_lat_bucket", explode(array($"pickup_lat_bucket" - 1, $"pickup_lat_bucket", $"pickup_lat_bucket" + 1)))
      //.withColumn("pickup_long_bucket", explode(array($"pickup_long_bucket" - 1, $"pickup_long_bucket", $"pickup_long_bucket" + 1)))
      .withColumn("dropoff_lat_bucket", explode(array($"dropoff_lat_bucket" - 1, $"dropoff_lat_bucket", $"dropoff_lat_bucket" + 1)))
      //.withColumn("dropoff_long_bucket", explode(array($"dropoff_long_bucket" - 1, $"dropoff_long_bucket", $"dropoff_long_bucket" + 1)))
    )
    // now let's join on buckets

    val result = distBuckNeighbors.as("a").join(distBuck.as("b"),
      //&&
      ($"a.pickup_lat_bucket" === $"b.dropoff_lat_bucket")
        && ($"b.pickup_lat_bucket" === $"a.dropoff_lat_bucket")
        && ($"a.dropoff_time_bucket" === $"b.pickup_time_bucket")
      //&& ($"a.pickup_long_bucket" === $"b.dropoff_long_bucket")
      //&& ($"b.pickup_long_bucket" === $"a.dropoff_long_bucket")
    )
      .filter(($"a.dropoff_datetime" < $"b.pickup_datetime")
        && (($"a.dropoff_datetime" + hours) > $"b.pickup_datetime")
        && (distance($"a.pickup_latitude", $"a.pickup_longitude", $"b.dropoff_latitude", $"b.dropoff_longitude") < r)
        && (distance($"b.pickup_latitude", $"b.pickup_longitude", $"a.dropoff_latitude", $"a.dropoff_longitude") < r)
      )
    result

    //this join is done without bucketing




  }
}
