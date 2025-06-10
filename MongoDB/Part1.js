db.employee.find()

/*display the specific no of documents brom the brginning of the collection */
db.employee.findone().limit(5);

db.employee.findOne()

db.employee.find().skip(1).limit(5);

/* sort () is used to sort the data in asceding(1) or desceding ordre(-1)*/
db.employee.find().sort({SALARY:1}) 
db.employee.find().sort({SALARY:-1}) 


/* sort the emp in asc order of departments and desc order of their salary*/
db.employee.find().sort({DEPARTMENT_ID:1,SALARY:-1}) 


/* display the emp name, salary and job of each emp*/
db.employee.find({},{_id:0,FIRST_NAME:1, SALARY:1,JOB_ID:1})


/* display the emp of department 30*/
db.employee.find({ DEPARTMENT_ID:30})


/* display the FIRST NAME , JOB AND DEPARTMENT emp of department 30*/
db.employee.find({ DEPARTMENT_ID:30},{_id:0,FIRST_NAME:1, JOB_ID:1,DEPARTMENT_ID:1})

/* display the FIRST NAME , JOB AND DEPARTMENT emp of WORKING AS A IT PROGRAMMER*/
db.employee.find({ JOB_ID:'IT_PROG'},{_id:0,FIRST_NAME:1, JOB_ID:'IT_PROG',DEPARTMENT_ID:1})


/* COMPARISON OPERATOR
    
    EQUAL TO :
    GREATER THAN $gt /$gte
    LESS THAN $lt / $lte
    NOT EUAL TO $ne
    
    
    
    LOGICAL OPERATOR
   $and $or 
   
   $in/$nin]: IN/NOT IN
   $regex (SIMILAT to like operator*/

/* display the emp whose salary is greater than 10000 in desc order of salary*/
db.employee.find({SALARY:{$gt:10000}}).sort({SALARY:-1})



/* display the NAME , SALARY AND DEPARTMENT OF emp whose salary is greater than 10000 in desc order of salary*/
db.employee.find({SALARY:{$gt:10000}},{_id:0,FIRST_NAME:1, SALARY:1, DEPARTMENT_ID:1}).sort({SALARY:-1})


/* display the NAME , SALARY AND DEPARTMENT OF emp whose salary is greater than 10000 and working in department 80 in desc order of salary*/
db.employee.find({SALARY:{$gt:10000},DEPARTMENT_ID:80},{_id:0,FIRST_NAME:1, SALARY:1, DEPARTMENT_ID:1}).sort({SALARY:-1})

/* WAY2 */
db.employee.find({$and:[{DEPARTMENT_ID:80},{SALARY:{$gt:10000}}]},{_id:0,FIRST_NAME:1, SALARY:1, DEPARTMENT_ID:1})


/* display the emp who works in dept 100 but not as a st clark */
db.employee.find({$and:[{DEPARTMENT_ID:50},{JOB_ID:{$ne:'ST_CLERK'}}]})

/* way 2*/
db.employee.find({DEPARTMENT_ID:50,JOB_ID:{$ne:'ST_CLERK'}})

/* display the emp who works either in dept 10 or 20 */
db.employee.find({$or: [{DEPARTMENT_ID:10},{DEPARTMENT_ID:20}]})

/* way 2 */
db.employee.find({DEPARTMENT_ID:{$in:[10,20,30]}})


/*find the emp managed by  manager id 100,102,108 */
db.employee.find({MANAGER_ID:{$in:[100,102,108]}})


/*find the emp managed by  manager id 100,102,108  and they work in department 50 or 80 & salary greater than 8000*/
db.employee.find({SALARY:{$gt:8000},
"MANAGER_ID":{$in:[100,102,108]},
$or:[{DEPARTMENT_ID:50},{DEPARTMENT_ID:80}]})

/*find the emp managed by  manager id 100,101,108  and they work in department 50 or 80 & salary greater than or equal  8000 and less than equal 12000*/
db.employee.find({SALARY:{$gte:8000,$lte:12000},
MANAGER_ID:{$in:[100,102,108]},
$or:[{DEPARTMENT_ID:50},{DEPARTMENT_ID:80}]})



/* Display the emp whose name starty eith S*/
db.employee.find({FIRST_NAME:/^S/},{_id:0, FIRST_NAME:1});
db.employee.find({FIRST_NAME:/^Sh/},{_id:0, FIRST_NAME:1});


/* search for a parter at the end of the string using $ */
db.employee.find({FIRST_NAME:/a$/},{_id:0, FIRST_NAME:1});
db.employee.find({FIRST_NAME:/na$/},{_id:0, FIRST_NAME:1});


/* Search for char a in between anywhere*/
db.employee.find({FIRST_NAME:/.*a.*/},{_id:0, FIRST_NAME:1});

/* CRUD
D for delete*/
/*  Delete the emp whose name is steven */
db.employee.remove({FIRST_NAME:"Steven"})

db.employee.remove({DEPARTMENT_ID:30})

db.employee1.remove({});


/* to drop a collection */
db.student.drop();



/* to drop a database */
use cdac;
db.dropDatabase();


/*UPDATE COMMAND */
/* Update the salary of john to 1000 */
db.employee.update({FIRST_NAME:'John'},{$set:{SALARY:10000}})



/* Update the expereince of john */
db.employee.update({FIRST_NAME:'John'},{$set:{EXPERIENCE:4}})



/* UPDATE THE SALARY TO 20000 TO ALL EMP WORKING IN DEPARTMENT 60 */
db.employee.update({DEPARTMENT_ID:60},{$set:{SALARY:20000}})
/* WAY 2 */
db.employee.update({DEPARTMENT_ID:60},{$set:{SALARY:20000}},{multi:true})



