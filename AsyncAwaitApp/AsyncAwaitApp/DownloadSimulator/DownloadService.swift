//
//  DownloadService.swift
//  AsyncAwaitApp
//
//  Created by Eagle Diao on 2022-06-25.
//

import Foundation

final class DownloadService {
    
    static let shared = DownloadService()
    
    func download(id: String, target: Int) async -> String {
        guard target > 0 else {
            return "Invalid target"
        }
        
        let start = DispatchTime.now()
        
        var found = [2]
        while found.count < target {
            var curr = (found.last ?? 2) + 1
            while !found.allSatisfy({ !curr.isMultiple(of: $0) }) {
                curr += 1
            }
            found.append(curr)
        }
        let end = DispatchTime.now()
        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
        let timeInterval = Double(nanoTime) / 1_000_000
        let prime = found.last ?? 2
        
        return "\(target)th prime number is \(prime), total cost: \(timeInterval)ms"
    }
    
    @discardableResult
    func runExpensiveCode(target: Int) async -> String {
        await download(id: "", target: target)
    }
    
}
