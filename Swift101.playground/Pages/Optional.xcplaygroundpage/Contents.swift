/*:
 
# Optional
 
 One of my personal favourite features in modern languages such as
 Swift and Kotlin. (You may argue that ObjcC/C++/Python/Java also have optional
 but they are not really enforced by compiler though)
 
 In Swift, any type can either be nullable or non-null
 
 assume we have a type A
 
 ```
 let a: A = ...
 ```
 
 it means `a` is non-null type of A
 
 ```
 let a: A? = ...
 ```
 
 it means `a` is nullable type of A
 
 an optional value must be unwrapped to get its value, there are many ways
 to unwrap the value
*/

var value: Int?
if Bool.random() {
    value = Int.random(in: 0..<100)
}

// unwrap with default value (👍good)
print("with default value", value ?? 888)

// if-let
if let value = value {
    print("if let:", value)
}

// simplified if-let (introduced in Swift 5.7)
// depending on your XCode version, you may not be able to run the following code
//if let value {
//    print("new if let:", value)
//}

// Of course, you can also do guard
// I have to comment out the following because guard can only be used inside a function
//guard let value = value else {
    // do stuff if value is nil
//}

// Force-unwrap (👎bad practice), will crash if value is nil
// I will not let this go into production, ever
// The following line may cause a crash depending on the random value generated
print("Force Unwrap", value!)

/*:
 ## Optional Chaining
 
 "Optional chaining is a process for querying and calling properties, methods, and subscripts on an optional that might currently be nil. "
 
 Say we have the following array, which is an optional array that contains optional Int
 
 ```
 let arr: [Int?]? = [1, 2, 3]
 ```
 
 We want to access the second element, please note
 
 - the array itself might be nil
 - the array may not even have enough elements
 - the second element in arr might be nil
 
 Take a minute to think about how ugly the code will be if you write this in another language
 But of course, following example is quite a extreme case, it's very rare to run into
 situation like this
 */

let arr: [Int?]? = [1, 2, 3]

// Solution 1 😇

if
    let arr = arr,
    let element = arr[safe: 1] {
    let element = element ?? 5
    print("Solution 1 \(element)")
}

// Solution 2 😈
let element = (arr?[safe: 1] ?? nil) ?? 5
print("the second element is \(element)")

/*:
 ## Another commonly used pattern
 
 I am sure you dealt with something like this before
 
 ```
 SomeType *element1 = getElement1();
 SomeType *element2 = getElement2();
 SomeType *element3 = getElement3();
 NSMutableArray *arr = [[NSMutableArray alloc] init];
 if (element1) {
    [arr addObject: element1];
 }
 if (element2) {
    [arr addObject: element2];
 }
 if (element3) {
    [arr addObject: element3];
 }
 ```
 
 How can we make it better in Swift?
 */

// Solution 1

func getIntOrNil() -> Int? {
    return [1, 2, 3, nil].randomElement() ?? nil
}

let a1 = getIntOrNil()
let a2 = getIntOrNil()
let a3 = getIntOrNil()
let intArr1: [Int] = [a1, a2, a3].compactMap { $0 }
print(intArr1)

// Solution 2

var intArr2 = [Int]()
a1.map { intArr2.append($0) }
a2.map { intArr2.append($0) }
a3.map { intArr2.append($0) }
print(intArr2)


/*:
 ## Other optional
 
 There are other siuation we use optinoal
 
 ```
 something as? Type
 try? something
 ```

 ## Double/Triple optional
 Yes, such thing exist, but rarely

 Int?

 Int??

 Int???

 */



