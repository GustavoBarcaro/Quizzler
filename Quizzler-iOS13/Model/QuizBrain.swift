//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Gustavo Barcaro on 16/07/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    let quiz = [
        Question(
            q: "Which is the largest organ in the human body?",
            a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(
            q: "Five dollars is worth how many nickels?",
            a: ["25", "50", "100"], correctAnswer: "100"),
        Question(
            q: "What do the letters in the GMT time zone stand for?",
            a: [
                "Global Meridian Time", "Greenwich Mean Time",
                "General Median Time",
            ], correctAnswer: "Greenwich Mean Time"),
        Question(
            q: "What is the French word for 'hat'?",
            a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(
            q: "In past times, what would a gentleman keep in his fob pocket?",
            a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(
            q: "How would one say goodbye in Spanish?",
            a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(
            q: "Which of these colours is NOT featured in the logo for Google?",
            a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(
            q: "What alcoholic drink is made from molasses?",
            a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(
            q: "What type of animal was Harambe?",
            a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(
            q: "Where is Tasmania located?",
            a: ["Indonesia", "Australia", "Scotland"],
            correctAnswer: "Australia"),
    ]

    var questionNumber = 0
    var score = 0

    mutating func checkAnswer(_ userAnswer: String) -> Bool {
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        }
        return false
    }

    func getScore() -> Int {
        score
    }

    func getQuestionAnswer(at: Int) -> String {
        if at < 0 || at >= quiz[questionNumber].answerOptions.count {
            return "Invalid question index"
        }
        return quiz[questionNumber].answerOptions[at]
    }
    
    func getQuestionText() -> String {
        quiz[questionNumber].text
    }

    func getProgress() -> Float {
        Float(questionNumber + 1) / Float(quiz.count)
    }

    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
}
