import UIKit


class ViewController: UIViewController {
    
    var listOfWords = ["buccaneer","swift","glorious","incadesent","bug","program"]
    var incorrectMovesAllowed = 7
    var totalWins = 0{
        didSet{
            newRound()
        }
    }
    var totalLosses = 0{
        didSet{
            newRound()
        }
    }
    
    
    @IBOutlet weak var treeImageView: UIImageView!
    
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet var letterButtons: [UIButton]!
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newRound()
        
    }
    var currentGame : Game!
    func newRound(){
        if !listOfWords.isEmpty{
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            updateUI()
            enableButton(true)
        }
        else
        {
            enableButton(false)
        }
        
    }
    func updateUI(){
        var letters = [String]()
        for letter in currentGame.formatterWord{
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        
        scoreLabel.text = "Wins: \(totalWins) , Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        correctWordLabel.text = wordWithSpacing
    }
    
    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.configuration!.title!
        let letter = Character(letterString.lowercased())
        currentGame.playerGussed(letter: letter)
        updateUI()
        updateGameState()
    }
    func updateGameState(){
        if currentGame.incorrectMovesRemaining == 0{
            totalLosses += 1
            
        }
        else if currentGame.word == currentGame.formatterWord{
            totalWins += 1
        }
        else{
            updateUI()
        }
    }
    func enableButton(_ enable:Bool){
        for button in letterButtons{
            button.isEnabled = enable
        }
    }

}

