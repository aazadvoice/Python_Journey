a = 5
b <-10
c<- a+b
print(c)

#swap two numbers
a=5
b=10
c=a
a=b
b=c
print(a)
print(b)
paste("a",a,"b",b)

a=25
abc="hello"
a.b.c =TRUE
.ABC= "doLANAD TRUMP"


b<-10 >20 
print(b)
# first 10 and 20 comparision done then value go to b, so output is false


c = 10 != 20
print(c)

#LOGICAL OPERATOR
# && --AND
# || -- OR
# ! -- NOT
# & -- ELEMENT WISE AND
# | -- ELEMENT WISE OR

#IT GIVE LOGICAL RETURN TYPE

# EXAMPLE
S1 = c(TRUE, FALSE, FALSE)
S2 = c(FALSE,TRUE, TRUE)

S3 = S1 & S2
print(S3) # element wise and

S4 = S1 | S2
print(S4) # element wise or

# wrp to enter any 3 numbers and find out smallest

#way1 (taking own input)
a <- 5
b <- 9
c <- 3

if (a < b && a < c) {
  print(a)
} else if(b<a && b<c){
  print(b)
}else{
  print(c)
}



  
  # taking input from user
  a= readline("enter any number")
  b= as.integer(a)
  
  a= as.integer(readline("enter a number"))
  
  
  
  
  #way2( Taking input from user)
  a = as.integer(readline("Enter your first number"))
  b = as.integer(readline("Enter your second number"))
  c = as.integer(readline("Enter your Third number"))
  
  if(a < b)
  {
    if(a<c)
    {
    print("a is small")
  } else
    {
    print("c is smallest")
    }
    
    }else if (b<c)
    {
    print("b is smallest")
  }else {
      print("c is smallest")
    }
  
  
  #Loop (while) 
  a=5
  while (a>0){
    print(a)
    a=a-1
  }
  
  
  # wrp to frint first 10 even number
  #way1
  a=0
  while (a<20){
    print(a)
    a= a+2
  }

  #way2
  a= 0 
  count=1
  while (count<=10){
    print(a)
    a=a+2
    count = count +1
  }
  
  
  #Loop (for) 
  #also called for each loop and range based for loop
  
  #example 1
  for(i in 1:10){
    print(i)
  }

  
#sequnce type printing is vector 

  
#example  for integer
e=1:10
print(e)
class(e)

#example for numeric
e=1.2:10.5
print(e)
class(e)





#Function

#example 1
hello = function(){
  print("Hello from function")
}

hello()

#example 2
hello2 =function(num1, num2)
{
  num3 = num1 + num2
  paste("sum", num3)
}

hello2(25,69)

#example 3
hello3 = function (num1, num2)
{
  num3 = num1+num2
  return(num3)
}

sum= hello3(34,45)
print(sum)
