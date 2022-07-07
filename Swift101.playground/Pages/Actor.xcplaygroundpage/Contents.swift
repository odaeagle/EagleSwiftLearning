import Foundation
import UIKit

/*:

## Actor
 
 In simpliest term, Actor is a thread safe class

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
