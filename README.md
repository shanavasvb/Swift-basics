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



### Force Unwrapping the optional(!)

Force Unwrapping is done with the help of a ! mark . It is sone where the developer has a prior knowledge where the value will not be null.The Major Disadvantage is that if the value is null we are trying to force unwrap then the application will crash.


```swift
let userName:String? = Saritha
let unwrappedName = userName!
```



##Tuple
