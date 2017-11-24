//
//  P.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/2.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import Foundation
import UIKit

/*
 //
 //  UIApplication+ActivityViewController.h
 //  yykaoo_private_doc
 //
 //  Created by deng shu on 16/3/9.
 //  Copyright  2016年 zhanshu. All rights reserved.
 //
 
 #import <UIKit/UIKit.h>
 
 @interface UIApplication (ActivityViewController)
 - (UIViewController *)activityViewController;
 @end
 邓万书(邓万书)
 万书
 #import "UIApplication+ActivityViewController.h"
 
 @implementation UIApplication (ActivityViewController)
 
 - (UIViewController *)activityViewController {
 __block UIWindow *normalWindow = [self.delegate window];
 if (normalWindow.windowLevel != UIWindowLevelNormal) {
 [self.windows enumerateObjectsUsingBlock:^(__kindof UIWindow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
 if (obj.windowLevel == UIWindowLevelNormal) {
 normalWindow = obj;
 *stop        = YES;
 }
 }];
 }
 
 return [self p_nextTopForViewController:normalWindow.rootViewController];
 }
 
 - (UIViewController *)p_nextTopForViewController:(UIViewController *)inViewController {
 while (inViewController.presentedViewController) {
 inViewController = inViewController.presentedViewController;
 }
 
 if ([inViewController isKindOfClass:[UITabBarController class]]) {
 UIViewController *selectedVC = [self p_nextTopForViewController:((UITabBarController *)inViewController).selectedViewController];
 return selectedVC;
 } else if ([inViewController isKindOfClass:[UINavigationController class]]) {
 UIViewController *selectedVC = [self p_nextTopForViewController:((UINavigationController *)inViewController).visibleViewController];
 return selectedVC;
 } else {
 return inViewController;
 }
 
 }
 */

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
    
