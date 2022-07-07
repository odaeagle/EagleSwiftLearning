import UIKit

/*:

## Struct

 "
 Structures and classes are general-purpose, flexible constructs that become the building blocks of your program’s code. You define properties and methods to add functionality to your structures and classes using the same syntax you use to define constants, variables, and functions.

 Unlike other programming languages, Swift doesn’t require you to create separate interface and implementation files for custom structures and classes. In Swift, you define a structure or class in a single file, and the external interface to that class or structure is automatically made available for other code to use.
 "
 */

struct Posn {
    let x: CGFloat
    let y: CGFloat
}

// Struct's constructor can be auto generated
let p = Posn(x: 10, y: 15)

/*:
 You can provide your own constructor too
 However, you will lose the generated one (I will show you how to get both later)
 */

struct Triangle {
    let width: CGFloat
    let height: CGFloat

    init(width: CGFloat) {
        self.width = width
        self.height = self.width * 2
    }
}

let t = Triangle(width: 20)
// This will not work anymore
// However, there is a way to make both work
// Just wait until we talk about Extensions
//let t2 = Triangle(width: 20, height: 80)

/*:

 You can also add method/default instance variable

 */

struct SomeStruct {
    var value1: Int
    var value2: Int = 8
    var value3: Int

    var calculatedVariable: Int {
        value1 + value2
    }

    func sum() -> Int {
        value1 + value2 + value3
    }
}

// Note that the generated constructor
// automatically make value2 a optional parameter
_ = SomeStruct(value1: 2, value3: 4)
let ss1 = SomeStruct(value1: 2, value2: 3, value3: 4)
print("calculated value", ss1.calculatedVariable)
print("sum", ss1.sum())

struct SomeStruct2 {
    let value1: Int
    let value2: Int = 8
    let value3: Int
}

// Note that because everything is `let`
// so the generated constructor will only
// have `value1` and `value2`
_ = SomeStruct2(value1: 2, value3: 4)

/*:

 ## Why do we need struct?

 You may wonder now, why do we need struct
 It's almost like class, any reason we need them both?
 check out Class v.s. Struct v.s. Enum v.s. Actor

 */





