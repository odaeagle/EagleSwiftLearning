/*:
 
# Async & Await

 WIP 🚧
 */

import Foundation
import UIKit

func doSomething() async -> Int {
    print("Start", Thread.current)
    Thread.sleep(forTimeInterval: 1)
    print("End", Thread.current)
    return 5
}

@MainActor func finalizeSomething() async {
    print("Finalize", Thread.current)
}

Task.detached() {
    let result = await doSomething()
    await finalizeSomething()
    print("Result is", result)
    print("Result on", Thread.current)
}

print("Im done on", Thread.current)
