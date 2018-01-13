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
                     answers: [Answer(text: "sure", isCorrect: true),
                               Answer(text: "no", isCorrect: false),
                               Answer(text: "no", isCorrect: false),
                               Answer(text: "no", isCorrect: false)]),
            // Question: 3
            
            Question(text: "Test3",
                     answers: [Answer(text: "Not Correct", isCorrect: false),
                               Answer(text: "Correct", isCorrect: true),
                               Answer(text: "Not Correct", isCorrect: false),
                               Answer(text: "Not Correct", isCorrect: false)])
        ])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = quiz.currentQuestion.text
        questionLabel.sizeToFit();
        
        button1.setTitle("a. \(quiz.currentQuestion.answers[0].text)", for: .normal)
        button2.setTitle("b. \(quiz.currentQuestion.answers[1].text)", for: .normal)
        button3.setTitle("c. \(quiz.currentQuestion.answers[2].text)", for: .normal)
        button4.setTitle("d. \(quiz.currentQuestion.answers[3].text)", for: .normal)
        button1.sizeToFit()
        button2.sizeToFit()
        button3.sizeToFit()
        button4.sizeToFit()
        
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
            updateView()
        }else{
            performSegue(withIdentifier: "scoreSegue", sender: nil)
        }
    }
    
    func updateView(){
        questionLabel.text = quiz.currentQuestion.text
        
        button1.setTitle("a. \(quiz.currentQuestion.answers[0].text)", for: .normal)
        button2.setTitle("b. \(quiz.currentQuestion.answers[1].text)", for: .normal)
        button3.setTitle("c. \(quiz.currentQuestion.answers[2].text)", for: .normal)
        button4.setTitle("d. \(quiz.currentQuestion.answers[3].text)", for: .normal)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! ScoreViewController
        destVC.score = quiz.score
        destVC.total = quiz.questions.count
    }
}


