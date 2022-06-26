import Foundation

/*:
 
# Functions and Closures

 "
 Functions are self-contained chunks of code that perform a specific task. You give a function a name that identifies what it does, and this name is used to “call” the function to perform its task when needed.

 Swift’s unified function syntax is flexible enough to express anything from a simple C-style function with no parameter names to a complex Objective-C-style method with names and argument labels for each parameter. Parameters can provide default values to simplify function calls and can be passed as in-out parameters, which modify a passed variable once the function has completed its execution.

 Every function in Swift has a type, consisting of the function’s parameter types and return type. You can use this type like any other type in Swift, which makes it easy to pass functions as parameters to other functions, and to return functions from functions. Functions can also be written within other functions to encapsulate useful functionality within a nested function scope.
 "

 ## Function with named parameters
 */


func aFunction1(para1: Int, para2: Int) -> Int {
    return para1 + para2
}

// If your function only have one statement which is also the result
// you don't need return (This is very functional programming style)
func aFunction1NoReturn(para1: Int, para2: Int) -> Int {
    para1 + para2
}

func aFunction2(para1: Int, para2: Int) {
    _ = para1 + para2
}

let result1 = aFunction1(para1: 5, para2: 8)
aFunction2(para1: 2, para2: 3)

/*:
 
 ## Function with unnamed parameters
 */

func aFunction3(_ para1: Int, para2: Int) -> Int {
    return para1 + para2
}

let result2 = aFunction3(8, para2: 3)

/*:
 
 ## Function with varargs
 */

func aFunction4(para1: Int...) {
    print("Number of arguments \(para1.count)")
    para1.enumerated().forEach { (index, element) in
        print("Argument: \(index) Element: \(element)")
        
    }
}
aFunction4(para1: 3)
aFunction4(para1: 4, 5, 6)

/*:
 
 ## Function that has side effect.
 
 You may wonder why we need such `inout` keyword

 if we want to mutate items, this is because Array are value types (will be covered in later chapter)
 */

func aFunction5(items: inout [Int]) {
    items.indices.forEach {
        items[$0] += 1
    }
}

func aFunction5NoEffect(items: [Int]) {
    // This line is important because by default
    // all parameters are `let` instead of `var`
    var items = items
    items.indices.forEach {
        items[$0] += 1
    }
}

var items = [1, 2, 3, 4]
print("Before: \(items)")
aFunction5(items: &items)
print("After: \(items)")
aFunction5NoEffect(items: items)
print("After: \(items)")

/*:
 
 ## Function with default parameters
 */

func aFunction7(_ para1: Int = 2, para2: Int = 4) -> Int {
    return para1 + para2
}

_ = aFunction7()
_ = aFunction7(2)
_ = aFunction7(2, para2: 8)

/*:

 ## Function Design Best Practice

 `I always ask: “Do you need this parameter?” and “Can the call site read like a sentence?”` - Adam

 `updateThing(_ thing: Thing)`

 is less desirable than

 `update(thing: Thing)`

 which is less desirable than

 `updateThing(with otherThing: Thing)`

 Let's look at the callsites

 `updateThing(thing)` - repetition, looks like thing itself is being updated

 `update(thing: thing)` - repetition, unclear if self or thing is being updated

 `updateThing(with: otherThing)` - no repetition, clear that the parameter is the context for the update on self

 [Swift Official API Design Guidelines](https://www.swift.org/documentation/api-design-guidelines/)
 */

/*:
 
 ## Closure

 Closures are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.

 Closures can capture and store references to any constants and variables from the context in which they’re defined. This is known as closing over those constants and variables. Swift handles all of the memory management of capturing for you.

 closure is very similar to objc's block or python/java's lambda
 
 Above example when we do `forEach` we actually pass in a closure
 
 */

func aFunction6(items: [Int], op: (Int, Int) -> Int) {
    for n in items {
        print("Before \(n) After \(op(n, 5))")
    }
}

// Complete form
aFunction6(items: [1, 2, 3], op: { (x, y) -> Int in
    x + y
})

// You don't have to provide the closure result type
// because it can be implied in this case
aFunction6(items: [1, 2, 3], op: { (x, y) in
    x + y
})

// You can futher simplify it without providing
// parameter names
aFunction6(items: [1, 2, 3], op: {
    $0 - $1
})

/*:

 ### Whenever you call a function with closure as last paramter, you should use the following style
 */

// If the closure is the last argument, you can further
// simplify it by this
aFunction6(items: [1, 2, 3]) {
    $0 / $1
}

// If your closure is complicated (more than 1 line)
// you need add return
aFunction6(items: [1, 2, 3]) {
    let a = $0 * $1
    let b = $0 + $1
    return a + b
}

/*:

 ### In extreme cases we have multiple closure parameters, for example, a function from `UIView`

 ```
 class func animate(
     withDuration duration: TimeInterval,
     delay: TimeInterval,
     options: UIView.AnimationOptions = [],
     animations: @escaping () -> Void,
     completion: ((Bool) -> Void)? = nil
 )
 ```
 you may want to do the following just for better clarity

 ```
 UIView.animate(withDuration: 1, animations: {
    ...
 }, completion: {
    ...
 })
 ```
 */

/*:
 
 ## Provide a typealias to a closure
 
 It's a good style to name a closure type if it's used
 frequently for better readibility
 
 */

typealias MappingFunc = (Int, Int) -> Int
func aFunction7(items: [Int], op: MappingFunc) {
    for n in items {
        print("Before \(n) After \(op(n, 5))")
    }
}
/*:
 
 ## Escaping closure
 
 "
 A closure is said to escape a function when the closure is passed as an argument to the function, but is called after the function returns. When you declare a function that takes a closure as one of its parameters, you can write @escaping before the parameter’s type to indicate that the closure is allowed to escape.

 One way that a closure can escape is by being stored in a variable that’s defined outside the function. As an example, many functions that start an asynchronous operation take a closure argument as a completion handler. The function returns after it starts the operation, but the closure isn’t called until the operation is completed—the closure needs to escape, to be called later. For example:
 "
 */

func doSomethingExpensive(completion: @escaping (Int) -> Void) {
    DispatchQueue.global(qos: .userInitiated).async {
        // simulate a one second delay
        Thread.sleep(until: .now.addingTimeInterval(1))
        let randomNumber = Int.random(in: 0..<100)
        DispatchQueue.main.async {
            completion(randomNumber)
        }
    }
}

doSomethingExpensive(completion: {
    print("You spent 1 second to get: \($0)")
})






          
        
