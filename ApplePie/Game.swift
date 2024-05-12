import Foundation

struct Game{
    var word:String
    var incorrectMovesRemaining:Int
    var guessedLetters : [Character]
    var formatterWord:String{
        var gussedWord = ""
        for letter in word{
            if guessedLetters.contains(letter){
                gussedWord += "\(letter)"
            }
            else{
                gussedWord += "_"
            }
        }
        return gussedWord
    }
    mutating func playerGussed(letter:Character){
        guessedLetters.append(letter)
        if !word.contains(letter){
            incorrectMovesRemaining -= 1
        }
        
    }
}
