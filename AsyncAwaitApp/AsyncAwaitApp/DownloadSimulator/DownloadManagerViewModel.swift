//
//  DownloadManager.swift
//  AsyncAwaitApp
//
//  Created by Eagle Diao on 2022-06-25.
//

import Foundation



class DownloadManagerViewModel: ObservableObject {
    
    @Published private(set) var tasks: [DownloadTask]
    
    var maxNumberOfParallelTasks = 3
    
    
    init() {
        tasks = [
            .init(name: "Task1", url: "abc", status: .idle, target: 1000),
            .init(name: "Task2", url: "abc", status: .cancelled, target: 1000),
            .init(name: "Task3", url: "abc", status: .finished, target: 1000),
            .init(name: "Task4", url: "abc", status: .inProgress(20), target: 1000)
        ]
    }
    
    func addTask(_ task: DownloadTask) {
        
    }
    
    func removeTask(_ taskId: String) {
        
    }
    
    func cancelTask(_ taskId: String) {
        
    }
    
    
}

