//
//  Quiz.swift
//  iQuiz
//
//  Created by Tejveer Rai on 10/28/18.
//  Copyright © 2018 Tejveer Rai. All rights reserved.
//

import Foundation
import UIKit

class Quiz {
    var image: UIImage
    var label: String
    var description: String
    
    init(image: UIImage, title: String, description: String){
        self.image = image;
        self.label = title;
        self.description = description
    }
}
