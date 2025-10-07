# Swift Learning Path - Study Guide

This document contains my personal learning path for Swift programming fundamentals.

---

## Variable Declaration: `let` vs `var`

Swift provides two primary ways to declare variables:

### `var` - Mutable Variables
- Used for variables that can be modified after declaration
- Allows reassignment of values
- Example:
  ```swift
  var x = 10
  x = 20  // This is valid - no error
  ```

### `let` - Immutable Constants
- Used for values that should not change after initial assignment
- Attempting to modify will produce a compiler error
- Example:
  ```swift
  let x = 10
  x = 20  // This will produce an error
  ```

### Best Practices
- Use `var` for dynamic state management in your application
- Use `let` for restricting data flow and ensuring immutability
- `let` is commonly preferred in Swift development when values don't need to change

### Type Safety
Swift is a type-safe language, meaning the compiler performs type checking before application execution. This helps reduce runtime errors by ensuring operations are only performed with compatible data types (e.g., you cannot add an integer to a string).

---

## Data Types

The main primitive data types in Swift are:
- `Int` - Integer values
- `Float` - Floating-point numbers
- `Bool` - Boolean values (true/false)
- `String` - Text data

---

## Date Functions

### Basic Date Creation
```swift
Date()       // Returns current date and time
Date.now()   // Also returns current date and time
```

**Note:** You must import Foundation before using Date functions, as Date is an external function.

### Default Output Format
The default output appears as: `2025-08-05 11:17:41 +0000`

### Date Formatting
To format dates for better readability:
```swift
let formatter = DateFormatter()
formatter.dateStyle = .full
// Output: "Tuesday, 5 August 2025"
```

---

## Optional Values

Optional values in Swift represent variables that can either contain a value or be `nil` (null).

### Declaration
```swift
var x: String?  // Can hold a String value or nil
```

### Unwrapping Optionals

There are three main approaches to unwrap optional values:

#### 1. If Let
```swift
if let y = x {
    // Use y (unwrapped value)
} else {
    // Handle nil case
}
```

**Limitation:** Can create multiple nested else blocks when used in loops, making code less readable.

**Use Case:** Preferred when you need to handle specific optional unwrapping scenarios.

#### 2. Guard Let
```swift
guard let newValue = oldValue else {
    // Handle nil case and exit
    return  // or break/continue in loops
}
// Continue with newValue
```

**Key Points:**
- Executes the else block first when the optional is nil
- Must exit the else block using `return`, `break`, or `continue`
- `break` and `continue` can only be used inside loops
- `return` can only be used inside functions
- Should be used within functions or loops
- Remember to call the function to execute guard let logic

**Use Case:** Preferred for most optional unwrapping scenarios due to cleaner code flow.

#### 3. Nil Coalescing Operator (`??`)
The nil coalescing operator provides a default value when an optional is nil.

```swift
let v = z ?? "null"
```

Where:
- `z` is the optional value
- `"null"` is the default value used if `z` is nil
- `v` receives either the unwrapped value of `z` or the default value

**Use Case:** Best for providing simple default values without complex conditional logic.



### Force Unwrapping the optional (!)

Force Unwrapping is done with the help of a ! mark . It is sone where the developer has a prior knowledge where the value will not be null.The Major Disadvantage is that if the value is null we are trying to force unwrap then the application will crash.


```swift
let userName:String? = Saritha
let unwrappedName = userName!
```


## Tuple

Tuple is for grouping two or more values with different data types inside a parenthesisi

```swift
var info(String,Int)=("shanavas",19)
```

we can access the elements similar to that of array like positions 0 or 1 .we can also add parameter like

```swift
var info(String,Int)=(name:"Shanavas",age:19)
``` 
so we can access by `info.name` or age instead of info.1 or `info.0`

## Object oriented Programming

There are mainly two types of methods which are  

`1. init() ` : this will create a object and allocate a memory space in accordance with the space required
`2.Deini()` : this will help to destroy the space created by init and will delete the memory allocation

### **ARC (Automatic Reference Counter)**
  
  Automatic reference counter in swift is used to get the live count of objects inside of a memory.If we initialize a object using a ` init() ` then the **ARC** counter will go up  
  If if `deinit()` then the **ARC** counter will come down.  
  
  *Higher count in  ARC it will slow down the application*


  ## Array V/s Sets

### Array 
  Arrays are used with in the parenthesis     
  array keeps elements in order
  ```swift
  let x: [String] = ["apple","orange",mango"]
  print(x)
  for fruit in x
     print(fruit)
```


  There are multiple methods in array which include first,last count etc.

  in arrays we can use duplicate elements
  to access the first element  we can simply use 

```swift
let firstIndex = x.indices.first
let lastIndex = x.indices.last
```

