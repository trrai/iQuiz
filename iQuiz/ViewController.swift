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
    var appdata = AppData.shared
    
    @IBAction func Settings(_ sender: Any) {
        let alert = UIAlertController(title: "Alert!", message: "Check Back for Settings!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    var quizzes: [Quiz] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        populateQuizzes()
        TableView.delegate = self
        TableView.dataSource = self
        
    }
    
    func populateQuizzes() {
        
        for (i, _) in appdata.titles.enumerated() {
            let newQuiz = Quiz(image: UIImage(named: appdata.images[i])!,
                               title:appdata.titles[i],
                               description:appdata.descr[i])
            quizzes.append(newQuiz)
        }
        
    }

}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        appdata.topicIdx = indexPath.row
        print(appdata.topicIdx);
    }
    
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

