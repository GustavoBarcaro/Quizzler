//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Gustavo Barcaro on 17/04/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answerOptions: [String]
    let answer: String
    
    init(q: String, a: [String], correctAnswer: String) {
        self.text = q
        self.answerOptions = a
        self.answer = correctAnswer
    }
}
