import UIKit

/*:
 
# Data Types
 
 ## Primitive Types

*/

// Int in Swift is 32 bits (Int32) on 32-bit platform and 64 bits (Int64) on 64-bit platform
var aInt1 = 8
var aInt2: Int = 8

// Here you actually need to specify the type otherwise
// Swift will treat it as String
var aChar: Character = "a"

// Here you actually need to specify the type otherwise
// Swift will treat it as Double
let aFloat: Float = 4.0
let aDouble = 8.0

var aMutableString = "Hello"
let aImmutableString = "world"
let aMultiLineString = """
Hello
World
"""
let formattedString = "\(aInt1) + \(aInt2) = 16"

var aBool = true

var aMutableArray = [1, 2, 3, 4]
let aImmutableArray: [String] = ["a", "b", "c"]

var aMutableDictionary = ["a": 5]
let anImmutableDictionary: [String: Int] = ["b": 6]

var aTuple1 = (1, 2)
var aTuple2: (Int, String) = (3, "hello")
var aNamedTuple = (x: 5, y: 6)

// For set, please note you have to provide the type otherwise Swift will
// treat it as Array
var aMutableSet: Set<Int> = [1, 2, 3]
let anImmutableSet: Set<Int> = [1, 2, 3, 4]

/*:
 
 ## Immutable (let) v.s. Mutable (var)
 
 */
aMutableString
aMutableString.append(contentsOf: "!Hola")
aMutableString

/* Cannot compile */
// anImmutableDictionary.append(contentsOf: "!Hola")

/*:
 ## Good to know

 Swift's primitive types comes with lots methods

 Make sure you try them out!

 Here are two methods I didn't know exist until couples of months ago

 #### bool.toggle
 
 instead of writing `aBool = !aBool`, you can write
 */
aBool.toggle()

/*:
 
 #### Int.multipleOf
 
 instead of writing `aInt1 % 3 == 0`, we can write
 */
aInt1.isMultiple(of: 3)

/*:
 
## Try it yourself

 */

let asciiChar: Character = "a"
asciiChar.isASCII
let unicodeChar: Character = "🥹"
unicodeChar.isASCII

let largeArray = Array(0..<1000)
let largeSet = Set(largeArray)

measure(name: "Array.contains", times: 10) {
    (0..<1000).forEach {
        _ = largeArray.contains($0)
    }
}

measure(name: "Set.contains", times: 10) {
    (0..<1000).forEach {
        _ = largeSet.contains($0)
    }
}

/*:
 
## Good to know
 
You may have notice the code above where I did
 
 `_ = largeArray.contains($0)`
 
 What's the `_ =`
 
 In Swift, if a function has return type (non-void), unless you annotate
 it by `@discardableResult`, if you do not store the return value, Swift
 compiler will give you a warning.
 
 To avoid seeing the warning, either you annotate the function
 with `@discardableResult`, or you do `_ =`

## Other Collections

 You may also wondering if Swift has any fancy data structures such as `Deque`, `OrderedSet`, `Heap`

 Yup, Swift has them now, check out [Swift Collections](https://github.com/apple/swift-collections)

 Now we can finally interview people with Swift properly
 */
