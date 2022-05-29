//
//  SwiftViewController.swift
//  SwiftAndCPlayground
//
//  Created by Eagle Diao on 2022-05-29.
//

import Foundation
import UIKit

class SwiftViewController: UIViewController, SwiftViewControllerProtocol, SwiftViewControllerProtocol2 {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
    func swiftViewControllerDoSomething1(_ num: Int32) {
        print("DoSomething1 Called with num", num)
    }
    
    func swiftViewControllerDoSomething2(_ num: Int32) {
        print("DoSomething2 Called with num", num)
    }
    
    func swiftViewController2DoSomething1(_ num: Int32) {
        print("2 DoSomething1 Called with num", num)
    }
    
    func swiftViewController2DoSomething2(_ num: Int32) {
        print("2 DoSomething2 Called with num", num)
    }
}
