import UIKit

public func measure(name: String, times: Int = 1, block: @escaping () -> ()) {
    print("\(name)")
    let t0 = CACurrentMediaTime()
    
    (0..<times).forEach { _ in
        block()
    }
    let dt = (CACurrentMediaTime() - t0) * 1000
    print("Time: \(dt)ms")
}
