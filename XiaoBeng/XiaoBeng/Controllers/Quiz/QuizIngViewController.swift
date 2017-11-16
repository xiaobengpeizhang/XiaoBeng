//
//   QuizIngViewController.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/3.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//

import Foundation
import UIKit

class QuizIngViewController: BaseViewController {
    
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
        markHistory()
        goFinish()
    }
    
    /*添加历史记录*/
    func markHistory() {
        let quizItem = QuizItem()
        quizItem.score = currentScore
        print(Date())
//        quizItem.date = Date()
//        QuizStore.quizs.append(quizItem)
        QuizStore.addQuizItem(item: quizItem)
    }
    
    /*前往完成界面*/
    func goFinish() {
        self.performSegue(withIdentifier: "finish", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        let finish = segue.destination as! QuizFinishViewController
        finish.quizScore = currentScore
    }
    
    override func setupNavBar() {
        super.setupNavBar()
        
        oneBarButton.isHidden = false
        oneBarButton.setTitle("终止测验", for: .normal)
    }
    
    /* 终止测试 */
    override func clickOneButton() {
        let alert = UIAlertController(title: "警告", message: "你真的要放弃这次测验吗？", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "我点错了", style: .cancel, handler: nil)
        let confirmAction = UIAlertAction(title: "没有新意", style: .destructive) { (action) in
            self.navigationController?.popViewController(animated: true)
        }
        alert.addAction(cancelAction)
        alert.addAction(confirmAction)
        present(alert, animated: true, completion: nil)
    }
    
    
    
}
