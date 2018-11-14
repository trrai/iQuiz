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
        let alert = UIAlertController(title: "Data Connection", message: "Enter the linke for your JSON data here: ", preferredStyle: .alert)
        
    
        alert.addTextField { (textField) in
            textField.placeholder = "Link"
        }
    
        alert.addAction(UIAlertAction(title: "Load", style: .default, handler: { [weak alert] (_) in
            let linkText = alert?.textFields![0]
            print(linkText!.text!)
            self.appdata.jsonLink = linkText!.text!
            self.getData()
        }))
        
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
    
    func loadQuizzes(quizzes : [AppData.quizJSON]){
        var i = 0
        for quiz in quizzes{
            let newQuiz = Quiz(image: UIImage(named: self.appdata.images[i])!,
                               title:quiz.title,
                               description:quiz.desc)
            
            self.quizzes.append(newQuiz)
            
            if(i+1 < self.appdata.images.count){
                i+=1
            }
        }
        DispatchQueue.main.async {
            self.TableView.reloadData()
        }
    }
    
    func getData(){
        
        guard let jsonUrlString = URL(string: appdata.jsonLink)
            else { return }
        
        URLSession.shared.dataTask(with: jsonUrlString) { (data
            , response
            , error) in
            
            

            do{
                
                self.quizzes = []
                
                guard error == nil else {
                    
                    if let local = UserDefaults.standard.value(forKey:"quizStorage") as? Data {
                        
                        let localData = try PropertyListDecoder().decode([AppData.quizJSON].self, from: local)
                        
                        AppData.shared.quizzes = localData
                        
                        self.loadQuizzes(quizzes: localData)
                        
                    }
                    print("There was a network error! Loading from local storage.")
                    return
                }

                guard let data = data else {return}
                

                let quizResponse = try? JSONDecoder().decode([AppData.quizJSON].self, from: data)
                
                UserDefaults.standard.set(try? PropertyListEncoder().encode(quizResponse), forKey:"quizStorage")
                
                
                AppData.shared.quizzes = quizResponse ?? [];
                print(quizResponse ?? "")
                self.loadQuizzes(quizzes: quizResponse!)

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

