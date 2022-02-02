// require express and other modules
const express = require('express');
const app = express();
// Express Body Parser
app.use(express.urlencoded({extended: true}));
app.use(express.json());

// Set Static File Directory
app.use(express.static(__dirname + '/public'));


/************
 * DATABASE *
 ************/

const db = require('./models');
const BooksModel = require('./models/books');

/**********
 * ROUTES *
 **********/

/*
 * HTML Endpoints
 */

app.get('/', function homepage(req, res) {
  res.sendFile(__dirname + '/views/index.html');
});


/*
 * JSON API Endpoints
 */

app.get('/api', (req, res) => {
  res.json({
    message: 'Welcome to my app api!',
    documentationUrl: '', //leave this also blank for the first exercise
    baseUrl: '', //leave this blank for the first exercise
    endpoints: [
      {method: 'GET', path: '/api', description: 'Describes all available endpoints'},
      {method: 'GET', path: '/api/profile', description: 'Data about me'},
      {method: 'GET', path: '/api/books/', description: 'Get All books information'},
      {method: 'POST', path: '/api/books/', description: 'Add a book to the database'},
      {method: 'PUT', path: '/api/books/:id', description: 'Update book with specified ID in DB'},
      {method: 'DELETE', path: '/api/books/:id', description: 'Delete book with specified ID from DB'},
    ]
  })
});

app.get('/api/profile', (req, res) => {
  res.json({
    'name': 'Thomas A. Anderson',
    'homeCountry': 'USA',
    'degreeProgram': 'Informatics',//informatics or CSE.. etc
    'email': 'neo@matrix.org',
    'deployedURLLink': '',//leave this blank for the first exercise
    'apiDocumentationURL': '', //leave this also blank for the first exercise
    'currentCity': 'Capital City',
    'hobbies': ['Saving humanity', 'Slowing down time']
  })
});

/*
 * Get All books information
 */
app.get('/api/books/', (req, res) => {
  /*
   * use the books model and query to mongo database to get all objects
   */
  db.books.find({}, function (err, books) {
    if (err) throw err;
    /*
     * return the object as array of json values
     */
    res.json(books);
  });
});

/*
 * Add a book information into database
 */
app.post('/api/books/', (req, res) => {

  /*
   * New Book information in req.body
   */
  console.log(req.body);
  /*
   * return the new book information object as json
   */
  var newBook = new BooksModel(req.body);
  newBook.save(function (err, book) {
    if (err) return console.error(err);
    console.log(newBook.title + " saved to collection.");
  });
  res.json(newBook);
});

/*
 * Update a book information based upon the specified ID
 */
app.put('/api/books/:id', (req, res) => {
  /*
   * Get the book ID and new information of book from the request parameters
   */
  const bookId = req.params.id;
  const bookNewData = req.body;
  console.log(`book ID = ${bookId} \n Book Data = ${bookNewData}`);

  /*
   * Send the updated book information as a JSON object
   */
  var updatedBookInfo = {};
  updatedBookInfo = db.books.findOneAndUpdate({_id: bookId}, bookNewData, {new : true, useFindAndModify: false}, function(err, result){
    if(err) return console.error(err);
    console.log(bookNewData.title + " updated in collection.");
  })
  res.json(updatedBookInfo);
});

/*
 * Delete a book based upon the specified ID
 */
app.delete('/api/books/:id', (req, res) => {
  /*
   * Get the book ID of book from the request parameters
   */
  const bookId = req.params.id;
 
  /*
   * Send the deleted book information as a JSON object
   */
  var deletedBook = {};
  deletedBook = db.books.deleteOne({_id: bookId}, function(err, result){
    if(err) return console.error(err);
    console.log("Book " + bookId + " was removed from collection.");
  })
  res.json(deletedBook);
});


/**********
 * SERVER *
 **********/

// listen on the port 3000
app.listen(process.env.PORT || 80, () => {
  console.log('Express server is up and running on http://localhost:80/');
});
