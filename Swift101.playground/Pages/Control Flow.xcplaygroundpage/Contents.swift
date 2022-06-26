import Foundation

/*:
 
 # Control Flow

 "
 Swift provides a variety of control flow statements. These include while loops to perform a task multiple times; if, guard, and switch statements to execute different branches of code based on certain conditions; and statements such as break and continue to transfer the flow of execution to another point in your code.

 Swift also provides a for-in loop that makes it easy to iterate over arrays, dictionaries, ranges, strings, and other sequences.

 Swift’s switch statement is considerably more powerful than its counterpart in many C-like languages. Cases can match many different patterns, including interval matches, tuples, and casts to a specific type. Matched values in a switch case can be bound to temporary constants or variables for use within the case’s body, and complex matching conditions can be expressed with a where clause for each case.
 "

 ## If

 ### A lot less brackets! (Shame on you Kotlin)
 */

if 3 > 2 {
    print("3 > 2")
}

if 3 > 2 && 4 > 2 {
    print("3 > 2 and 4 > 2")
}

// You don't have to use &&
if 3 > 2,
   4 > 2 {
    print("3 > 2 and 4 > 2")
}

if 3 > 9 || 4 > 2 {
    print("4 > 2")
}

/*:
 ## Guard

 ### The purpose of guard is a compiler-forced exit from the invariant.

 I am sure you have the following code before
 
 ```
 if something == nil {
    return nil
 }
 ```
 
 now you can do
 
 ```
 guard something != nil else {
    return nil
 }
 ```

 You may think, what's the benefit of guard?

 - It's compiler-forced, that means in guard you have to either return or throw.
 - Reducing nesting when testing invariants.
 - It's for better clarity.
 */

// make sure certain condition is met before moving forward

func guardExample(_ n: Int) {
    guard n > 3 else {
        print("1 > 3 is not true")
        // Try comment out the following line see what's gonna happen
        return
    }
    print("I am here!")
}

guardExample(2)
guardExample(4)

/*:
 
 ## Ternary Operator
 
 Condition ? A : B

 Well, in Meta I see we use ternary operator very heaviliy 😂
 */

_ = 3 > 2 ? 5 : 8

/*:
 ## Switch/Case
 
 ### Important Note
 - Swift's Switch-Case *DOES NOT* fall through (no need to provide break)
 - Every switch statement must be exhaustive
 */

func switchCaseExample(_ n: Int) {
    switch n {
    case 1:
        print("Getting 1")
    case 2, 3, 4:
        print("Getting 2 - 4")
    default:
        print("Getting something else")
    }
}

switchCaseExample(3)
switchCaseExample(10)

/*:
 ## Loops
 
 ### for-in to access a sequence (Array/Range/Set/Dictionary/etc...)
 */

let arr = [0, 1, 2, 3, 4]

print("Content only")
for n in arr {
    print(n)
}

print("Reversed content only")
for n in arr.reversed() {
    print(n)
}

print("Index/Content")
for (i, n) in arr.enumerated() {
    print(i, n)
}

print("Index only")
for i in arr.indices {
    print(i, arr[i])
}

print("Exclusive Range")
for n in 0..<5 {
    print(n)
}

print("Inclusive Range")
for n in 0...5 {
    print(n)
}

print("Stride")
for n in stride(from: 0, through: 5, by: 2) {
    print(n)
}

print("with where")
for n in 0..<10 where n.isMultiple(of: 2) {
    print(n)
}

// Please note Dictionary in Swift is not ordered
// Sorry Python folks
print("scan a dictionary")
let aDict = ["c": 5, "a": 8, "b": 10]
for (k, v) in aDict {
    print("\(k) -> \(v)")
}

/*:
 
 ### While
 */

var n = 100
while n > 0 {
    n = n / 3
    print("n = ", n)
}

/*:
 
 ### Higher-Order functions

 Definition (Will be tested in Final Exam)

 *A higher order function is a function that takes a function as an argument, or returns a function*
 
 You will find it's less likely for you use old fashion loops in Swift because Swift comes with a fleet of very useful Higher-order functions such as `map`, `filter`, `reduce`, `sorted`
 */

