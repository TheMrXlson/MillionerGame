//
//  MainViewController.swift
//  MillionerGame
//
//  Created by Egor Efimenko on 12.06.2022.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var result: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) { switch segue.identifier {
    case "startGameSegue":
        guard let destination = segue.destination as? GameViewController else { return }
        destination.delegate = self
    default:
        break
    } }
    
}

extension MainViewController: GameViewControllerDelegate {
    func didEndGame(withResult result: Int) {
        self.result.text = "Последний результат \(result)"
        var resultDifficult: String {
            switch GameSingleton.shared.difficult {
            case .easy :
                return "Легко"
            case .medium :
                return "Обычный"
            case .hard :
                return "Невозможный"
            }
        }
        let record = Record(date: Date(), score: result, difficult: resultDifficult)
        GameSingleton.shared.addRecord(record)
    }
}
