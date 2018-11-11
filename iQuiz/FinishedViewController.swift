//
//  FinishedViewController.swift
//  iQuiz
//
//  Created by Tejveer Rai on 11/3/18.
//  Copyright © 2018 Tejveer Rai. All rights reserved.
//

import UIKit

class FinishedViewController: UIViewController {
    
    var correctAnswers:Int?
    var questionSetCount:Int?
    
    @IBOutlet weak var statsLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let dec:Double = (Double(correctAnswers!) / Double(questionSetCount!))
        if(dec == 1){
            resultLabel.text = "Perfect!"
        }else if(dec > 0.5){
            resultLabel.text = "Almost!"
        }else{
            resultLabel.text = "Horrible!"
        }
        
        statsLabel.text = "\(correctAnswers!) / \(questionSetCount!)"
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
