import Foundation

public protocol Vehicle {
    var name: String {get set}
    func move(verbose: Bool)
}

public class Bicycle: Vehicle {
    
    public var name: String
    public var wheels: Int
    
    init(name: String, wheels: Int) {
        self.wheels = wheels
        self.name = name
    }
    
    public func move(verbose: Bool = false) {
        if verbose {
            print("\(self.name) with \(self.wheels) is moving!")
        }
    }
}

public class Car: Vehicle {
    
    public var name: String
    public var make: String
    
    init(name: String, make: String) {
        self.name = name
        self.make = make
    }
    
    public func move(verbose: Bool = false) {
        if verbose {
            print("\(self.name) \(self.make) is moving!")
        }
    }
}

public let makes = ["Honda", "Audi", "Toyota", "Volkswagan", "Ford", "Dodge", "Chevy", "BMW", "BENZ"]

public let bicycleVehicles = (0..<10).map {
    Bicycle(name: makes[$0 % makes.count], wheels: $0 % 4 + 1)
}
public let carVehicles = makes.map {
    Car(name: $0, make: $0)
}


