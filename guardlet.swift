func testguard(){
    let x:String? = nil
    guard let y=x else{
        print("value is null ")
        return
    }
    print(y)
}
testguard()