//
//  BankAccount.swift
//  AsyncAwaitApp
//
//  Created by Eagle Diao on 2022-06-22.
//

import Foundation

actor SafeBankAccount {
    let interestRate = 0.002
    var balance: Int
    
    init(balance: Int = 0) {
        self.balance = balance
    }
    
    func deposit(amount: Int) {
        print("deposit safe", Thread.current)
        balance += amount
    }
    
    func withdraw(amount: Int) -> Bool {
        print("withdraw safe", Thread.current)
        guard balance >= amount else {
            return false
        }
        balance -= amount
        return true
    }
}


class UnsafeBankAccount {
    let interestRate = 0.002
    var balance: Int
    
    init(balance: Int = 0) {
        self.balance = balance
    }
    
    func deposit(amount: Int) {
        print("deposit not safe", Thread.current)
        balance += amount
    }
    
    func withdraw(amount: Int) -> Bool {
        print("withdraw not safe", Thread.current)
        guard balance >= amount else {
            return false
        }
        balance -= amount
        return true
    }
}
