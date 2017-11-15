//
//  PrizeViewController.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/6.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import Foundation
import UIKit

class PrizeViewController: BaseViewController {
    @IBOutlet var prizeCG: UIImageView!
    @IBOutlet var viewUnlockedCGButton: UIButton!
    @IBOutlet var resetAllCGButton: UIButton!
    @IBOutlet var describe1: UILabel!
    @IBOutlet var describe2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setup()
    }
    
    /*初始化cg*/
    func setup() {
        guard !CGStroe.lockedCG.isEmpty else {
            print("empty lockedCG")
            viewUnlockedCGButton.isHidden = false
            resetAllCGButton.isHidden = false
            prizeCG.isHidden = true
            describe1.isHidden = false
            describe2.isHidden = false
            return
        }
        prizeCG.image = UIImage(named: CGStroe.lockedCG[0])
        CGStroe.unlockStep() 
    }
    
    
    override func setupNavBar() {
        super.setupNavBar()
        oneBarButton.setTitle("回到首页", for: .normal)
    }
    
    /* 回到首页 */
    override func clickOneButton() {
       self.navigationController?.popToRootViewController(animated: true)
    }
    
    
    
    /*查看所有解锁的CG*/
    @IBAction func viewUnlockedCG(_ sender: UIButton) {
        
    }
    
    /*重置所有CG*/
    @IBAction func resetAllCG(_ sender: UIButton) {
        CGStroe.reset()
//        viewUnlockedCGButton.isHidden = false
//        resetAllCGButton.isHidden = false
//        prizeCG.isHidden = true
//        describe1.isHidden = false
//        describe2.isHidden = false
    }
    
}
