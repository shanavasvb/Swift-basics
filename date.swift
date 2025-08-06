import Foundation
let today = Date.now
print(today)

let formatter = DateFormatter()
formatter.dateStyle = .full

print("\(formatter.string(from:today))")