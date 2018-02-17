//
//  ViewController.swift
//  Quiz
//
//  Created by UCode on 12/30/17.
//  Copyright © 2017 Jacob Luvisi. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
    @IBOutlet var progressBar: UIProgressView!
    
    @IBOutlet var questionNumber: UILabel!
    /*
 
 
 
 
 
 
 
   */
    
    let quiz = Quiz(questions:
        [
            Question(text: "12 * 3",
                     answers: [Answer(text: "40", isCorrect: false),
                               Answer(text: "36", isCorrect: true),
                               Answer(text: "38", isCorrect: false),
                               Answer(text: "28", isCorrect: false)]),
            // Question: 2
            
            Question(text: "(18 * 2) + 36 / 2",
                     answers: [Answer(text: "54", isCorrect: true),
                               Answer(text: "35", isCorrect: false),
                               Answer(text: "36", isCorrect: false),
                               Answer(text: "62", isCorrect: false)]),
            // Question: 3
            
            Question(text: "5 * 5 / 5 + 5 - 10",
                     answers: [Answer(text: "5", isCorrect: false),
                               Answer(text: "10", isCorrect: false),
                               Answer(text: "0", isCorrect: true),
                               Answer(text: "-5", isCorrect: false)]),
            
            // Question: 4
            
            Question(text: "51 * 3",
                     answers: [Answer(text: "171", isCorrect: false),
                               Answer(text: "153", isCorrect: true),
                               Answer(text: "136", isCorrect: false),
                               Answer(text: "152", isCorrect: false)]),
            // Question: 5
            
            Question(text: "Question 2s Answer?",
                     answers: [Answer(text: "A", isCorrect: true),
                               Answer(text: "B", isCorrect: false),
                               Answer(text: "C", isCorrect: false),
                               Answer(text: "D", isCorrect: false)]),
            // Question: 6
            
            Question(text: "16 + 7 / 2.5",
            answers: [Answer(text: "18", isCorrect: false),
            Answer(text: "17.6", isCorrect: false),
            Answer(text: "19", isCorrect: false),
            Answer(text: "18.8", isCorrect: true)])
            
        ])
    
    func show(question: Question) {
        questionNumber.text = "Question: \(quiz.currentQuestionIndex + 1)"
        questionLabel.text = question.text
        questionLabel.sizeToFit();
        
        button1.setTitle("a. \(question.answers[0].text)", for: .normal)
        button2.setTitle("d. \(question.answers[1].text)", for: .normal)
        button3.setTitle("c. \(question.answers[2].text)", for: .normal)
        button4.setTitle("b. \(question.answers[3].text)", for: .normal)
        button1.sizeToFit()
        button2.sizeToFit()
        button3.sizeToFit()
        button4.sizeToFit()
        
        
        //progressBar.progress = 0/6
        progressBar.progress = Float(quiz.currentQuestionIndex) / 6
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        show(question: quiz.currentQuestion)
        
        // Do any additional setup after loading the view, typically from a nib.
        
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitAnswer(sender: AnyObject){
        if(quiz.currentQuestion.check(answerIndex: sender.tag)){
            quiz.score += 1
            print(quiz.score)
        }
        
        
        
        if(quiz.currentQuestionIndex < quiz.questions.count - 1){
            quiz.next()
            show(question: quiz.currentQuestion)
        }else{
            performSegue(withIdentifier: "scoreSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ScoreViewController
        destVC.score = quiz.score
        destVC.total = quiz.questions.count
    }
    
    @IBAction func unwindToQuizViewController(segue: UIStoryboardSegue) {
        quiz.reset()
        show(question: quiz.currentQuestion)
    }
    
}


