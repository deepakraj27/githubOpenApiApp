//
//  Storyboard.swift
//  test
//
//  Created by Deepakraj Murugesan on 23/10/18.
//  Copyright © 2018 Noticeboard. All rights reserved.
//

import Foundation
import UIKit

enum MyStoryboard : String {
    case Main
}

extension MyStoryboard {
    var instance : UIStoryboard {
        return UIStoryboard(name: self.rawValue, bundle: Bundle.main)
    }
    
    
    func viewController<T : UIViewController>(_ viewControllerClass : T.Type, function : String = #function, line : Int = #line, file : String = #file) -> T {
        
        let storyboardID = (viewControllerClass as UIViewController.Type).storyboardID
        
        guard let scene = instance.instantiateViewController(withIdentifier: storyboardID) as? T else {
            
            fatalError("ViewController with identifier \(storyboardID), not found in \(self.rawValue) Storyboard.\nFile : \(file) \nLine Number : \(line) \nFunction : \(function)")
        }
        
        return scene
    }
    
    func initialViewController() -> UIViewController? {
        
        return instance.instantiateInitialViewController()
    }
    
}


extension UIViewController {
    
    // Not using static as it wont be possible to override to provide custom storyboardID then
    class var storyboardID : String {
        return "\(self)"
    }
    
    var get: String {
        return String(describing: type(of: self))
    }
    
    static func instantiate(fromAppStoryboard appStoryboard: MyStoryboard) -> Self {
        return appStoryboard.viewController(self)
    }
}

//USAGE: - let OnBoardingStoryboard = MyStoryboard.OnBoarding.instance
//  let greenScene = GreenVC.instantiate(fromAppStoryboard: .Main)

// let greenScene = MyStoryboard.Main.viewController(viewControllerClass: GreenVC.self)

// let greenScene = MyStoryboard.Main.instance.instantiateViewController(withIdentifier: GreenVC.storyboardID)
