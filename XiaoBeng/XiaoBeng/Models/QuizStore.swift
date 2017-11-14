//
//  QuizStore.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/14.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import Foundation

class QuizStore {
    static var quizs: [QuizItem] {
        if UserDefaults.standard.value(forKey: "history") == nil {
            UserDefaults.standard.setValue([QuizItem](), forKey: "history")
        }
        return UserDefaults.standard.value(forKey: "history") as! [QuizItem]
    }
    
    static func addQuizItem(item: QuizItem) {
//        var quizs = UserDefaults.standard.value(forKey: "history") as! [QuizItem]
//        quizs.append(item)
//        UserDefaults.standard.setValue(quizs, forKey: "history")
//        print(quizs.count)
    }
}

