/*:
 
# Protocol
 
 WIP 🚧
 
 "
 A protocol defines a blueprint of methods, properties, and other requirements that suit a particular task or piece of functionality. The protocol can then be adopted by a class, structure, or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to conform to that protocol.

 In addition to specifying requirements that conforming types must implement, you can extend a protocol to implement some of these requirements or to implement additional functionality that conforming types can take advantage of.
 "
 
 */
protocol AProtocol {
    
    var readOnlyMember: Int {get}
    
    var mutableMember: Int {get set}
    
    func method1(value: Int)
    
    func method2(value: Int)
    
}

class AStruct: AProtocol {
    
    // Protocol requires this member to be read-only
    // doesn't mean you have to make it read-only
    var readOnlyMember: Int
    
    // you can make it a calculated member
    // because protocol says {get}
//    var readOnlyMember: Int {
//        return mutableMember * 2
//    }
    
    var mutableMember: Int
    
    init() {
        readOnlyMember = 8
        mutableMember = 9
    }
    
    func method1(value: Int) {
        mutableMember += value
    }
    
    func method2(value: Int) {
        readOnlyMember += value
    }
}

/*:
 
# Extension
 
 "
 Extensions add new functionality to an existing class, structure, enumeration, or protocol type. This includes the ability to extend types for which you don’t have access to the original source code (known as retroactive modeling). Extensions are similar to categories in Objective-C. (Unlike Objective-C categories, Swift extensions don’t have names.)
 "
 
 Extension is one of my favourite feature from Swift, let me show you couples of interesting example usage of
 extension
 */

/*:
 
 ## Provide additional feature to existing class/struct
 
 following example add a helper method to array of any numeric value
 to calculate the sum (this example also uses Generics which will be covered later)
 */

extension Array where Element: Numeric {
    
    func sum() -> some Numeric {
        reduce(0, { $0 + $1 })
    }
}

print("Sum of ints", [1, 2, 3, 4].sum())
print("Sum of doubles", [1.0, 2.5, 3.0, 4.8].sum())

/*:
 
 ## Provide additional constructor to struct
 
 Recall our previous encounter with Struct, Swift will
 automatically generate constructor for your struct, however, if you
 provide your own, the generated one will get replaced by yours, what if
 you want to keep both? Extension!
 
 */

struct Posn {
    let x: Int
    let y: Int
}

extension Posn {
    init(x: Int) {
        self.x = x
        self.y = 888
    }
}

let p1 = Posn(x: 2, y: 4)
let p2 = Posn(x: 8)

/*:
 
 ## Provide default implementation to protocol
 
 */

protocol BProtocol {
    func method1() -> Int
    func method2() -> Int
}

extension BProtocol {
    /* this is a default implementation for anything that conform to BProtocol */
    func method1() -> Int {
        888
    }
}

// Note here we don't even have to provide an implementation
// for method1
struct BStruct: BProtocol {
    func method2() -> Int {
        method1() + 8
    }
}

let bstruct = BStruct()
bstruct.method1()
bstruct.method2()