let newArr1 = arr.map { $0 * 2 }
let newArr2 = arr.map { x in
    x * 2
}
let newArr3 = arr.filter { $0.isMultiple(of: 2) }
let arrSum = arr.reduce(0, { $0 + $1 })
let firstEven = arr.first(where: { $0.isMultiple(of: 2) })
let firstEvenIndex = arr.firstIndex(where: { $0.isMultiple(of: 2) })

// You can also invent your own higher-order function (we will cover detail about function/closure later)
// The following function will check if every element in `items` meet certain `condition`
func all<S: Sequence, T>(items: S, condition: (T) -> Bool) -> Bool where S.Element == T {
    items.reduce(true, { $0 && condition($1) })
}

// Pop Quiz
// Why do we do `$0 && condition($1)`
// Can we write `condition($1) && $0`

print(all(items: [2, 4, 6], condition: { $0.isMultiple(of: 2) }))
print(all(items: [2, 3, 6, 8, 9, 10], condition: { $0.isMultiple(of: 2) }))
// trailing closure can be simplifed as following line
print(all(items: [2: "a", 4: "b", 6: "c"]) { $0.key.isMultiple(of: 2) })

// Now we can write a isPrime function using our `all` as helper
// and why not make it a one-liner (Please do not do this in production code)
func isPrime(_ n: Int) -> Bool {
    all(items: 2..<Int(floor(sqrt(Double(n)))) + 1) { !n.isMultiple(of: $0) }
}

/*:
 For fun, here is the same isPrime function implemented in Python & Racket (LISP)
 
 Python 3
 
 ```
 def is_prime(n: int) -> bool:
     return all(n % x > 0 for x in range(2, int(n ** 0.5) + 1))
 ```
 Racket
 
 ```
 (define (is-prime? n)
   (andmap (lambda (x) (positive? (remainder n x)))
           (range 2 (add1 (floor (sqrt n))) 1)))
 ```
 */

print(isPrime(2))
print(isPrime(3))
print(isPrime(4))
print(isPrime(64))
print(isPrime(17))

/*:
 
 ### Higher-Order functions Gotcha
 
 Use `lazy` when you want to perform chained operations, by default `map`, `filter` will return
 a new Array, by putting `lazy` we can avoid allocating intermediate memory
 
 If you speak Python3, you may know that by default Python3's `map` `filter` will return a `generator` which is
 very similar in concept
 */

measure(name: "Without lazy") {
    _ = Array(0..<10000).filter {
        $0.isMultiple(of: 2)
    }.map {
        $0 + 1
    }.reduce(0, {
        $0 + $1
    })
}

measure(name: "With lazy") {
    _ = Array(0..<10000)
        .lazy.filter {
            $0.isMultiple(of: 2)
        }.map {
            $0 + 1
        }.reduce(0, {
            $0 + $1
        })
}

/*:
 
 ### Good Practice and Good to know
 
 ```
 let myRange = 0..<5
 let reversedMyRange = myRange.reversed()
 ```
 
 Most operations such as range/reversed does not create
 new memory, think about it as a wrapper for original content
 */

measure(name: "Old fashion", times: 10) {
    var s = 0
    for i in stride(from: 99, through: 0, by: -1).reversed() {
        s += i
    }
}

measure(name: "Swifty Way", times: 10) {
    var s = 0
    for i in (0..<100).reversed() {
        s += i
    }
}

/*:

 ### TDIL

 For-in is faster than while lol

 I tried this because in Python it's the same thing, the reason being
 Python's for-in loop is backed up by C, but while loop is not
 */

let bigArray = Array(0..<1000)

measure(name: "For-in", times: 100) {
    var s = 0
    for n in bigArray {
        s += n
    }
}

measure(name: "While", times: 100) {
    var i = 0
    var s = 0
    while i < bigArray.count {
        s += bigArray[i]
        i += 1
    }
}


