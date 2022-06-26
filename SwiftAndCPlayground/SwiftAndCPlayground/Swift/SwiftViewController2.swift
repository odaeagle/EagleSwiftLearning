//
//  SwiftViewController2.swift
//  SwiftAndCPlayground
//
//  Created by Eagle Diao on 2022-05-29.
//

import UIKit

//@objc
class SwiftViewController2: UIViewController {
    
    let titleLabel = UILabel().apply {
        $0.text = "Swift VC with @objc"
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
    
//    @objc
    func doSomething1() {
        print("Do something1")
    }
}
