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
        TableView.delegate = self
        TableView.dataSource = self
        getData()
    }
    
    func getData(){

        guard let jsonUrlString = URL(string:"http://tednewardsandbox.site44.com/questions.json")
            else { return }
        
        URLSession.shared.dataTask(with: jsonUrlString) { (data
            , response
            , error) in
            
            guard let data = data else {return}
            
            do{
                let quizResponse = try JSONDecoder().decode([AppData.quizJSON].self, from: data)
                
                AppData.shared.quizzes = quizResponse;
                
                for quiz in quizResponse{
                    let newQuiz = Quiz(image: UIImage(named: self.appdata.images[0])!,
                        title:quiz.title,
                    description:quiz.desc)
                    
                    self.quizzes.append(newQuiz)
                    
                }
                DispatchQueue.main.async {
                    self.TableView.reloadData()
                }

            } catch let JSONerr{
                print(JSONerr)
            }
            
            }.resume()
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

