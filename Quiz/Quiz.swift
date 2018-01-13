//
//  Quiz.swift
//  Quiz
//
//  Created by UCode on 12/30/17.
//  Copyright © 2017 Jacob Luvisi. All rights reserved.
//

import Foundation

class Quiz {
    
    var score: Int
    let questions: [Question]
    
    var currentQuestionIndex: Int
    
    var currentQuestion: Question {
        return questions[currentQuestionIndex]
    }
    
    var nextQuestionIndex: Int {
        return currentQuestionIndex + 1
    }
    
    init(questions: [Question]) {
        score = 0
        self.questions = questions
        currentQuestionIndex = 0
    }
    
    func next() {
        currentQuestionIndex = (currentQuestionIndex + 1) % questions.count
    }
    
    func reset() {
        score = 0
        currentQuestionIndex = 0
    }
    
}
