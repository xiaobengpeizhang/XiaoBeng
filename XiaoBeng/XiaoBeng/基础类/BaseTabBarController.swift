//
//  BaseTabBarController.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/2.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import Foundation
import UIKit

class BaseTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Method: \(#function) Line: \(#line) File: \(#file)")
        
        self.setup()
    }
    
    /// 配置原始图片
    func setup() {
        let iconNames = ["quiz", "photos"];
        
        for (index, iconName) in iconNames.enumerated() {
            self.childViewControllers[index].tabBarItem.image = UIImage(named: iconName)?.withRenderingMode(.alwaysOriginal)
        }
        
    }
}
