//
//  QuizViewController.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/2.
//  Copyright © 2017年 杨佩璋. All rights reserved.
// ]

import Foundation
import UIKit

/// 测验模块控制器
class QuizViewController: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBar()
        print("Method: \(#function) Line: \(#line) File: \(#file)")
    }
    
    func setupBar() {
        oneBarButton.isHidden = false
        oneBarButton.setTitle("历史成绩", for: .normal)
    }
    
    override func clickOneButton() {
        print("浏览历史成绩")
    }
    
}
