This file consists of the learning path of swift which i learned
let vs var 
___________________________________________________________________________________________________

Git Variable declaration is mainly two types
1)Var
2)Let
 
 var is for the variables which can alter anytime for example : var x=10 x=20  This wont produce any error
 
 But in the case of Let we need to use if we dont need to change the value of the variable eg: let x= 10 x=20 will produce error 
 
 
Use var for dynamic state of your appand use let for restricting the dataflow . Commonly we use let in Swift

Swift is a type safe language which means the compiler checks for the type before running of the application which will help to reduce errors It will make sure only operations are performed with compactable data types as we cant add a integer to a string.


DATATYPES
________

The Main data types in swift are int float bool string 

Date Function in swift
__________________________________________________________________________________________________________

Date() will return the current date and the date.now() will also return the current date.(note: You need to import Foundation before that as the date is a external function)

the output will be 2025-08-05 11:17:41 +0000 to format this we can use DateFormatter which will format the date DateFormatter() funcion and today.dateStyle=.full for styling which will give the output like Tuesday, 5 August 2025 



