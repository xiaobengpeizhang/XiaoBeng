//
//  PrizeViewController.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/6.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import Foundation
import UIKit

class PrizeViewController: UIViewController {
    @IBOutlet var prizeCG: UIImageView!
    @IBOutlet var viewUnlockedCGButton: UIButton!
    @IBOutlet var resetAllCGButton: UIButton!
    
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
            return
        }
        prizeCG.image = UIImage(named: CGStroe.lockedCG[0])
        CGStroe.unlockStep() 
    }
    
    /*查看所有解锁的CG*/
    @IBAction func viewUnlockedCG(_ sender: UIButton) {
        
    }
    
    /*重置所有CG*/
    @IBAction func resetAllCG(_ sender: UIButton) {
        CGStroe.reset()
    }
    
}
