/*:
 
# Generics & Inheritance Best Practice

 WIP 🚧
 */

var mixed = [Vehicle]()
mixed.append(contentsOf: carVehicles)
mixed.append(contentsOf: bicycleVehicles)

/*:
 
## Bad Practice

 The following function requires a dynamic dispatching

 Basically Swift have to figure out to call Car's move or Bicycle's move in runtime
 */
func bad(vehicles: [Vehicle]) {
    vehicles.forEach {
        $0.move(verbose: false)
    }
}

/*:
 
## Good Practice #1

 We provide the generics, thus swift will figure out which method to call
 in compilation time, which is static dispatching
 
 But here is a catch, if you have an array that has mixed types of vehicle
 You can't use this function
 */
func good1<T: Vehicle>(vehicles: [T]) {
    vehicles.forEach {
        $0.move(verbose: false)
    }
}

/*:
 
## Good Practice #2

 existential any, first introduced in Swift 5.6

 Instead of providing generics, we use keyword `any`

 swift will still try to figure out which method to call in compilation time
 as much as possible, in the worst case it will do dynamic dispatching at runtime

 but still much faster than traditional dynamic dispatching
 
 This way allow us to call this function with mixed vehicles
 */
func good2(vehicles: [any Vehicle]) {
    vehicles.forEach {
        $0.move(verbose: false)
    }
}

/*:
 
## Try it yourself

 */

measure(name: "Bad Practice", times: 100) {
    bad(vehicles: carVehicles)
    bad(vehicles: bicycleVehicles)
//    bad(vehicles: mixed)
}


measure(name: "Good Practice 1", times: 100) {
    good1(vehicles: carVehicles)
    good1(vehicles: bicycleVehicles)
    // This line doesn't compile because
    // mixed contains Vechile
//    good1(vehicles: mixed)
}

measure(name: "Good Practice 2", times: 100) {
    good2(vehicles: carVehicles)
    good2(vehicles: bicycleVehicles)
    // This works!
//    good2(vehicles: mixed)
}

