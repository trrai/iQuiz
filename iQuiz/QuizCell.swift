//
//  QuizCell.swift
//  iQuiz
//
//  Created by Tejveer Rai on 10/28/18.
//  Copyright © 2018 Tejveer Rai. All rights reserved.
//

import UIKit

class QuizCell: UITableViewCell {
    @IBOutlet weak var quizImageView: UIImageView!
    @IBOutlet weak var quizLabel: UILabel!
    @IBOutlet weak var quizDescription: UILabel!
    
    func set(quiz: Quiz){
        quizImageView.image = quiz.image;
        quizLabel.text = quiz.label;
        quizDescription.text = quiz.description;
    }
}
