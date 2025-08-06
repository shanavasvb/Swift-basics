var x : String? = nil
if let y = x {
    print(y)
}
else{
    print("nil")
}

let z : String? = nil
let v=z ?? "null"
print(v)