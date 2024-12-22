//
//  ViewController.swift
//  CommonInputControls
//
//  Created by Steffen Turner on 11/14/24.
//

import UIKit

class ViewController: UIViewController {

    //learning outlets
    @IBOutlet weak var toggle: UISwitch!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var button: UIButton!
    
    //outlets for "Basic Interactions" lab
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //last step for lab
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        
    }
    
    
    // each of the following actions are meant to help me learn about the responses for different objects
    @IBAction func respondToTapGesture (_ sender: UITapGestureRecognizer) {
        let location = sender.location(in: view)
        print(location)
    }
    
    var tapped = 0
    

    
    @IBAction func buttonTapped(_ sender: UIButton) {
        print("I was tapped!")
        //lines 40-48 are not a part of the instructions, I just thought it would be fun to add them
        countTaps()
        func countTaps() {
            tapped += 1
            if tapped == 1 {
                print("This has happened \(tapped) time!")
            } else {
                print("This has happened \(tapped) times!")
            }
        }
        if toggle.isOn {
            print("Switch is on!")
        } else {
            print("Switch is off!")
        }
        print("The slider is set to \(slider.value)")
    }
    
    //lines 58-68 were a part of the original lab instructions, did not remove after outlet creation + buttonTapped() edits
    @IBAction func switchState(_ sender: UISwitch) {
        if sender.isOn {
            print("Switch is on")
        } else {
            print("Switch is off")
        }
    }
   
    @IBAction func slideValue(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBAction func enteredText(_ sender: UITextField) {
        if let text = sender.text {
            print(text)
        }
    }
    
    //this section is for the "Basic Interactions" lab, I decided to just use this same program for it.
    @IBAction func setTextButtonTapped(_ sender: UIButton) {
        label.text = textField.text
    }
    
    @IBAction func clearTextButtonTapped(_ sender: UIButton) {
        label.text = ""
        textField.text = ""
    }
    
}

