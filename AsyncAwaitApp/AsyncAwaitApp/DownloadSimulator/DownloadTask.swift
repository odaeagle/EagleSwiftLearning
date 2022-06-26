//
//  DownloadTask.swift
//  AsyncAwaitApp
//
//  Created by Eagle Diao on 2022-06-25.
//

import Foundation

struct DownloadTask: Identifiable {
    let id = UUID().uuidString
    let name: String
    let url: String
    let status: DownloadTaskStatus
    let target: Int
}
