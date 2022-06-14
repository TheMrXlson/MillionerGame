//
//  GameViewController.swift
//  MillionerGame
//
//  Created by Egor Efimenko on 13.06.2022.
//

import UIKit
// MARK: - Protocol
protocol GameViewControllerDelegate: AnyObject {
    func didEndGame(withResult result: Int)
}

final class GameViewController: UIViewController {
    // MARK: - Constants
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answerA: UIButton!
    @IBOutlet weak var answerB: UIButton!
    @IBOutlet weak var answerC: UIButton!
    @IBOutlet weak var answerD: UIButton!
    
    weak var delegate: GameViewControllerDelegate?
    
    private let questions: Questions = GameSingleton.shared.questions
    private var numberOfQuestion = 0
    private var score = 0
    // MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        config()
    }
    // MARK: - Button
    @IBAction func buttonA(_ sender: Any) {
        clickButton("A")
    }
    
    @IBAction func buttonB(_ sender: Any) {
        clickButton("B")
    }
    
    @IBAction func buttonC(_ sender: Any) {
        clickButton("C")
    }
    
    @IBAction func buttonD(_ sender: Any) {
        clickButton("D")
    }
    // MARK: - Functions
    private func clickButton(_ answer: String) {
        if questions[numberOfQuestion].answer == answer {
            score += 1
            numberOfQuestion += 1
            config()
        } else {
            falseAnswer()
        }
    }
    private func config() {
        if numberOfQuestion == questions.count {
            сongrats()
        } else {
            questionText.text = questions[numberOfQuestion].question
            answerA.setTitle(questions[numberOfQuestion].answers.a, for: .normal)
            answerB.setTitle(questions[numberOfQuestion].answers.b, for: .normal)
            answerC.setTitle(questions[numberOfQuestion].answers.c, for: .normal)
            answerD.setTitle(questions[numberOfQuestion].answers.d, for: .normal)
        }
    }
    private func сongrats() {
        let alert = UIAlertController(title: "Вы выиграли", message: "Ваш счет \(score)", preferredStyle: .alert)
        let yes = UIAlertAction(title: "Отлично", style: .default) { _ in
            self.endGame()
        }
        alert.addAction(yes)
        self.present(alert, animated: true)
    }
    private func falseAnswer() {
        let alert = UIAlertController(title: "Ответ неверный!", message: nil, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Назад", style: .cancel, handler: {_ in
            self.endGame()
        })
        alert.addAction(ok)
        self.present(alert, animated: true)
    }
    private func endGame() {
        delegate?.didEndGame(withResult: self.score)
        dismiss(animated: true, completion: nil)
    }
}
