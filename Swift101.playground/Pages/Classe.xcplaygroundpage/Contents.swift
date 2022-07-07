/*:
 
# Class
 
 "
 Structures and classes are general-purpose, flexible constructs that become the building blocks of your program’s code. You define properties and methods to add functionality to your structures and classes using the same syntax you use to define constants, variables, and functions.

 Unlike other programming languages, Swift doesn’t require you to create separate interface and implementation files for custom structures and classes. In Swift, you define a structure or class in a single file, and the external interface to that class or structure is automatically made available for other code to use.
 "
 */


func getRandomValue() -> Int {
    print("Get random value called")
    return Int.random(in: 0..<20)
}

/*:
 
## Base Class Example
 
 */

class ParkingManager: CustomStringConvertible {
    
    // Private read-only member
    private let capacity: Int
    
    // Public read-only member
    // But can be mutated internally
    private(set) var totalCars: Int
    
    // Public mutable member
    var randomValue1: Int
    
    // Public read-only member
    let randomValue2: Int = 8
    
    // Lazy members
    lazy var lazyMember1 = getRandomValue()
    lazy var lazyMember2: Int = {
        print("Generate lazyMember2")
        return 5
    }()
    
    // Calculated member
    var remainingCapacity: Int {
        capacity - totalCars
    }
    
    // init
    init(capacity: Int) {
        print("Init a parking with \(capacity)")
        self.capacity = capacity
        totalCars = 0
        randomValue1 = 8
    }
    
    // convenience init
    convenience init() {
        self.init(capacity: 10)
    }
    
    // destroyer
    deinit {
        print("Parking manager deallocated", ObjectIdentifier(self))
    }
    
    func enter() {
        self.totalCars += 1
    }
    
    func exit() {
        self.totalCars -= 1
    }
    
    // just like `toString` in java
    // You have to conform to `CustomStringConvertible`
    var description: String {
        "PM Capacity: \(capacity) Remains: \(remainingCapacity) @\(ObjectIdentifier(self))"
    }
}


func testInit() {
    let pm = ParkingManager(capacity: 20)
    // because lazyMember1 is ... lazy
    // if you don't use it, `getRandomValue` is not called
    // uncomment the following code to see the log show up
    
//    pm.lazyMember1
//    pm.lazyMember2
    
    pm.enter()
    pm.enter()
    print("Remaining capacity", pm.remainingCapacity)
    print(pm)
}

testInit()

/*:
 
## Example Child Class
 
 */

class AdvancedParkingManager: ParkingManager {
    
    private var additionalMember: Int
    
    override init(capacity: Int) {
        additionalMember = 88
        super.init(capacity: capacity)
    }
    
    override func enter() {
        super.enter()
        self.randomValue1 += 8
    }
}

let apm = AdvancedParkingManager()
