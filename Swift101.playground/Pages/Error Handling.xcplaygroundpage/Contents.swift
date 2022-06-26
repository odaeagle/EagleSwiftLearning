/*:
 
# Error Handling
 
 WIP 🚧
 
 "
 Error handling is the process of responding to and recovering from error conditions in your program. Swift provides first-class support for throwing, catching, propagating, and manipulating recoverable errors at runtime.
 "
 
 ```
 do {
     try expression
     statements
 } catch pattern 1 {
     statements
 } catch pattern 2 where condition {
     statements
 } catch pattern 3, pattern 4 where condition {
     statements
 } catch {
     statements
 }
 ```
 
 */

enum MyError: Error {
    case outOfRange
    case empty
    case overflow
}

// A function that may potentially throw an error
func doSomethingThatMayFail(_ n: Int) throws -> Int {
    if n < 10 {
        throw MyError.outOfRange
    } else if n < 20 {
        throw MyError.empty
    } else if n < 30 {
        throw MyError.overflow
    } else {
        return n + 5
    }
}

// following line will get an error message
// Call can throw but is not marked with 'try'
//_ = doSomethingThatMayFail(5)

// run the function, if it throws, it will crash
// Note here result1 will be Int
let result1: Int = try doSomethingThatMayFail(88)
print(result1)

// run the function, if it throws, we got nil
// Note here result2 will be Int?
let result2: Int? = try? doSomethingThatMayFail(20)
print(result2 ?? "nil")

// Complete Error handling

do {
    let value = Int.random(in: 0..<100)
    let result = try doSomethingThatMayFail(value)
    print("Finish running", result)
} catch MyError.outOfRange {
    print("Got out of range error")
} catch MyError.empty {
    print("Got empty error")
} catch MyError.overflow {
    print("Got overflow error")
}
