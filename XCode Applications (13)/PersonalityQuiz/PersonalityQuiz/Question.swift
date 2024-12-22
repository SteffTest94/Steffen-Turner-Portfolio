//
//  Question.swift
//  PersonalityQuiz
//
//  Created by Steffen Turner on 12/4/24.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: ColorType
}

enum ColorType: String {
    case 🟡 = "Yellow", 🔴 = "Red", 🔵 = "Blue", 🩷 = "Magenta", 🩵 = "Cyan"
    
    //Please note that while I did do a visual check, I did not put the following String text through a grammar/spell checker.
    var definition: String {
        switch self {
        case .🔴: 
            return "You are gennerally a very passionate person! You enjoy being the center of attention, and have a bit of an argumentative streak in you. If you have one weakness, it's that you struggle to admit when you're wrong. But your biggest strength is that you work hard no matter what!"
        case .🔵:
            return "You are generally a calm person. You tend to avoid being the center of attention, but somehow find yourself being the defacto leader of your social group in any given situation. If you have one weakness, its that you struggle to ask for help when you need it. But your biggest strength is your kindness!"
        case .🟡:
            return "You are a bright and cheerful person! You try your best to keep upbeat and positive as much as possible, and this draws people to you. If you have one weakness, its that you get the blues fast when you can't find a positive to focus on. But your biggest strength is you resilience!"
        case .🩵:
            return "You are a kind, but introverted person. You tend to make friends fairly easily (you have no idea how), but enjoy your \"You Time\". If you have one weakness, its that you tend to think of the worst outcome in any situation. But your biggest strength is the close bonds you've built with the people who love you!"
        case .🩷:
            return "You are a carefree and adventerous person. You make friends fast, and enemies just as fast - you tend to hold a grudge! If you have one weakness, its that you tend to let your imagination run wild. But your biggest strength is your cleverness!"
        }
    }
}

