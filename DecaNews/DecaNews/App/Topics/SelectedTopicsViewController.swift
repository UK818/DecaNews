//
//  SelectedTopicsViewController.swift
//  DecaNews
//
//  Created by Decagon on 30/01/2022.
//

import UIKit

final class SelectedTopicsViewController: UIViewController {

    @IBOutlet weak var gymFitnessButton: UIButton!
    @IBOutlet weak var recipesButton: UIButton!
    @IBOutlet weak var healthButton: UIButton!
    @IBOutlet weak var sportsButton: UIButton!
    @IBOutlet weak var travelButton: UIButton!
    @IBOutlet weak var natureButton: UIButton!
    @IBOutlet weak var entertainmentButton: UIButton!
    @IBOutlet weak var educationButton: UIButton!
    @IBOutlet weak var writingButton: UIButton!
    @IBOutlet weak var architectureButton: UIButton!
    @IBOutlet weak var photographyButton: UIButton!
    @IBOutlet weak var bookButton: UIButton!
    @IBOutlet weak var designButton: UIButton!
    @IBOutlet weak var businessButton: UIButton!
    @IBOutlet weak var musicButton: UIButton!
    var buttonStore = [Int: Bool]()
    var buttons: [UIButton] = [UIButton]()
    var serviceViewModel: ServicesViewModel?
    var navigateHome: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttons = [musicButton, businessButton, designButton, bookButton, photographyButton,
                     architectureButton, writingButton, educationButton, entertainmentButton,
                     natureButton, travelButton, sportsButton, healthButton, recipesButton, gymFitnessButton]
        for button in buttons {
            buttonStore[button.tag] = false
            button.backgroundColor = UIColor(named: "grey")
            button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        }
    }

    @objc
    func buttonClicked(_ sender: Any) {
        guard let button = sender as? UIButton, let buttonState = buttonStore[button.tag]  else { return }
        if buttonState {
            buttonStore[button.tag] = false
            button.backgroundColor = UIColor(named: "grey")
            button.setTitleColor(.black, for: .normal)
        } else {
            buttonStore[button.tag] = true
            button.backgroundColor = .black
            button.setTitleColor(.white, for: .normal)
        }
    }

    @IBAction func getStarted(_ sender: Any) {
        var output = [String]()
        for (key, value) in buttonStore {
            if value, let str = buttons[key].titleLabel?.text {
                output.append(str)
            }
        }
        serviceViewModel?.add(topics: output)
        navigateHome?()
    }
}

extension SelectedTopicsViewController: Storyboardable {
    static var storyboard: Storyboard { .auth }
}
