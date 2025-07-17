//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var FirstAnswerButton: UIButton!
    @IBOutlet weak var SecondAnswerButton: UIButton!
    @IBOutlet weak var ThirdAnswerButton: UIButton!
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var QuestionsProgress: UIProgressView!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)

        if userGotItRight {
            sender.backgroundColor = UIColor.green
            quizBrain.nextQuestion()
        } else {
            sender.backgroundColor = UIColor.red
        }

        Timer.scheduledTimer(
            timeInterval: 0.2, target: self, selector: #selector(updateUI),
            userInfo: nil, repeats: false)
    }

    @objc func updateUI() {
        QuestionLabel.text = quizBrain.getQuestionText()
        QuestionsProgress.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        FirstAnswerButton.backgroundColor = UIColor.clear
        SecondAnswerButton.backgroundColor = UIColor.clear
        ThirdAnswerButton.backgroundColor = UIColor.clear
        FirstAnswerButton.setTitle(quizBrain.getQuestionAnswer(at: 0), for: .normal)
        SecondAnswerButton.setTitle(quizBrain.getQuestionAnswer(at: 1), for: .normal)
        ThirdAnswerButton.setTitle(quizBrain.getQuestionAnswer(at: 2), for: .normal)
    }
}
