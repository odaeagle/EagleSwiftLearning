//
//  SwiftViewController.swift
//  SwiftAndCPlayground
//
//  Created by Eagle Diao on 2022-05-29.
//

import Foundation
import UIKit

class SwiftViewController: UIViewController, SwiftViewControllerProtocol, SwiftViewControllerProtocol2 {
    
    let titleLabel = UILabel().apply {
        $0.text = "Swift VC with .h"
        $0.textColor = .white
        $0.font = UIFont.systemFont(ofSize: 25)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(titleLabel)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        titleLabel.sizeToFit()
        titleLabel.center = view.center
    }
    
    func swiftViewControllerDoSomething1(_ num: Int32) {
        print("DoSomething1 Called with num", num)
        doSomethingInProtocol()
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

extension SwiftViewControllerProtocol {
    func doSomethingInProtocol() {
        print("hello")
    }
}
