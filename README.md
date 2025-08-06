This file consists of the learning path of swift which i learned



_____________________________________________________


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

optional values in swift
____________________________________________________________________________________________________

Optional values in swift is the values that can either be null or contain any values for eg: var x : String? here the value can be either be null or can hold a value

to use a optional value we need to unwrap it 
there are mainly 3 ways to unwrap a optional value
1)using if let
if let y=x{}else{}
the main problem of iflet is that there will be multiple else blocks if it comes under in a loop

use if let if you want unwrap some optionals otherwise guarlet is preferable

2)Guard-let

Syntax: guard let newvalue=oldvalue else{} otherpart;

guard let runs in the else block at first then it will exits the else using break continue return like that break continue can only be use inside a loop and a return part can only be used inside a function

so it is preferred that the guard let should be used inside a function or a loop 
note:make sure call the function at the end for using the guard let

3)Coalessing (??)

The coalescing operator in Swift, known as the nil coalescing operator (??), is used to provide a default value when an optional variable is nil. It allows you to simplify your code by returning a specified value if the optional does not contain a valid value.
eg : let v=z ?? "null"   where null is the default value z is the old value and the v is the new value
