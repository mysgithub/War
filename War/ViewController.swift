//
//  ViewController.swift
//  War
//
//  Created by Rokde, Ghanshyam on 11/1/15.
//  Copyright (c) 2015 shyam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstCardImageView: UIImageView!
    @IBOutlet weak var secondCardImageView: UIImageView!
    @IBOutlet weak var playRoundButton: UIButton!
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var playerScoreLabel: UILabel!
    var playerScore:Int = 0
    @IBOutlet weak var enemyScoreLabel: UILabel!
    var enemyScore:Int = 0
    @IBOutlet weak var gameCountLabel: UILabel!
    let maxGameCount:Int = 20
    var currentGame:Int = 0
    
    var cardNamesArray:[String] = ["card2", "card3", "card4", "card5", "card6", "card7", "card8", "card9", "card10", "jack", "queen", "king", "ace"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.gameCountLabel.text = "Total Games \(self.maxGameCount)"
        self.currentGame += 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func playRoundTapped(sender: UIButton) {
        // first card random number
        let firstRandomNumber:Int = Int(arc4random_uniform(13))
        let firstCardString:String = self.cardNamesArray[firstRandomNumber]
        
        // second card random number
        let secondRandomNumber:Int = Int(arc4random_uniform(13))
        let secondCardString:String = self.cardNamesArray[secondRandomNumber]
        
        // set the card image
        self.firstCardImageView.image = UIImage(named: firstCardString)
        self.secondCardImageView.image = UIImage(named: secondCardString)
        
        // who is having higher card?
        if firstRandomNumber > secondRandomNumber {
            self.playerScore += 1
            self.playerScoreLabel.text = String(self.playerScore)
        }
        else if firstRandomNumber == secondRandomNumber {
            // nothing
        }
        else {
            self.enemyScore += 1
            self.enemyScoreLabel.text = String(self.enemyScore)
        }
        
        if self.currentGame == self.maxGameCount {
            
            if self.playerScore > self.enemyScore {
                self.gameCountLabel.text = "Winner is Player"
            }
            else if self.playerScore == self.enemyScore {
                self.gameCountLabel.text = "Woh!! Tie.."
            }
            else{
                self.gameCountLabel.text = "Winner is Enemy"
            }
            // Reset everything
            self.currentGame = 1
            self.playerScore = 0
            self.playerScoreLabel.text = String(self.playerScore)
            self.enemyScore = 0
            self.enemyScoreLabel.text = String(self.enemyScore)
            // set the card image
            self.firstCardImageView.image = UIImage(named: "back")
            self.secondCardImageView.image = UIImage(named: "back")
        }
        else {
            self.currentGame += 1
        
            self.gameCountLabel.text = "Game \(self.currentGame) of \(self.maxGameCount)"
        
        }
    }
    
}

