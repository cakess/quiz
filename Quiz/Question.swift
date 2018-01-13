//
//  Question.swift
//  Quiz
//
//  Created by UCode on 12/30/17.
//  Copyright © 2017 Jacob Luvisi. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answers: [Answer]
    
    func check(answerIndex: Int) -> Bool {
        return answers[answerIndex].isCorrect
    }
}
