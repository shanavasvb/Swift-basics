# Swift Learning Path

A curated, beginner-friendly study guide for learning core Swift language fundamentals—enhanced, corrected, and structured from original study notes.

---

## Table of Contents
1. [Variables: `let` vs `var`](#variables-let-vs-var)  
2. [Type Inference & Type Safety](#type-inference--type-safety)  
3. [Core Data Types](#core-data-types)  
4. [Dates & Formatting](#dates--formatting)  
5. [Optionals](#optionals)  
6. [Tuples](#tuples)  
7. [Object-Oriented Basics & ARC](#object-oriented-basics--arc)  
8. [Arrays vs Sets](#arrays-vs-sets)  
9. [Dictionaries](#dictionaries)  
10. [Loops](#loops)  
11. [Control Flow: `break` vs `continue`](#control-flow-break-vs-continue)  
12. [Higher-Order Functions: `filter`, `map`, `sorted`, `reduce`](#higher-order-functions-filter-map-sorted-reduce)  
13. [Protocols](#protocols)  
14. [SwiftUI View Protocol](#swiftui-view-protocol)  
15. [Best Practices & Patterns](#best-practices--patterns)  
16. [Common Pitfalls](#common-pitfalls)  
17. [Next Steps](#next-steps)  
18. [Additional Resources](#additional-resources)

---

## Variables: `let` vs `var`

Swift provides two primary binding keywords:

### `let` (Constant / Immutable)
- Value cannot be reassigned after initialization.
- Encourages safer, intention-revealing code.
- Prefer `let` by default and only use `var` when mutation is required.

```swift
let maxLoginAttempts = 5
// maxLoginAttempts = 6 // ❌ Compile-time error
```

### `var` (Variable / Mutable)
- Use when the value needs to change.
- Avoid excessive mutability to reduce bugs.

```swift
var username = "alice"
username = "alice.dev" // ✅ Allowed
```

### Why Prefer `let`
- Enables compiler optimizations.
- Improves thread-safety reasoning.
- Documents intent.

---

## Type Inference & Type Safety

Swift infers types:

```swift
let count = 10        // Int
let pi = 3.14159      // Double (default for floating literals)
let isPro = true      // Bool
let greeting = "Hi!"  // String
```

You can annotate explicitly:

```swift
let count: Int = 10
```

> Note: Swift is strongly typed—you cannot mix incompatible types without explicit conversion.

---

## Core Data Types

| Type    | Description                          | Example                  |
|---------|--------------------------------------|--------------------------|
| `Int`   | Whole numbers                        | `let age: Int = 19`      |
| `Double`| 64-bit floating point (default)      | `let price = 9.99`       |
| `Float` | 32-bit floating point                | `let ratio: Float = 0.5` |
| `Bool`  | Boolean                              | `let isActive = true`    |
| `String`| Text data                            | `let name = "Swift"`     |
| `Character` | Single scalar value              | `let ch: Character = "A"`|

---

## Dates & Formatting

Requires `Foundation`:

```swift
import Foundation

let now = Date()
print(now)  // Raw default representation
```

### Formatting a Date

```swift
let formatter = DateFormatter()
formatter.dateStyle = .full
formatter.timeStyle = .short
let formatted = formatter.string(from: now)
print(formatted) // e.g. "Tuesday, 5 August 2025 at 11:17 AM"
```

### ISO8601 Formatting

```swift
let isoFormatter = ISO8601DateFormatter()
print(isoFormatter.string(from: now))
```

> Tip: Avoid storing formatted date strings—store raw `Date` and format on display.

---

## Optionals

An optional represents either a value or `nil`.

```swift
var nickname: String? = nil
nickname = "Shan"
```

### Unwrapping Techniques

#### 1. If Let Binding

```swift
if let name = nickname {
    print("Nickname: \(name)")
} else {
    print("No nickname set")
}
```

#### 2. Guard Let (Early Exit Pattern)

```swift
func greet(nickname: String?) {
    guard let name = nickname else {
        print("No nickname – exiting")
        return
    }
    print("Hello, \(name)")
}
```

#### 3. Nil Coalescing (`??`)

```swift
let display = nickname ?? "Guest"
print(display)
```

#### 4. Force Unwrapping (`!`) – Avoid Unless Guaranteed Non-nil

```swift
let userName: String? = "Saritha"
let unwrapped = userName! // ⚠️ Crashes if userName == nil
```

> Warning: Prefer safe unwrapping. Force unwrap only when logically impossible to be nil (e.g., IBOutlets after view loading).

#### 5. Optional Chaining

```swift
let length = nickname?.count  // Int?
```

---

## Tuples

Group multiple values temporarily:

```swift
var info: (String, Int) = ("Shanavas", 19)
print(info.0) // "Shanavas"
print(info.1) // 19
```

Named elements:

```swift
let user = (name: "Shanavas", age: 19)
print(user.name) // "Shanavas"
```

> Use structs instead of tuples for long-lived or semantic data.

---

## Object-Oriented Basics & ARC

### Initialization & Deinitialization

```swift
class Player {
    let name: String
    init(name: String) {
        self.name = name
        print("Player \(name) created")
    }
    deinit {
        print("Player \(name) deallocated")
    }
}
```

### ARC (Automatic Reference Counting)

- Increases reference count on strong ownership.
- Deallocates when count reaches zero.
- Avoid retain cycles with `weak` / `unowned`:

```swift
class Owner {
    var pet: Pet?
}

class Pet {
    weak var owner: Owner? // prevents retain cycle
}
```

---

## Arrays vs Sets

### Arrays

```swift
var fruits: [String] = ["Apple", "Orange", "Mango", "Apple"]

print(fruits.first ?? "Empty")
print(fruits.count)

if fruits.indices.contains(2) {
    print(fruits[2])
}
fruits.append("Pear")
```

### Sets

```swift
var ids: Set<Int> = [1, 2, 3, 2]
print(ids) // Unordered, unique elements
ids.insert(4)
```

### Comparison

| Feature          | Array                         | Set                          |
|------------------|-------------------------------|------------------------------|
| Order            | Preserves insertion order     | Unordered                    |
| Duplicates       | Allowed                       | Not allowed                  |
| Membership Check | O(n)                          | O(1) average                 |
| Index Access     | Yes                           | No                           |
| Use Case         | Ordered collections           | Unique, fast lookup          |

---

## Dictionaries

Key–value storage (keys unique, unordered):

```swift
var stock: [String: Int] = [
    "Apple": 10,
    "Orange": 5
]

stock["Banana"] = 7       // Insert
let oranges = stock["Orange"] // Optional Int
```

Safe access:

```swift
if let appleCount = stock["Apple"] {
    print("Apples: \(appleCount)")
} else {
    print("No apples tracked")
}
```

Update with fallback:

```swift
let old = stock.updateValue(12, forKey: "Apple")
```

---

## Loops

### For-In Over Range

```swift
for number in 1..<5 { // 1,2,3,4
    print(number)
}

for number in 1...5 {  // 1,2,3,4,5
    print(number)
}
```

### Loop Over Collections

```swift
let fruits = ["Apple", "Orange", "Mango"]
for fruit in fruits {
    print(fruit)
}
```

### Enumerated

```swift
for (index, fruit) in fruits.enumerated() {
    print("\(index): \(fruit)")
}
```

---

## Control Flow: `break` vs `continue`

```swift
for n in 1...5 {
    if n == 3 { break }
    print(n)
}
// Prints 1 2
```

```swift
for n in 1...5 {
    if n == 3 { continue }
    print(n)
}
// Prints 1 2 4 5
```

| Statement | Behavior                    |
|-----------|-----------------------------|
| `break`   | Exits loop completely       |
| `continue`| Skips current iteration     |

---

## Higher-Order Functions: `filter`, `map`, `sorted`, `reduce`

### Example Data

```swift
struct User {
    let name: String
    let roll: Int
    let isPremium: Bool
}

let allUsers: [User] = [
    User(name: "Shanavas", roll: 10, isPremium: false),
    User(name: "Sidharth", roll: 12, isPremium: true),
    User(name: "Sumi", roll: 11, isPremium: true)
]
```

### Imperative Filtering (Verbose)

```swift
var premiumUsers: [User] = []
for user in allUsers where user.isPremium {
    premiumUsers.append(user)
}
```

### Functional Equivalent

```swift
let premiumUsers = allUsers.filter { $0.isPremium }
```

### Map (Transform)

```swift
let premiumNames = premiumUsers.map { $0.name }
```

### Sorted (Non-Mutating) vs sort (Mutating)

```swift
let sortedByRollDesc = allUsers.sorted { $0.roll > $1.roll }
// Original allUsers unchanged
```

### Reduce (Aggregation)

```swift
let totalRolls = allUsers.reduce(0) { $0 + $1.roll }
```

> Tip: Prefer chainable functional style for clarity when transformations are pure.

---

## Protocols

Define required methods/properties:

```swift
protocol HasName {
    var name: String { get }
}

struct Employee: HasName {
    let name: String
    let id: Int
}
```

Protocol with behavior:

```swift
protocol Describable {
    func describe() -> String
}

extension Employee: Describable {
    func describe() -> String {
        "Employee \(name) (#\(id))"
    }
}
```

> Note: Use protocols to enable abstraction and testability.

---

## SwiftUI View Protocol

```swift
import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .font(.title)
            .padding()
    }
}
```

- Conformance requires a `body` returning `some View`.
- `some` indicates an opaque type (compile-time specialization).

---

## Best Practices & Patterns

| Topic                   | Recommendation |
|-------------------------|---------------|
| Mutability              | Prefer `let` |
| Optionals               | Use `guard` early exits |
| Force Unwrap            | Avoid unless logically guaranteed |
| Naming                  | CamelCase (`userName`, `isPremium`) |
| Collections             | Use `Set` for uniqueness |
| Protocols               | Model behavior, not data only |
| Functional Methods      | Use for readability & immutability |
| Error Safety            | Prefer optional unwrapping over crashes |
| SwiftUI                 | Keep views small & composable |

---

## Common Pitfalls

| Pitfall | Issue | Fix |
|---------|-------|-----|
| Force unwrap | Crashes on nil | Use `if let` / `guard let` |
| Misusing dictionary append | Dictionaries don't have `append` | Use assignment |
| Typos in boolean (`False`) | Swift is case-sensitive | Use `false` |
| Using `sort` expecting new array | `sort` mutates | Use `sorted` |
| Tuple overuse | Becomes unreadable | Use a struct |
| Retain cycles | Memory leaks | Use `weak` / `unowned` |
| Array out-of-bounds | Runtime crash | Check `indices.contains(index)` |

---

## Next Steps

1. Learn Error Handling (`throws`, `try?`, `do/catch`)
2. Explore Enums with Associated Values
3. Understand Struct vs Class semantics (value vs reference)
4. Practice `Codable` for JSON parsing
5. Learn Concurrency (`async/await`, `Task`)
6. Build a small SwiftUI app

---

## Additional Resources

| Resource | Link |
|----------|------|
| Official Swift Language Guide | https://docs.swift.org/swift-book/ |
| Swift Evolution Proposals | https://github.com/apple/swift-evolution |
| Hacking with Swift (Free Tutorials) | https://www.hackingwithswift.com |
| Swift Standard Library Reference | https://developer.apple.com/documentation/swift |
| SwiftUI Documentation | https://developer.apple.com/documentation/swiftui |

---

## Practice Challenge Ideas

1. Build a `UserManager` that filters, sorts, and groups users.
2. Create a `Cache` protocol and two implementations (in-memory & disk).
3. Write a mini SwiftUI list rendering favorite lessons.
4. Parse JSON into model structs using `Codable`.

---

## Quick Reference Snippets

Optional Safe Access:

```swift
let value = optionalVar ?? defaultValue
```

Safe Array Index:

```swift
extension Array {
    subscript(safe index: Index) -> Element? {
        indices.contains(index) ? self[index] : nil
    }
}
```

Protocol with Default Implementation:

```swift
protocol Taggable {
    var tag: String { get }
}

extension Taggable {
    var tag: String { "UNDEFINED" }
}
```

---

> Keep iterating on these notes—teaching what you learn reinforces mastery.  
> Feel free to adapt or expand this README as your Swift journey progresses.

