/*:

# Value Type v.s. Reference Type
 
 WIP 🚧

 Types in Swift fall into one of two categories,

 *value types* and *reference types*

 technically, *value types* means each instance keep a unique copy of its data, and *refernce types* instances share a single copy of the data.

 In simple terms, when you assign/initialize/argument pass a *value type* will create its own unique copy of its data.

 For example, Int is a value type, changing b does not affect a
 But you may wonder, a will not be changed in any language right? because
 we are only changing the variable b
 */
var a = 5
var b = a
b = 8
print(a, b)

/*:
 Check out the following example, we use both class/struct to represent
 a position in 2D
 */

struct PosnStruct {
    var x: Int
    var y: Int
}

class PosnClass: CustomStringConvertible {
    var x: Int
    var y: Int

    init(x: Int, y: Int) {
        self.x = x
        self.y = y
    }

    // Btw, Struct also auto generate a `description`
    // but for class we have to provde our own `description`
    var description: String {
        "PosnClass(x: \(self.x), y: \(self.y))"
    }
}

let ps = PosnStruct(x: 5, y: 4)
var psCopy = ps
psCopy.x = 99
psCopy.y = 999

// You will notice ps does not change
// because psCopy is indeed a copy
print("ps", ps)
print("psCopy", psCopy)

let pc = PosnClass(x: 5, y: 4)
var pcCopy = pc
pcCopy.x = 99
pcCopy.y = 999

// You will we print out same thing
// because pc/pcCopy are aliases
print("pc", pc)
print("pCCopy", pcCopy)

/*:
 Other common value types to watch out

 String/Array/Dictionary/etc...
 */

// non-destructive append sum of the array
func addElement(_ arr: [Int]) -> [Int] {
    var arr = arr
    arr.append(arr.reduce(0, { $0 + $1 }))
    return arr
}

var before1 = [1, 2, 3]
let after1 = addElement(before1)
print("before", before1, "after", after1)

// destructive append sum of the array
func addElementD(_ arr: inout [Int]) {
    arr.append(arr.reduce(0, { $0 + $1 }))
}

var before2 = [1, 2, 3]
print("before", before2)
addElementD(&before2)
print("after", before2)

/*:
 var v.s. let
 */

let pc1 = PosnClass(x: 10, y: 10)
let ps1 = PosnStruct(x: 10, y: 20)

// This works, because pc1 stores the reference
// let applies to the reference, not the content
pc1.x = 8

// This does not compile, because ps1 is read-only
// and ps1 is value type
// ps1.x = 9

/*:
 More on struct
 */

struct Event {

    var time: Int
    var name: String

    func returnOnly() -> Int {
        time / 2
    }

    // This does not work because struct
    // by default is immutable
//    func move() {
//        time += 10
//    }

    // If you really want to make a mutable struct
    // you can do
    mutating func move() {
        time += 10
    }
}

/*:
 🚧 WIP

 Explain COW


 */
