//
//  QAViewController.swift
//  iQuiz
//
//  Created by Tejveer Rai on 11/2/18.
//  Copyright © 2018 Tejveer Rai. All rights reserved.
//

import UIKit

class QAViewController: UIViewController {
    var appdata = AppData.shared
    var qIndex = 0
    var currentButton: UIButton?
    var correctAnswers = 0;
    
    var answerSet: [String] = []
    var questionSet: [String] = []
    var correctAnswerSet: [String] = []
    
    @IBOutlet weak var lblQuestion: UILabel!
    @IBOutlet weak var ans1: UIButton!
    @IBOutlet weak var ans2: UIButton!
    @IBOutlet weak var ans3: UIButton!
    @IBOutlet weak var ans4: UIButton!
    
    
    @IBAction func recordAnswer(_ sender: UIButton)
    {
        currentButton?.backgroundColor = UIColor.gray;
        currentButton = sender;
        sender.backgroundColor = UIColor.darkGray
        
    }
    
    @IBAction func submitAnswer(_ sender: Any) {
        qIndex+=1;
        //reached end of questions
        if(qIndex == answerSet.count){
            
        }
        
        //record result of answer
        if let text = currentButton?.titleLabel?.text {
            if(text == correctAnswerSet[qIndex]){
                correctAnswers += 1;
            }
        }
        newQuestion()
        print("SUBMIT")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newQuestion()
        
        // Do any additional setup after loading the view.
    }

    func newQuestion() {
        switch appdata.topicIdx {
        // Seattle
        case 0:
            lblQuestion.text = appdata.sportsQuestions[qIndex]
            questionSet = appdata.sportsQuestions
            answerSet = appdata.sportsAnswers[qIndex]
            correctAnswerSet = appdata.correctSportsAnswers
        // Chicago
        case 1:
            lblQuestion.text = appdata.carQuestions[qIndex]
            questionSet = appdata.carQuestions
            answerSet = appdata.carAnswers[qIndex]
            correctAnswerSet = appdata.correctCarAnswers
        default:
            lblQuestion.text = appdata.musicQuestions[qIndex]
            questionSet = appdata.musicQuestions
            answerSet = appdata.musicAnswers[qIndex]
            correctAnswerSet = appdata.correctMusicAnswers
        }
        
        ans1.setTitle(answerSet[0], for: .normal)
        ans2.setTitle(answerSet[1], for: .normal)
        ans3.setTitle(answerSet[2], for: .normal)
        ans4.setTitle(answerSet[3], for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("SEGUE")
        guard let secondVC = segue.destination as? AnswerViewController else {return}
        
        secondVC.resultText = "Incorrect!"
        
        if let text = currentButton?.titleLabel?.text {
            if(text == correctAnswerSet[qIndex]){
                correctAnswers += 1;
                secondVC.resultText = "Correct!"
            }
        }
        
        secondVC.questionText = questionSet[qIndex]
        secondVC.answerText = correctAnswerSet[qIndex]
        secondVC.qIndex = qIndex + 1
        secondVC.correctAnswers = correctAnswers;
        secondVC.questionSet = questionSet;
        
    }
    

}
