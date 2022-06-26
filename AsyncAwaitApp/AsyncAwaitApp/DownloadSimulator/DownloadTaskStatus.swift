//
//  DownloadTaskStatus.swift
//  AsyncAwaitApp
//
//  Created by Eagle Diao on 2022-06-25.
//

import UIKit

enum DownloadTaskStatus {
    case idle
    case inProgress(CGFloat)
    case cancelled
    case finished
    case error(Error)
}
