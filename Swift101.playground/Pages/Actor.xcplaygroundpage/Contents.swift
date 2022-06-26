import Foundation
import UIKit

/*:

## Actor
 
 WIP 🚧

 */

actor SavingAccount {
    let interestRate = 0.002
    var balance: Int
    
    init(balance: Int = 0) {
        self.balance = balance
    }
    
    func deposit(amount: Int) {
        print("deposit", Thread.current)
        balance += amount
    }
    
    func withdraw(amount: Int) -> Bool {
        print("withdraw", Thread.current)
        guard balance >= amount else {
            return false
        }
        balance -= amount
        return true
    }
}

let account = SavingAccount(balance: 0)

func makeDeposit() async -> Bool {
    Thread.sleep(forTimeInterval: TimeInterval.random(in: 1..<2))
    await account.deposit(amount: 100)
    return true
}

Task {
    print("Start", Thread.current)
    async let result1 = makeDeposit()
    async let result2 = makeDeposit()
    async let result3 = makeDeposit()
    
    let results = await [result1, result2, result3]
    print(results)
}
