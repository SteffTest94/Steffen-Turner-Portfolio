//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Steffen Turner on 12/4/24.
//

import UIKit

class QuestionViewController: UIViewController {
    
    //Questions for the quiz
    var questions: [Question] = [
        Question(
            text: "What is your favorite food?",
            type: .single,
            answers: [
                Answer(text: "Pizza", type: .🔵),
                Answer(text: "Dessert", type: .🟡),
                Answer(text: "I love all food!", type: .🩷),
                Answer(text: "Pasta", type: .🔴),
                Answer(text: "Anything homemade", type: .🩵)
                ]
        ),
        Question(
            text: "How do you like to spend your time?",
            type: .multiple,
            answers: [
                Answer(text: "Playing sports", type: .🔴),
                Answer(text: "Reading", type: .🔵),
                Answer(text: "Working out", type: .🟡),
                Answer(text: "Going to new places", type: .🩷),
                Answer(text: "Watching movies or TV", type: .🩵)
            ]
        ),
        Question(
            text: "If you were at a party, how likely is it that you would end up as a wallflower?",
            type: .ranged,
            answers: [
                Answer(text:"Unlikely", type: .🔴),
                Answer(text:"Somewhat unlikely", type: .🟡),
                Answer(text:"It could go either way", type: .🩷),
                Answer(text:"Somewhat likely", type: .🔵),
                Answer(text:"Likely", type: .🩵)
            ]
        ),
        Question(
            text: "What is your secret nerdy indulgance (come on, well have at least one)?",
            type: .multiple,
            answers: [
                Answer(text: "Anime", type: .🩷),
                Answer(text: "Video games", type: .🩵),
                Answer(text: "Fanfiction", type: .🔴),
                Answer(text: "Comic books/hero movies", type: .🟡),
                Answer(text: "Tabletop games", type: .🔵)
            ]
        ),
        Question(
            text: "If someone asked to borrow money, how likely are you to say yes?",
            type: .ranged,
            answers: [
                Answer(text: "Unlikely", type: .🩷),
                Answer(text: "Somewhat unlikely", type: .🔴),
                Answer(text: "It could go either way", type: .🩵),
                Answer(text: "Somewhat likely", type: .🟡),
                Answer(text: "Likely", type: .🔵)
            ]
        ),
        Question(
            text: "What is your favorite movie genre?",
            type: .single,
            answers: [
                Answer(text: "Documentary", type: .🩵),
                Answer(text: "Animated", type: .🟡),
                Answer(text: "Romance", type: .🔴),
                Answer(text: "Action", type: .🩷),
                Answer(text: "Fantasy", type: .🔵)
            ]
        )
    ]
    //Question and answer indexes
    var questionIndex = 0
    var answersChosen: [Answer] = []
    
    //Outlets, in this order: title/question label, quiz stacks (sectioned by question type), question progress bar
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    @IBOutlet weak var singleButton5: UIButton!
    
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet var multiSwitch1: UISwitch!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet var multiSwitch2: UISwitch!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet var multiSwitch3: UISwitch!
    @IBOutlet weak var multiLabel4: UILabel!
    @IBOutlet var multiSwitch4: UISwitch!
    @IBOutlet weak var multiLabel5: UILabel!
    @IBOutlet var multiSwitch5: UISwitch!
    
    @IBOutlet weak var rangeStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet var rangedSlider: UISlider!
    
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //IBActions for answers; sends responses to answers index, and then loads next available question, or sends opens results screen if no answers are available
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        case singleButton5:
            answersChosen.append(currentAnswers[4])
        default:
            break
        }
        
        nextQuestion()
    }
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        if multiSwitch1.isOn { answersChosen.append(currentAnswers[0]) }
        if multiSwitch2.isOn { answersChosen.append(currentAnswers[1]) }
        if multiSwitch3.isOn { answersChosen.append(currentAnswers[2]) }
        if multiSwitch4.isOn { answersChosen.append(currentAnswers[3]) }
        if multiSwitch5.isOn { answersChosen.append(currentAnswers[4]) }
        
        nextQuestion()
    }
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
    }
    
    //Function to display current question details
    func updateUI() {
        //Stack views starting out
        singleStackView.isHidden = true
        rangeStackView.isHidden = true
        multipleStackView.isHidden = true
        
        //various containers for display labels
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex) / Float(questions.count)
        
        //Display labels' text
        navigationItem.title = "Question #\(questionIndex + 1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        //Code for determining the answers options used for the current quiz question
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        case .multiple:
            updateMultiStack(using: currentAnswers)
        }
        
        //Code to display answer options for each question type
        func updateSingleStack (using answers: [Answer]) {
            singleStackView.isHidden = false
            singleButton1.setTitle(answers[0].text, for: .normal)
            singleButton2.setTitle(answers[1].text, for: .normal)
            singleButton3.setTitle(answers[2].text, for: .normal)
            singleButton4.setTitle(answers[3].text, for: .normal)
            singleButton5.setTitle(answers[4].text, for: .normal)
        }
        }
    func updateRangedStack (using answers: [Answer]) {
        rangeStackView.isHidden =
        false
        rangedSlider.setValue(0.5, animated: false)
        
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    func updateMultiStack (using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiSwitch5.isOn = false
        
        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
        multiLabel5.text = answers[4].text
    }
    
    //Function used to display the next question, determine if there are any other questions, and send user to results page if there is no other questions available
    func nextQuestion () {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "Results", sender: nil)
        }
    }
    
    //Code to go to the next question and Show results, including IBAction for Results segue
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, responses: answersChosen)
    }
    }

