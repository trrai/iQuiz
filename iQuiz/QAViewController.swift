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
        
        //record result of answer
        if let text = currentButton?.titleLabel?.text {
            
            let currentQuestion = appdata.quizzes[appdata.topicIdx].questions[qIndex]
            
            let correctAnswer = currentQuestion.answers[Int(currentQuestion.answer)!]
            
            if(text == correctAnswer){
                correctAnswers += 1;
            }
        }
        newQuestion()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(appdata.quizzes[appdata.topicIdx])
        newQuestion()
        
        // Do any additional setup after loading the view.
    }

    func newQuestion() {
        let currentQuestion = appdata.quizzes[appdata.topicIdx].questions[qIndex]
        
        lblQuestion.text = currentQuestion.text
        ans1.setTitle(currentQuestion.answers[0], for: .normal)
        ans2.setTitle(currentQuestion.answers[1], for: .normal)
        ans3.setTitle(currentQuestion.answers[2], for: .normal)
        ans4.setTitle(currentQuestion.answers[3], for: .normal)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("SEGUE")
        guard let secondVC = segue.destination as? AnswerViewController else {return}
        
        let currentQuestion = appdata.quizzes[appdata.topicIdx].questions[qIndex]
        let correctAnswer = currentQuestion.answers[Int(currentQuestion.answer)!]
        secondVC.resultText = "Incorrect!"
        
        if let text = currentButton?.titleLabel?.text {
            if(text == correctAnswer){
                correctAnswers += 1;
                secondVC.resultText = "Correct!"
            }
        }
        
        secondVC.questionText = currentQuestion.text
        secondVC.answerText = correctAnswer
        secondVC.qIndex = qIndex + 1
        secondVC.correctAnswers = correctAnswers;
        secondVC.questionSetCount = (appdata.quizzes[appdata.topicIdx].questions).count;
        
    }
    

}
