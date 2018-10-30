//
//  ViewController.swift
//  iQuiz
//
//  Created by Tejveer Rai on 10/28/18.
//  Copyright © 2018 Tejveer Rai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    
    @IBAction func Settings(_ sender: Any) {
        let alert = UIAlertController(title: "Alert!", message: "Check Back for Settings!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    var quizzes: [Quiz] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        quizzes = populateQuizzes()
        TableView.delegate = self
        TableView.dataSource = self
        
    }
    
    func populateQuizzes() -> [Quiz] {
        var temp: [Quiz] = []
        
        let q1 = Quiz(image: UIImage(named: "football.png")!, title: "Sports", description: "Test your knowledge on sports!")
        let q2 = Quiz(image: UIImage(named: "car.png")!, title: "Cars", description: "Test your knowledge on cars!")
        let q3 = Quiz(image: UIImage(named: "music.png")!, title: "Music", description: "Test your knowledge on music!")
        
        temp.append(q1)
        temp.append(q2)
        temp.append(q3)
        
        return temp
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return quizzes.count;
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100.0;//Choose your custom row height
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let quiz = quizzes[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "QuizCell") as! QuizCell
        cell.set(quiz: quiz)
        return cell
    }
}

