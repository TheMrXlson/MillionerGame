//
//  NewQuestionViewController.swift
//  MillionerGame
//
//  Created by Egor Efimenko on 19.06.2022.
//

import UIKit

class NewQuestionViewController: UIViewController {
    
    @IBOutlet weak var labelUnderTextfield: UILabel!
    @IBOutlet weak var textfield: UITextField!
    @IBOutlet weak var labelUnderSegment: UILabel!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    let builder = QuestionBuilder()
    private var numberOfWork = 1

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func work(_ number: Int) {
        guard let textInField = textfield.text else { return wrong() }
        
        switch number {
        case 1:
            var selectedDifficult: Difficult {
                switch segmentControl.selectedSegmentIndex {
                case 0:
                    return .easy
                case 1:
                    return .medium
                case 2:
                    return .hard
                default:
                    return .easy
                }
            }
            builder.setDifficult(selectedDifficult)
            builder.setQuestionText(textInField)
            labelUnderTextfield.text = "Введите первый вариант ответа"
            segmentControl.isHidden = true
            labelUnderSegment.isHidden = true
        case 2:
            builder.setAnswerA(textInField)
            labelUnderTextfield.text = "Введите второй вариант ответа"
        case 3:
            builder.setAnswerB(textInField)
            labelUnderTextfield.text = "Введите третий вариант ответа"
        case 4:
            builder.setAnswerC(textInField)
            labelUnderTextfield.text = "Введите четвертый вариант ответа"
        case 5:
            builder.setAnswerD(textInField)
            labelUnderTextfield.isHidden = true
            textfield.isHidden = true
            segmentControl.isHidden = false
            labelUnderSegment.isHidden = false
            labelUnderSegment.text = "Выберите ответ на вопрос"
            segmentControl.insertSegment(with: nil, at: 3, animated: false)
            segmentControl.setTitle("A", forSegmentAt: 0)
            segmentControl.setTitle("B", forSegmentAt: 1)
            segmentControl.setTitle("C", forSegmentAt: 2)
            segmentControl.setTitle("D", forSegmentAt: 3)
            
        case 6:
            var selected: String {
                switch segmentControl.selectedSegmentIndex {
                case 0:
                    return "A"
                case 1:
                    return "B"
                case 2:
                    return "C"
                case 3:
                    return "D"
                default:
                    return ""
                }
            }
            builder.rightAnswer(selected)
            GameSingleton.shared.addQuestion(builder.build())
            congrats()
        default:
            wrong()
        }

        textfield.text = ""
    }
    
    
    
    

    @IBAction func Button(_ sender: Any) {
        work(numberOfWork)
        numberOfWork += 1
    }
    
    private func wrong() {
        let alert = UIAlertController(title: "Заполните текстовое поле верно", message: nil, preferredStyle: .alert)
        let yes = UIAlertAction(title: "Понятно", style: .default)
        alert.addAction(yes)
        self.present(alert, animated: true)
    }
    private func congrats() {
        let alert = UIAlertController(title: "Ваш вопрос добавлен!", message: nil, preferredStyle: .alert)
        let yes = UIAlertAction(title: "Отлично", style: .default)
        alert.addAction(yes)
        self.present(alert, animated: true)
    }
}
