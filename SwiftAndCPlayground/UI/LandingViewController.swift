//
//  LandingViewController.swift
//  SwiftAndCPlayground
//
//  Created by Eagle Diao on 2022-05-29.
//

import UIKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        executeC()
        executeObjC()
    }
    
    @IBAction func launchObjCController(_ sender: Any) {
        print("Should launch objc controller")
        let controller = ObjCViewController()
        let naviController = UINavigationController(rootViewController: controller)
        present(naviController, animated: true)
    }
    
    private func executeC() {
        print("Execute C")
        
        test(5)
        
        let str = "Hello, World"
        let cstr = (str as NSString).utf8String
        
        let cArray = UnsafeMutablePointer<UnsafePointer<CChar>?>.allocate(capacity: 1)
        cArray.initialize(to: cstr)
        
        test2(1, cArray)
        
        let p = create_posn()
        test3(p)
        free_posn(p)
        
        var p2 = make_posn(3, 4);
        test3(&p2)
    }
    
    private func executeObjC() {
        print("Execute ObjC")
        let m = Module1(width: 3, height: 7)
        m.delegate = self
        print(m.area(with: .triangle))
    }
}

extension LandingViewController: Module1Delegate {
    func module1WillReturnArea() {
        print("Called from objc module1WillReturnArea")
    }
}
