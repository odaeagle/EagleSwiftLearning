//
//  BankTransactionViewModel.swift
//  AsyncAwaitApp
//
//  Created by Eagle Diao on 2022-06-24.
//

import SwiftUI
import Foundation

class BankTransactionViewModel: ObservableObject {
    
    static let depositCount = 10000
    static let depositAmount = 1
    
    @Published var safeBalance: Int
    @Published var unsafeBalance: Int
    
    let accountSafe = SafeBankAccount(balance: 0)
    let accountUnsafe = UnsafeBankAccount(balance: 0)
    
    init() {
        safeBalance = 0
        unsafeBalance = 0
    }

    @MainActor
    func finalizeAccount(safeBalance: Int, unsafeBalance: Int) {
        self.safeBalance = safeBalance
        self.unsafeBalance = unsafeBalance
    }
    
    func startDeposit() {
        Task { [weak self] in
            print("At", Thread.current)
            
            let accountSafe = self?.accountSafe
            let accountUnsafe = self?.accountUnsafe
            
            await withTaskGroup(of: Void.self) { group in
                for _ in 0..<Self.depositCount {
                    group.addTask {
                        await accountSafe?.deposit(amount: Self.depositAmount)
                    }
                    group.addTask {
                        accountUnsafe?.deposit(amount: Self.depositAmount)
                    }
                }
            }
            
            let safeBalance = await accountSafe?.balance ?? 0
            let unsafeBalance = accountUnsafe?.balance ?? 0
            await self?.finalizeAccount(safeBalance: safeBalance, unsafeBalance: unsafeBalance)
            print("Deposit Over")
        }
    }
}
