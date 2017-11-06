//
//   QuizIngViewController.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/3.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import Foundation
import UIKit

class QuizIngViewController: UIViewController {
    
    var currentQuestionIndex: Int = 0   /*当前问题索引*/
    var currentScore: Int = 0   /*当前分数*/
    
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var answer1Btn: UIButton!
    
    @IBOutlet var answer2Btn: UIButton!
    
    @IBOutlet var answer3Btn: UIButton!
    
    @IBOutlet var answer4Btn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQuestion()
    }
    
    /*根据当前问题索引设置问题*/
    func setupQuestion() {
        self.questionLabel.text = QuestionStore.questions[currentQuestionIndex]
        self.answer1Btn.setTitle(QuestionStore.answers[currentQuestionIndex][0], for: .normal)
        self.answer2Btn.setTitle(QuestionStore.answers[currentQuestionIndex][1], for: .normal)
        self.answer3Btn.setTitle(QuestionStore.answers[currentQuestionIndex][2], for: .normal)
        self.answer4Btn.setTitle(QuestionStore.answers[currentQuestionIndex][3], for: .normal)
    }
    
    
    @IBAction func nextQuestion(_ sender: UIButton) {
        if isCorrect(sender.title(for: .normal)!) {
            addScore()
        }
        currentQuestionIndexStep()
        setupQuestion()
    }
    
    /*对错判断*/
    func isCorrect(_ toJudge: String) -> Bool {
        return toJudge == QuestionStore.correctAnswers[currentQuestionIndex]
    }
    
    /*加分*/
    func addScore() {
        currentScore += 10
    }
    
    /*问题索引自增*/
    func currentQuestionIndexStep() {
        currentQuestionIndex += 1
        if currentQuestionIndex == 10 {
            finishQuiz()
            currentQuestionIndex = 0
        }
    }
    
    /*结束测验*/
    func finishQuiz()  {
        computeScore()
        markHistory()
    }
    
    /*添加历史记录*/
    func markHistory() {
        
    }
    
    /*分数结算*/
    func computeScore() {
        print("getScore: \(currentScore)")
    }
    
    /*结算界面*/
}
