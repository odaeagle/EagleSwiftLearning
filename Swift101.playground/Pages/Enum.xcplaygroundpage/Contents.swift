
import CoreGraphics
/*:
 
# Enums
 
 "
 An enumeration defines a common type for a group of related values and enables you to work with those values in a type-safe way within your code.

 If you are familiar with C, you will know that C enumerations assign related names to a set of integer values. Enumerations in Swift are much more flexible, and don’t have to provide a value for each case of the enumeration. If a value (known as a raw value) is provided for each enumeration case, the value can be a string, a character, or a value of any integer or floating-point type.
 "
 
 */

/*:
 
## Enums

 */

enum PostState {
    case unknown
    case empty
    case full
}

func valueFromState(_ state: PostState) -> Int {
    // Play around the following case,
    // You will notice if you miss one case
    // Swift will complain, unless you provide a default case
    
    switch state {
    case .empty:
        return 0
    case .unknown:
        return -1
    case .full:
        return 10
    }
}

print("value from state", valueFromState(PostState.empty))
print("value from state", valueFromState(.full))

/*:
### Note

 It's better to write the above function as a method to enum, yes, enum can have its own method
 */

/*:
 
## Enum with associated value
 
 */

enum Shape: Equatable {
    case triangle(width: CGFloat, height: CGFloat)
    case sqaure(length: CGFloat)
    case rectangle(width: CGFloat, height: CGFloat)
    case other

    /* Enum can have method! */
    func betterArea() -> CGFloat {
        switch self {
        case .triangle(let width, let height):
            return width * height / 2
        case .rectangle(let width, let height):
            return width * height
        default:
            return -1
        }
    }
}

func getShapeArea(_ shape: Shape) -> CGFloat {
    switch shape {
    case .triangle(let width, let height):
        return width * height / 2
    // _ means we don't care about the second value
    case .rectangle(let width, _):
        return width * width
    default:
        return -1
    }
}

print("Triangle area", getShapeArea(.triangle(width: 10, height: 15)))

// Note you have to let the enum conforms to Equatable to be able to
// compare two shapes
let shape1 = Shape.rectangle(width: 20, height: 10)
let shape2 = Shape.rectangle(width: 20, height: 10)
let shape3 = Shape.triangle(width: 20, height: 10)
print(shape1 == shape2)
print(shape2 == shape3)
