//
//  module2.swift
//  SwiftAndCPlayground
//
//  Created by Eagle Diao on 2022-05-29.
//

import Foundation

@_cdecl("foo")
public func foo(x: Int) -> Int {
    return x * 2
}

@_cdecl("goo")
func goo(argc: Int, argv: UnsafeMutablePointer<UnsafeMutablePointer<CChar>>) {
    print("I got called From C!", argc)
    print("Im called from C: ", String(cString: argv.pointee))
    print("Im called from C: ", String(cString: argv.successor().pointee))
    
//    print("Im called from C: ", String(cString: argv.pointee))
//    print("Im called from C: ", String(cString: argv.successor().pointee))
}

@_cdecl("getSwiftViewController")
func getSwiftViewController() -> UIViewController & SwiftViewControllerProtocol {
    return SwiftViewController()
}
