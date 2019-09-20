//
//  ViewController.swift
//  Concentration
//
//  Created by Yafira on 9/16/19.
//  Copyright © 2019 Yafira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    private lazy var game: Concentration = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    private lazy var game = newConcentration()
    
//    var numberOfPairsOfCards : Int {
//        return (cardButtons.count + 1) / 2
//    }
    
    private(set) var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
            scoreCountLabel.text = "Score: \(game.scoreCount)"
        }
    }
    
    @IBOutlet private weak var scoreCountLabel: UILabel!
    
    @IBOutlet private weak var flipCountLabel: UILabel!
    
    @IBOutlet private var cardButtons: [UIButton]!
    
    @IBAction private func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("chosen card was not in cardButtons")
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        game = newConcentration()
        emojiChoices = newEmojiChoices()
        updateViewFromModel()
    }
    
    private func newConcentration() -> Concentration {
        return Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    
    }
    
    private func updateViewFromModel() {
        for index in 0..<cardButtons.count {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.8972520582, green: 0.8015871756, blue: 1, alpha: 0) : #colorLiteral(red: 0.910860002, green: 0.8135035634, blue: 0.9508295655, alpha: 1)
            }
        }
    }
    
    private var emojiThemes =  [
//                    Themes: cosmos, nature, hardware/tools, moon phases, fruits, confectionery
                    ["🌙","⭐️","💫","💥", "✨","⚡️", "🌈", "🌞", "☄️", "🌛", "🌜", "🌟", "🌎","☁️"],
                    ["🌺","🌸","🌼","🌻", "🌹","🌷","🌵","🍀", "🌿", "🌱", "🌾", "🍄", "🍁", "🥀"],
                    ["🔧","🔨","🛠","🔩","⛏","🔪","⚙️","⛓", "🔑", "🔗", "🗝", "🔒", "🔐"],
                    ["🌕","🌖","🌗","🌘","🌑", "🌒","🌓","🌔", "🌝", "🌚"],
                    ["🍓","🍐","🍒","🥝", "🍇","🍉","🥥","🍍","🥭", "🍈", "🍋", "🍊"],
                    ["🍡","🍧","🍨","🍦", "🧁","🍰","🍩","🍪","🍥", "🍬", "🍭", "🍫", "🍵"]   ]
    

    
    private lazy var emojiChoices: [String] = newEmojiChoices()
    private func newEmojiChoices() -> [String] {
        return emojiThemes[Int(arc4random_uniform(UInt32(emojiThemes.count)))]
    }
    
    private var emoji = [Int:String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
            }

        return emoji[card.identifier] ?? "?"
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}


