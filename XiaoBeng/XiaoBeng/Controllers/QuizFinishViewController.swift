//
//  QuizFinishViewController.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/6.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import Foundation
import UIKit

class QuizFinishViewController: BaseViewController {
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
        if quizScore >= 80 {
            getPrizeButton.setTitle("查看奖励", for: .normal)
        } else {
            getPrizeButton.setTitle("回到首页", for: .normal)
        }
    }
    
    override func setupNavBar() {
        super.setupNavBar()
        
        oneBarButton.isHidden = true
    }
    
    @IBAction func isGetPrize(sender: UIButton) {
        if quizScore >= 80 {
            self.performSegue(withIdentifier: "getCG", sender: nil)
        } else {
            self.navigationController?.popToRootViewController(animated: true)
        }
    }
    
}
