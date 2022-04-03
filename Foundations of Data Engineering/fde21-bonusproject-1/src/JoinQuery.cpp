#include "JoinQuery.hpp"
#include <iostream>
#include <string>
#include <charconv>
#include <thread>
#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>
#include <fstream>
#include <assert.h>
#include <unordered_map>

//---------------------------------------------------------------------------
std::string filename_lineitem;
std::string filename_order;
std::string filename_customer;

JoinQuery::JoinQuery(std::string lineitem, std::string order,
                     std::string customer)
{
   filename_customer = customer;
   filename_order = order;
   filename_lineitem = lineitem;

}
//---------------------------------------------------------------------------
size_t JoinQuery::avg(std::string segmentParam)
{
    //-----------------------------------for customers----------------------------------

   int handle = open(filename_customer.data(), O_RDONLY);
   lseek(handle, 0, SEEK_END);
   auto length = lseek(handle, 0, SEEK_CUR);
   void* data = mmap(nullptr, length, PROT_READ, MAP_SHARED, handle, 0);
   auto begin = static_cast<const char*>(data), end = begin + length;

   std::string segment;
   std::unordered_map<unsigned, unsigned> customer_keys;

   for (auto iter=begin; iter<end;){
     const char* last = nullptr;
     const char* line_begin = nullptr;
     unsigned col = 0;
     line_begin = iter;
     for (;iter<end;++iter){
        if ((*iter)=='|'){
           ++col;
           if (col == 6) last = iter + 1;
           else if (col == 7){
              for(;last<iter;++last)
                 segment.push_back(*last);
              if(segment == segmentParam){
                 last = line_begin;
                 unsigned v;
                 for (;last<end;last++) {
                    if ((*last) == '|')
                    {
                       std::from_chars(line_begin, last, v);
                       customer_keys[v] = v;
                       //std::cout<<v<<"\n";
                       while ((iter<end)&&((*iter)!='\n')) ++iter;
                       if (last<end) ++iter;
                       break;

                    }
                 }
              }
              else{
                 while ((iter<end)&&((*iter)!='\n')) ++iter;
                 if (last<end) ++iter;
              }
              segment = "";
              break;
           }
        }
     }
   }

   //-----------------------------------for orders----------------------------------

   handle = open(filename_order.data(), O_RDONLY);
   lseek(handle, 0, SEEK_END);
   length = lseek(handle, 0, SEEK_CUR);
   data = mmap(nullptr, length, PROT_READ, MAP_SHARED, handle, 0);
   begin = static_cast<const char*>(data), end = begin + length;

   std::unordered_map<unsigned, unsigned> order_keys;
   for (auto iter=begin; iter<end;){
     const char* last = nullptr;
     const char* line_begin = nullptr;
     unsigned col = 0;
     line_begin = iter;
     for (;iter<end;++iter){
        if ((*iter)=='|'){
           ++col;
           if (col == 1) last = iter + 1;
           else if (col == 2){
              unsigned v;
              std::from_chars(last, iter, v);
              auto k = customer_keys.find(v);
              if(k != customer_keys.end()){
                 last = line_begin;
                 for (;last<end;last++) {
                    if ((*last) == '|')
                    {
                       std::from_chars(line_begin, last, v);
                       order_keys[v] = v;
                       //std::cout<<k->first<<"\n";
                       while ((iter<end)&&((*iter)!='\n')) ++iter;
                       if (last<end) ++iter;
                       break;
                    }
                 }
              }
              else{
                 while ((iter<end)&&((*iter)!='\n')) ++iter;
                 if (last<end) ++iter;
              }
              break;
           }
        }
     }
   }

   //-----------------------------------for lineitem----------------------------------

   handle = open(filename_lineitem.data(), O_RDONLY);
   lseek(handle, 0, SEEK_END);
   length = lseek(handle, 0, SEEK_CUR);
   data = mmap(nullptr, length, PROT_READ, MAP_SHARED, handle, 0);
   begin = static_cast<const char*>(data), end = begin + length;

   uint64_t sum = 0;
   uint64_t n = 0;
   for (auto iter=begin; iter<end;){
     const char* last = iter;
     unsigned col = 0;
     for (;iter<end;++iter){
        if ((*iter=='|') && col == 0){
           //std::cout<<*last;
           ++col;
           unsigned v;
           std::from_chars(last, iter, v);
           //std::cout<<v<<"\n";
           auto k = order_keys.find(v);
           if (k != order_keys.end()){
              //std::cout<<k->first<<"\n";
              continue;
           }
           else {
              while ((iter < end) && ((*iter) != '\n')) ++iter;
              if (last < end) ++iter;
              break;
           }
        }
        else if ((*iter)=='|'){
           ++col;
           if (col == 4) last = iter + 1;
           else if (col == 5) {
              unsigned v;
              std::from_chars(last, iter, v);
              //std::cout<<v<<"\n";
              sum = sum + v;
              n++;
              while ((iter<end)&&((*iter)!='\n')) ++iter;
              if (last<end) ++iter;
              break;
           }
        }
     }
   }

   uint64_t avg = sum * 100 / n;

   //close references

   munmap(data, length);
   close(handle);

   return avg;
}

//---------------------------------------------------------------------------
size_t JoinQuery::lineCount(std::string rel)
{
   std::ifstream relation(rel);
   assert(relation);  // make sure the provided string references a file
   size_t n = 0;
   for (std::string line; std::getline(relation, line);) n++;
   return n;
}