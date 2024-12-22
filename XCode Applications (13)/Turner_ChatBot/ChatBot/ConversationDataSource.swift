import Foundation
class ConversationDataSource {
    
    /// The number of Messages in the conversation
    var messages = [openingLine]
    var messageCount: Int {
       return messages.count
    }
    /// Add a new question to the conversation
    func add(question: String) {
        let message = Message(date: Date(),
            text: question, type: .question)
        messages.append(message)
        print("Asked to add question: \(question)")
    }
    
    /// Add a new answer to the conversation
    func add(answer: String) {
        let message = Message(date: Date(), text: answer,
            type: .answer)
        messages.append(message)
        print("Asked to add answer: \(answer)")
        var messageCount: Int {
           return messages.count
        }
    }
    
    /// The Message at a specific point in the conversation
    func messageAt(index: Int) -> Message {
        return messages[index]
    }
}