To avoid array out of bound exception we can use the contains
for example

```swift
if x.indices.contains[4]{
  print (x[4])
}
```

so we can safely access else we will get array out of bound exception


to insert items at end we can use append and for specific position we can use insert function
similarly for remove items we can use remove function

  ### Sets

sets are similar to array we initialise similar to array but sets are faster than arra
sets doesn't allow duplicate elements
elements don't have any order
```swift
 let x : Set = [1,2,3,2]
print(x)
```
this will print 1,2,3 

**Array v/s Sets**

| Feature          | Array                             | Set                           |
| ---------------- | --------------------------------- | ----------------------------- |
| **Duplicates**   |  Allowed                         |  Not allowed                 |
| **Order**        |  Maintains order of insertion    |  Unordered                   |
| **Index Access** |  Access by index (`array[0]`)    |   No index-based access       |
| **Performance**  | Linear time lookup (`O(n)`)       | Constant time lookup (`O(1)`) |
| **Use Case**     | Ordered lists, duplicates allowed | Unique values, fast lookup    |

## Dictonaries 

dictionaries are using as the key value pair
dictonaries are using the keys and keys cannot be duplicated 

```swift

var myitem : [String:Bool] = ["Apple":true, "orange":False]

```

this means we are declaring a dictionary with the key as the String and the value as a boolean

### Accessing items in dictionaries

Acessing items is using the key ` myitem["Apple"]` will retrieves true

also another major advantage of dictionary is that even if there is not a key present we will still get the output as nil instead of crashing of the application

There is no order to add an item we can use `append` or we can use `myitem["grapes"]=false`

acessing items in dictionary is more faster and wont crash the application

## For Loop

```swift
for item in 1 .. <50{
  print(item)
}

var myArray = ["apple","orange","grapes"]

for item in myArray{
  print(myArray)
}
```

first is looping over numbers and the second one is looping over the data   so looping in the data is useful when we put conditional operators inside the loop

```swift

let allLessons ={
  LessonModel (title: " Lesson1",isfavorite :true),
    LessonModel (title: " Lesson2",isfavorite :false),
  LessonModel (title: " Lesson3",isfavorite :true),
  LessonModel (title: " Lesson4",isfavorite :false),
}

favoriteLesson : [LessonModel] =""
for lesson in allLessons{
  if lesson.isfavorite = true{
    favoriteLesson.append(lesson)
  }
}

```
this loop will print the favorite lessons only


enumerated arrays is using for getting index of the array it will take uo the index and the data 
  ```swift
  for (index,lesson) in allLessons.enumerated(){
      print("Index : \(index) || lessons : \(lesson))
  }
  ```
which will the print index along with the data 

## break and continue


Both **`break`** and **`continue`** are control statements used in loops to change their flow — but they behave differently.

---

## 🚫 `break`

**Stops** the loop **immediately** and exits it completely.  
No further iterations will be executed.

### 🧩 Example
```swift
for number in 1...5 {
    if number == 3 {
        break
    }
    print(number)
}
print("Loop ended")
```

### 🧾 Output
```
1
2
Loop ended
```

**Explanation:**  
When `number` becomes `3`, the `break` statement is executed.  
The loop **terminates instantly**, skipping the rest of the numbers.

---

## 🔁 `continue`

**Skips** the current iteration and jumps to the **next one** of the loop.  
The loop continues running for the remaining items.

### 🧩 Example
```swift
for number in 1...5 {
    if number == 3 {
        continue
    }
    print(number)
}
print("Loop completed")
```

### 🧾 Output
```
1
2
4
5
Loop completed
```

**Explanation:**  
When `number` equals `3`, the `continue` statement skips that iteration.  
The loop moves directly to the next value (`4`).

---

## ⚖️ Difference Summary

| Feature | `break` | `continue` |
|----------|----------|------------|
| **Effect** | Exits the loop completely | Skips current iteration |
| **Loop Behavior** | Stops all remaining iterations | Continues with the next iteration |
| **Usage** | When further looping is unnecessary | When a specific case should be skipped |
| **Example Output** | Ends early | Skips specific item(s) |

---

## **Filter Sort and Map in swift** 

### Filter

```swift

struct database{
  String name,
  int roll,
  bool ispremium
}
var alluser : [database]=[database("shanavas" 10,false),
database("sidharth" ,12,true),
database("sumi" ,12,true)
]

var premiumuser:[database] =[]
for user in alluser{
  if user.ispremium{
    premiumuser.append (user)
  }
}


```

we can use this line by using the filter

```swift

var premiumuser:[database] = alluser.filter({
  user in user.ispremium
})

or 

var premiumuser:[databse] = alluser.filter({
  $0 in user.premium
})
``` both of the code works the same