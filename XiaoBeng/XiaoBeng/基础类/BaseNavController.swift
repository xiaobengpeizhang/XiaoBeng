//
//  BaseNavController.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/14.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import UIKit

class BaseNavController: UINavigationController, UIGestureRecognizerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        disableLeftPan()
        
    }
    
    /* 禁止左划 */
    func disableLeftPan() {
        interactivePopGestureRecognizer?.delegate = self
    }
    
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        
        return false
    }

    
}
