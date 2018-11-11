//
//  AnswerViewController.swift
//  iQuiz
//
//  Created by Tejveer Rai on 11/2/18.
//  Copyright © 2018 Tejveer Rai. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    
    var resultText:String?
    var questionText:String?
    var answerText:String?
    var qIndex:Int?
    var correctAnswers:Int?
    var questionSetCount: Int?
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var answer: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("passed index:")
        print(qIndex!);
        // Do any additional setup after loading the view.
        result.text = resultText
        answer.text = answerText
        question.text = questionText
    }
    
    @IBAction func next(_ sender: Any) {
        if(qIndex! < questionSetCount!){
        performSegue(withIdentifier: "nextQuestionSegue", sender: self)
        }else{
            performSegue(withIdentifier: "finishedSegue", sender: self)
            print("QUIZ FINISHED!")
            print("Result: \(correctAnswers!) out of \(questionSetCount!)")
        }
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if(segue.identifier == "nextQuestionSegue") {
            guard let secondVC = segue.destination as? QAViewController else {return}
            secondVC.qIndex = qIndex!;
            secondVC.correctAnswers = correctAnswers!;
        }else{
            guard let secondVC = segue.destination as? FinishedViewController else {return}
            secondVC.correctAnswers = correctAnswers!;
            secondVC.questionSetCount = questionSetCount!;
        }
    }
    

}
