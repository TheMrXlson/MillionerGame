//
//  SettingsViewController.swift
//  MillionerGame
//
//  Created by Egor Efimenko on 19.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var difficult: UISegmentedControl!
    @IBOutlet weak var randomSwitch: UISwitch!
    
    private var selectedDifficult: Difficult {
        switch difficult.selectedSegmentIndex {
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

    override func viewDidLoad() {
        super.viewDidLoad()
        randomSwitch.setOn(GameSingleton.shared.randomQuestions, animated: false)
    }
    deinit {
        GameSingleton.shared.setDifficult(selectedDifficult)
        GameSingleton.shared.setRandom(randomSwitch.isOn)
    }
    
}
