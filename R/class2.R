#WRITE A FUNCTION FOR FACTORIAL

n = as.integer(readline("Enter your NUMBER number"))

#way1
hello = function(n)
{
    if (n < 0) {
      return("Factorial not defined for negative numbers")
    }
    result = 1
    for (i in 1:n) {
      result = result * i
    }
    return(result)
  }

hello(a) 

#way2 (using recursion)

factorial = function(n){
  if(n==1){
    return(1)
  }
  else {
    return(n*factorial(n-1))
  }
}

factorial(5)


#function that take any number of argument
addfinal = function(...){
  nums = c(...) #here c is a function which i used to save the value of arguments in num in the form of array
 cat('"total sum ="', sum(nums),'"total Min ="', min(nums))
  
}

addfinal(1,4,55,69)

#example of named parametert
show =function(name, age, gender){
  paste(name,age,gender)
}
show("ravi",24,"male")
show(name="ravi",age=24,gender="male")


#example of named parameter with optional parameter
display =function(name="Guest", age=18L, gender="n/a"){
  paste(name,age,gender)
}
display()
display("rashi")








#Data structure of R programming
#VECTOR, LIXT, MATRIX,ARRAY,DATA FRAMES, FACTORS

########################## vECTOR #################
# array with one dimensional of same data type , duplicated allowed
#we use c function to create any vector

v = c(1,5,6,7,0,1,2,5)
print(v)
print(class(v))


v1 = c(1,5,6,7,0,1,2,5L)
print(v1)
print(class(v1))


v2 = c(1,5,6,7,0,1,2,5,"abc")
print(v2)
print(class(v2))


v3 = c(1,5,6,7,0,1,2,5,TRUE,FALSE)
print(v3)
print(class(v3))

v4 = 1:10
print(v4)
str(v4) # it give structure like datatype , index and value

v5 =seq(from=5,to=100,by=15)
print(v5)
str(v5)
length((v5))

#calling a  using its index
v3 = c(1,5,6,7,0,1,2,5,TRUE,FALSE)
print(v3[2])


v3[4]= 100
print(v3)

#delete a vector (can be deleted with -index value)
v2[-2] #it wont delete the original v2
v2= v2[-1] #it return the new vector






# Sorting of vector
v3 = c(1,5,6,7,0,1,2,5)
sort(v3) #by default ascending
sort(2*v3) #multiply all items by 2 and then sort in asc order
sort(v3, decreasing = TRUE)

dim(v3)
length(v3)


#append
append(v3,25) #append at last
append(v3,30,after=1) #after means index value

mean(v3)
prod(v3)




#taking input from user
v= scan(what = numeric(),n=3)
print(v)



#question - Write a function to take the vector and count the frequency of the number
v= scan(what=numeric())
table(v)  #return number in ascending order with frequency





###################### List ######################################
#list - same as dictionary /json object
record=list(
  name="sameer",
  age=45,
  course="btech",
  isPassed =TRUE
)
print(record)


rec=list(1:10,
         c("hello", "Bye"),
         c(FALSE,TRUE)
         )
rec$marks=c(10,20,30,55)
Print(rec)
#note-can be access from index , key or []


#add a new value
record$company="infosys"
print(record)

# Update any key value
record$company="TCS"
record

#to remove any data assign NULL
record$company=NULL
record

str(record) # this give detail of data
summary(v3) # this give table description in case of numeric data 

# other way to call access a value in list
# > record$name
# [1] "sameer"
# > record[["name"]]
# [1] "sameer"
# > rec[[1]][3]
# [1] 3









################################# MATRIX ############################
#Matrix are 2D
mat1 = matrix(1:12,nrow=4,byrow = TRUE) #BYDEAFULT BYROW IS FALSE
print(mat1)

mat2 = matrix(1:12,nrow=5)
print(mat2)

mat3 = matrix(c(5,4,5,6,7,8,45,1,2,5,6,7,8,9),ncol=4)
print(mat3)
mat3[1,3] #return first row 3rd column value
mat3[2,] #return 2 nd row
mat3[,3] #return 3 column
rbind(mat3,c(2,6,9,5)) #add a new row at last
dim(mat3) #return dimension (i.e 4*4 for this one)
cbind (mat3,c(2,9,7,6)) #add a new column at last

#delete operation
mat3[-1,] #remove first row
mat3[,-3] #remove 3rd column


t(mat3) #transpose operation of matrix

mat3= rbind(mat3,c(1,1,1,1)) #final update will happen then use this


#arithmetic operation
mat1
mat2
mat1 + mat2 #addition operation
mat1 - mat2  #substraction operation
mat1 * mat2  #multiplication operation
mat1 %/% mat2 #division operation

dim(mat1) #dimension of matrix
length(mat1) #length of matrix

##################################### arrays ################################

#example
arr1 = array(1:30,c(5,3,2))
print(arr1)

arr2 = array(1:60,c(5,3,2,2))
print(arr2)
