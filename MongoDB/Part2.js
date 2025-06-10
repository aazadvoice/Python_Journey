db.createCollection("invoice")
db.invoice.insert([{
        "_id" : 1,
        "item" : "doz",
        "qty" : 20,
        "rate" : 10,
        "inv_date" : "02/02/2014"
        },
{
        "_id" : 2,
        "item" : "sam",
        "qty" : 15,
        "rate" : 8,
        "inv_date" : "05/12/2014"
        },
{
        "_id" : 3,
        "item" : "amp",
        "qty" : 25,
        "rate" : 8,
        "inv_date" : "07/02/2014"
        },
{
        "_id" : 4,
        "item" : "doz",
        "qty" : 20,
        "rate" : 10,
        "inv_date" : "02/02/2014"
        },
{
        "_id" : 5,
        "item" : "amp",
        "qty" : 10,
        "rate" : 8,
        "inv_date" : "05/12/2014"
        },
{
        "_id" : 6,
        "item" : "doz",
        "qty" : 30,
        "rate" : 10,
        "inv_date" : "13/04/2014"
        },
{
        "_id" : 7,
        "item" : "sam",
        "qty" : 15,
        "rate" : 8,
        "inv_date" : "05/12/2014"
        },
{
        "_id" : null,
        "item" : "mks",
        "qty" : 10,
        "rate" : 20,
        "inv_date" : "17/12/2014"
        }])
        
        
// find all the unique values
db.invoice.distinct("item")

//way2
db.invoice.aggregate([
{$group:{_id:"$item"}}])

//find the avg quantity of each item
db.invoice.aggregate([
{$group:{_id:"$item", "avg_qty":{$avg:"$qty"}}}])

// find the items with average qty greater than 20
db.invoice.aggregate([
{$group:{_id:"$item", "avg_qty":{$avg:"$qty"}}},
 {$match:{"avg_qty":{$gt:20}}}])
 
 
// find the item purschased on 05 december 20214
db.invoice.aggregate([
{$match:{"inv_date":"05/12/2014"}}])





// print the no of invoices printed each date
db.invoice.aggregate([
{$group:{_id:"$inv_date", "number":{$sum:1}}},
])

//print the date where max invoice is generated
db.invoice.aggregate([
{$group:{_id:"$inv_date", "number":{$sum:1}}},
{$sort:{number:-1}},
{$limit:1}
])


// print the details groups by the invoice date field, and display the total cost, average quantity and number of invoice in same date.

//my way
db.invoice.aggregate([
{$group:{_id:"$inv_date", "number":{$sum:1},"avg_qty":{$avg:"$qty"},"total_cost":{$sum:"$rate"}}}
])

//solution
db.invoice.aggregate(
   [
      {
        $group : {_id : "$inv_date",
           totalCost: { $sum: { $multiply: [ "$rate", "$qty" ] } },
           avgQty: { $avg: "$qty" },
           count: { $sum: 1 }
        }
     }
  ]
  );
  
// show items purschased on different date  
db.invoice.aggregate([
{$group:{_id:{x:"$inv_date",y:"$item"}}}
])

/* print groups by the invoice date and then by item field, 
and display the total cost, average quantity and number of invoice in same date.*/
db.invoice.aggregate(
   [
      {
        $group : {_id : {inv_date : "$inv_date",item : "$item"},
           totalCost: { $sum: { $multiply: [ "$rate", "$qty" ] } },
           avgQty: { $avg: "$qty" },
           count: { $sum: 1 }
        }
     }
  ]
)
 


/*The following example groups by the invoice date and then by item field, 
and display the total cost, average quantity and number of invoice in same date for those documents
which invoice date is 05/12/2014.*/
db.invoice.aggregate(
   [
    { 
    $match : {inv_date : "05/12/2014"}
    },
      {
        $group : {_id : {inv_date : "$inv_date",item : "$item"},
           totalCost: { $sum: { $multiply: [ "$rate", "$qty" ] } },
           avgQty: { $avg: "$qty" },
           count: { $sum: 1 }
        }
     }
  ]
)

/*The following aggregation operation returns the data of the invoice 
collection to have invoice date grouped by the item and then writes 
the results to the newinvoice collection. */
db.invoice.aggregate([
 { $group : { _id : "$item", invoiceDate: { $push: "$inv_date" } } },
 { $out : "newinvoice" }
 ]);
 
 
 
 
db.createCollection("shirt");
db.shirt.insert([
{
        "_id" : 1,
        "shirt" : "Half Sleeve",
        "sizes" : [
                "medium",
                "XL",
                "free"
        ]
        },
{
        "_id" : 4,
        "shirt" : "t-shirt",
        "sizes" : ["medium","XL","XXL","free"
        ]
        },
        {
        "_id" : 3,"shirt" : "tops",
        "sizes" : ["small","L","XL","free"]
        },
        
     { "_id" : 2, "shirt" : "Full Sleeve", "sizes" : [ ] }

     ])
    
db.shirt.aggregate([
{$unwind:"$sizes"},
{$group:{_id:"$shirt", "qty":{$sum:1}}}])


db.shirt.aggregate([
{$unwind:"$sizes"},
{$match:{"sizes":"medium"}},
{$group:{_id:"$shirt", "qty":{$sum:1}}}])



//INDEX METYHOD 
db.system.indexes.find()
db.restaurants.getIndexes()//give all the exixting indexes

//create index
db.restaurants.createIndex({resturant_id:1}) //(if 1 key value called as SINGLR PRINT INDEX )
db.employee.createIndex({DEPARTMENT_ID:1,JOB_ID:1})//(IF 2  KEY  VALUE USED called as COMPUND INDEX)


db.employee.getIndexes()


db.zips.find()
db.zips.find().explain()
db.zips.find({state:"MA"}).explain("executionStats")

db.zips.getIndexes()
db.zips.createIndex({state:1})
db.zips.find({state:"MA"})
db.zips.find({state:"MA"}).explain("executionStats")

