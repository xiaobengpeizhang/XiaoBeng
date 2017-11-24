//
//  QuestionStore.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/3.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import Foundation

class QuestionStore {
//    static var questionStore: QuestionStore = QuestionStore()
    
    static var questions: [String] {
        let questionArray = ["1.小奔喜欢吃什么？",
                             "2.佩璋喜欢什么花？",
                             "3.佩璋喜欢什么动物？",
                             "4.佩璋喜欢什么游戏机？",
                             "5.以下哪个动漫是佩璋喜欢的？",
                             "6.佩璋最喜欢的三国人物是谁？",
                             "7.以下哪个是任天堂独占的游戏？",
                             "8.以下哪个电影是佩璋喜欢？",
                             "9.以下哪部游戏是佩璋期待的？",
                             "10.佩璋家的狗狗叫什么名字？",]
        return questionArray
    }
    
    static var answers: [[String]] {
        let answerArray: [[String]] = [["香草味八喜冰淇淋", "榴莲味八喜冰淇淋", "西红柿", "绝味鸭脖"],
                                       ["梅花", "兰花", "菊花", "牵牛花"],
                                       ["🐷", "🐶", "🐱", "🐭"],
                                       ["微软xbox", "索尼ps", "任天堂switch", "小霸王"],
                                       ["魔法少女小奔", "美少女战士小奔", "罪恶王冠", "来自新世界"],
                                       ["吕布", "赵云", "关羽", "张飞"],
                                       ["最终幻想", "闪之轨迹", "光环", "超级马里奥"],
                                       ["泰坦尼克号", "阿甘正传", "闪光少女", "以上全部"],
                                       ["异度之刃2", "塞尔达传说", "1，2switch", "以上全部"],
                                       ["旺财", "奔奔", "笨笨", "来福"]]
        return answerArray
    }
    
    static var correctAnswers: [String] {
        let correctAnswerArray = ["香草味八喜冰淇淋", "兰花", "🐶", "任天堂switch", "罪恶王冠", "赵云", "超级马里奥", "以上全部", "以上全部", "笨笨"]
        return correctAnswerArray
    }
}
