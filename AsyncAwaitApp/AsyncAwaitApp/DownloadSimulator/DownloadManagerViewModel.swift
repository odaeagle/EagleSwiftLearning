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
            .init(name: faker.name.firstName(), url: faker.internet.url(), status: .idle, target: 1000),
            .init(name: faker.name.firstName(), url: faker.internet.url(), status: .cancelled, target: 1000),
            .init(name: faker.name.firstName(), url: faker.internet.url(), status: .finished, target: 1000),
            .init(name: faker.name.firstName(), url: faker.internet.url(), status: .inProgress(20), target: 1000)
        ]
    }
    
    func addTask(_ task: DownloadTask) {
        
    }
    
    func removeTask(_ taskId: String) {
        
    }
    
    func cancelTask(_ taskId: String) {
        
    }
    
    
}

