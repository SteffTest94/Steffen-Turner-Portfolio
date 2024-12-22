//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Steffen Turner on 12/4/24.
//

import UIKit

class ResultsViewController: UIViewController {
    
    //Relevant containers
    var responses: [Answer]
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Outlets for results labels
    @IBOutlet var resultsLabel: UILabel!
    @IBOutlet var definitionLabel: UILabel!
    
    //Outlets for result images; these are kept in a view for easy constraint usage, but I will be using the individual image views for this.
    @IBOutlet var blueCircle: UIImageView!
    @IBOutlet var redRircle: UIImageView!
    @IBOutlet var yellowCircle: UIImageView!
    @IBOutlet var cyanCircle: UIImageView!
    @IBOutlet var magentaCircle: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatedResult()
        
        navigationItem.hidesBackButton = true
        
    }
    
    //Code for calculating results using a dictionary
    //frequencyOfAnswers is meant to build the initial dictionary, frequentAnswersSorted was meant to sort the dictionary as instructed, mostCommonAnswer is simplified code that sorts and provides the sort result in one line; the simplified code was provided later in the book, but I kept frequentAnswersSorted in the notes for reference later, as I like to use my academic projects as references when I do similar work.
    
    //I also added the ability to show image representation of the result; this part was not in the project instructions, but the screen felt empty to me without a visual
    func calculatedResult() {
        //Hid images initially; this will not be apperant to user, but it will prevent accidental overlapping of the images
        blueCircle.isHidden = true
        redRircle.isHidden = true
        yellowCircle.isHidden = true
        cyanCircle.isHidden = true
        magentaCircle.isHidden = true
        
        let frequencyOfAnswers = responses.reduce(into: [:]) {
            (counts, answer) in counts[answer.type, default: 0] += 1
        }
        //let frequentAnswersSorted = frequencyOfAnswers.sorted(by: {(answerPair1, answerPair2) in return answerPair1.value > answerPair2.value})
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        //Code to update labels
        resultsLabel.text = "You are \(mostCommonAnswer.rawValue)!"
        definitionLabel.text = mostCommonAnswer.definition
        //Code for showing the correct image, using a switch
        switch mostCommonAnswer.rawValue {
        case "Blue":
            blueCircle.isHidden = false
        case "Red":
            redRircle.isHidden = false
        case "Yellow":
            yellowCircle.isHidden = false
        case "Cyan":
            cyanCircle.isHidden = false
        case "Magenta":
            magentaCircle.isHidden = false
        default:
            break
        }
    
    }
}
