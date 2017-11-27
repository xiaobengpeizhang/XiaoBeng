//
//  P.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/2.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import Foundation
import UIKit

class CommonClass {
    
    static let window = UIApplication.shared.keyWindow!
    
    static let screenWidth = UIScreen.main.bounds.width
    
    static let screenHeight = UIScreen.main.bounds.height
    
    static let screenBounds = UIScreen.main.bounds
    
    static let screenBoundsLand = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.height, height: UIScreen.main.bounds.width)
    
}

extension UIApplication {
    
    /* activityViewController */
    func activityViewController() -> UIViewController? {
        guard  let currentWindow = self.delegate?.window else {
            return nil
        }
        
        guard var normalWindow = currentWindow else {
            return nil
        }
        
        if normalWindow.windowLevel != UIWindowLevelNormal {
            for window in self.windows {
                if window.windowLevel == UIWindowLevelNormal {
                    normalWindow = window
                    break
                }
            }
        }
        
        return self.p_nextTopForViewController(normalWindow.rootViewController)
    }
    
    func p_nextTopForViewController(_ inViewController: UIViewController?) -> UIViewController? {
        guard var invc = inViewController else {
            return nil
        }
        
        while (invc.presentedViewController != nil)  {
            invc = invc.presentedViewController!
        }
        
        if invc.isKind(of: UITabBarController.self) {
            return self.p_nextTopForViewController((invc as! UITabBarController).selectedViewController)
        } else if invc.isKind(of: UINavigationController.self) {
            return self.p_nextTopForViewController((invc as! UINavigationController).visibleViewController)
        } else {
            return invc
        }
    }
}





struct Debugger {
    

}
    
