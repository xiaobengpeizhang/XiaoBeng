//
//  QuizFinishViewController.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/6.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import Foundation
import UIKit

class QuizFinishViewController: UIViewController {
    var quizScore: Int = 0
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var getPrizeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    /*初始化界面*/
    func setup() {
        self.scoreLabel.text = String(quizScore)
        if quizScore >= 0 {
            getPrizeButton.isHidden = false
        }
    }
}
