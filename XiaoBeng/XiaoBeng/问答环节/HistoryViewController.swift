//
//  HistoryViewController.swift
//  XiaoBeng
//
//  Created by 杨佩璋 on 2017/11/14.
//  Copyright © 2017年 杨佩璋. All rights reserved.
//
import UIKit

class HistoryViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! HistoryCell
        let quizItem = QuizStore.quizs[indexPath.row]
        cell.scoreLabel.text = String(quizItem.score)
        cell.dateLabel.text = quizItem.date
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return QuizStore.quizs.count
    }
    
    @IBAction func exit(sender: UIButton) {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
