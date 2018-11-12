//
//  AppData.swift
//
//  Created by iGuest on 10/29/18.
//  Copyright © 2018 iGuest. All rights reserved.
//

import UIKit


//class quizDataQuestion {
//    let text : String
//    let answer : String
//    let answers : [String]
//
//    init(text: String, answer: String, answers: [String]) {
//        self.text = text
//        self.answer = answer
//        self.answers = answers
//    }
//}
//
//class quizData{
//    let title : String
//    let desc : String
//    let questions : [quizDataQuestion]
//
//    init(title:String, desc:String, questions: [quizDataQuestion]){
//        self.title = title
//        self.desc = desc
//        self.questions = questions
//    }
//}

class AppData: NSObject {
    
    static let shared = AppData()
    
    public struct quiz : Codable{
        let text : String
        let answer : String
        let answers : [String]
    }
    
    public struct quizJSON : Codable {
        let title : String
        let desc : String
        let questions : [quiz]
        
    }
    
    open var quizzes = [quizJSON]()

    open var images: [String] = ["football.png", "car.png", "music.png"]

    
    open var topicIdx = 0
    
    open var sportsQuestions: [String] = ["How many superbowls have the Seahawks won?",
                                          "What year did LeBron James win his first NBA Championship?",
                                          "What team did Micheal Jordan last play for?"]
    open var carQuestions: [String] = ["Which car brand still manufactures their own brakes?",
                                       "What vehicle has popularly been nicknamed 'Godzilla'?",
                                       "What is the top speed on the McLaren P1?"]
    open var musicQuestions: [String] = ["How many Grammy awards has Kanye West won?",
                                         "Who is the youngest artist to create a platinum record?",
                                         "Which female artist is best know for her song, 'Anaconda'? "]
    
    open var sportsAnswers: [[String]] = [
        ["1",
         "3",
         "5",
         "2"],
        ["2009",
         "2012",
         "2018",
         "2015"],
        ["Chicago Bulls",
         "Los Angeles Lakers",
         "New York Knicks",
         "Washington Wizards"]
    
    ]
    open var correctSportsAnswers: [String] = [
        "1", "2012", "Washington Wizards"
    ]
    
    open var carAnswers: [[String]] = [
        ["BMW",
         "Mercedes Benz",
         "Porsche",
         "Ford"],
        ["McLaren P1",
         "Ford Focus",
         "Nissan GTR",
         "BMW M5"],
        ["217mph",
         "220mph",
         "190mph",
         "194mph"]
    ]
    open var correctCarAnswers: [String] = [
        "Porsche", "Nissan GTR", "217mph"
    ]
    open var musicAnswers: [[String]] = [
        ["22",
         "21",
         "13",
         "4"],
        ["Jackie Evancho",
         "Kanye West",
         "Drake",
         "Michael Jackson"],
        ["Cardi B",
         "Nicki Minaj",
         "Taylor Swift",
         "Beyonce"]
    ]
    open var correctMusicAnswers: [String] = [
        "21", "Jackie Evancho", "Nicki Minaj"
    ]
}
