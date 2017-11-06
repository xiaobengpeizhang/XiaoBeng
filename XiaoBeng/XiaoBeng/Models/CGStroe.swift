//
//  CGStroe.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/6.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import Foundation
import UIKit

/*管理奖品CG*/
class CGStroe {
    
    static var allCG: [String] = ["cg1", "cg2", "cg3"]
    
    static var lockedCG: [String] {
        if UserDefaults.standard.value(forKey: "lockedCG") == nil {
            UserDefaults.standard.setValue(allCG, forKey: "lockedCG")
            UserDefaults.standard.setValue([String](), forKey: "unlockedCG")
        }
        return UserDefaults.standard.value(forKey: "lockedCG") as! [String]
    }   /*未解锁CG*/
    
    static var unlockedCG: [String] {
        return UserDefaults.standard.value(forKey: "unlockedCG") as! [String]
    }   /*已经解锁CG*/
    
    static func unlockStep() {
        var lockedCG = (UserDefaults.standard.value(forKey: "lockedCG") as! [String])
        var unlockedCG = UserDefaults.standard.value(forKey: "unlockedCG") as! [String]
        unlockedCG.append(lockedCG.remove(at: 0))
        UserDefaults.standard.set(lockedCG, forKey: "lockedCG")
        UserDefaults.standard.set(unlockedCG, forKey: "unlockedCG")
    }   /*解锁下一张*/
    
    static func reset() {
        UserDefaults.standard.set(allCG, forKey: "lockedCG")
        UserDefaults.standard.set([String](), forKey: "unlockedCG")
    }
}