/* Update multiple values */
db.employee.updateMany({FIRST_NAME:'John'},{$set:{EXPERIENCE:4}})

/* update using increment function */
db.c1.update({"emp_code":"E004"},{$inc:{"work_exp":10}})
db.c1.update({"emp_code":"E004"},{$inc:{"work_exp":2}})


/* upsert (update + insert ) if dont exist */
db.c1.update({"emp_code":"E009"},{$set:{"work_exp":10}},{upsert:true});


/* 1.Display first name , last name, job it, dept it and salary from emp collection using find as well as aggregate */


 db.employee.find({},{_id:0,FIRST_NAME:1, LAST_NAME:1, JOB_ID:1, SALARY:1, DEPARTMENT_ID:1});

 db.employee.aggregate([{$project:{_id:0,FIRST_NAME:1, LAST_NAME:1, JOB_ID:1, SALARY:1, DEPARTMENT_ID:1}}])
 
 
 /* 1. + 2.display the details of department 50*/
 db.employee.find({DEPARTMENT_ID:50},{_id:0,FIRST_NAME:1, LAST_NAME:1, JOB_ID:1, SALARY:1, DEPARTMENT_ID:1});

 db.employee.aggregate([{$project:{_id:0,FIRST_NAME:1, LAST_NAME:1, JOB_ID:1, SALARY:1, DEPARTMENT_ID:1}},
 {$match:{DEPARTMENT_ID:50}}])
 
 
 
 /*  $ GROUP OPERATOR TO GROUP THE DOCUMENTS IN A COLLECTION */
 
 
 /* Display all the distinct dept */ //ONLY WITH DISTINCT WE USE DOUBLE QOUTES(SPECIAL)
     db.employee.distinct("DEPARTMENT_ID")
     db.employee.distinct("DEPARTMENT_ID").length //length() IS A METHOD when used with find, but with distinct used as a attribute
     db.employee.distinct("MANAGER_ID")
     db.employee.distinct("MANAGER_ID").length
     
     
/* display the total sal of each department*/

 db.employee.aggregate([ 
 {$project:{_id:0,SALARY:1,DEPARTMENT_ID:1}},
 {$group:{_id:"$DEPARTMENT_ID",total:{$sum:"$SALARY"}}} //group alwayes take value pair in "$   "
 ])



/* display the maximum sal of each department*/ 
db.employee.aggregate([ 
 {$project:{_id:0,SALARY:1,DEPARTMENT_ID:1}},
 {$group:{_id:"$DEPARTMENT_ID",Maximum_salary:{$max:"$SALARY"}}} //group alwayes take value pair in "$   "
 ])
  
 
 /* display the minimum sal of each department*/
 db.employee.aggregate([ 
 {$project:{_id:0,SALARY:1,DEPARTMENT_ID:1}},
 {$group:{_id:"$DEPARTMENT_ID",minimum_salary:{$min:"$SALARY"}}} //group alwayes take value pair in "$   "
 ])

 /* display the average sal of each department*/
 db.employee.aggregate([ 
 {$project:{_id:0,SALARY:1,DEPARTMENT_ID:1}},
 {$group:{_id:"$DEPARTMENT_ID",average_salary:{$avg:"$SALARY"}}} //group alwayes take value pair in "$   "
 ])

 
  /* count the total no emp*/
  db.employee.find().length()
  
   /* count the total no emp USSING AGGREGAATE*/ 
 db.employee.aggregate([
 { $project: { _id: 0, SALARY: 1, DEPARTMENT_ID: 1 } }, //
  { $group: { _id: "", total_emp: { $sum: 1 } } }
]);


db.employee.aggregate([
  { $project: { _id: 0, SALARY: 1, DEPARTMENT_ID: 1 } },
  { $count: "FIRST_NAME" }
]);

  /* count the total no emp ,DEPARTMENT WISE AGGREGAATE*/ 
 db.employee.aggregate([
 { $project: { _id: 0, SALARY: 1, DEPARTMENT_ID: 1 } }, //
 {$sort:{TOTAL_SALARY:1}} 
]);






/* write a quary to find the avg salary of dept 50, 30,60,100 */
db.employee.aggregate([
{$match:{DEPARTMENT_ID:{$in:[50,30,60,100]}}},
{$group:{_id:"$DEPARTMENT_ID", AVERAGE_SALARY:{$avg:"$SALARY"}}}])

/* wRITE A QUARY TO FIND THE TOTAL NO OF emp manage by emp 100*/
db.employee.aggregate([{$match:{MANAGER_ID:100}},{$group:{_id:"$MANAGER_ID","EMP_COUNT": { $sum: 1 }}}])

/* WRITE A QUARY TO FIND AVG SALARY & SUM SALARY OF EACH DEPARTMENT */
db.employee.aggregate([
{$group:{_id: "$DEPARTMENT_ID",X:{$avg:"$SALARY"},Y:{$sum:"$SALARY"},Z:{$max:"$SALARY"}}}])

/* WRITE A QUARY TO FIND AVG SALARY, SUM SALARY THOSE DEPARTMENT10,20,30,40*/
db.employee.aggregate([
{$match:{DEPARTMENT_ID:{$in:[10,20,30,40]}}},
{$group:{_id: "$DEPARTMENT_ID",X:{$avg:"$SALARY"}}},
{$match:{X:{$gt:5000}}}])


// gROUP BY MULTPLE CRITERIA
db.employee.aggregate([
{$group:{_id: {X:"$DEPARTMENT_ID",Y:"$JOB_ID"},Z:{$avg:"$SALARY"}}},
])
