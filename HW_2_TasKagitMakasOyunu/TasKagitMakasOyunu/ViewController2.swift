//
//  ViewController2.swift
//  TasKagitMakasOyunu
//
//  Created by imrahor on 8.07.2023.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var yourChoice: UIImageView!
    
    
    @IBOutlet weak var pcChoice: UIImageView!
    
    
    @IBOutlet weak var resultLabel: UILabel!
    
    var chosenImage: String?
    
    var yourScore: Int?
    var pcScore: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        yourChoice.image = UIImage(named: chosenImage!)
        // Do any additional setup after loading the view.
        let options = ["rock","paper","scissors"]
        let rndmChoice = options[Int.random(in: 0...2)]
        pcChoice.image = UIImage(named: rndmChoice)
        whoWins(rndmChoice, chosenImage!)
    }
    
    func whoWins(_ pc: String, _ my: String) {
      if pc == my {
          resultLabel.text = "Scoreless"
      } else if (my == "paper" && pc == "rock") || (my == "rock" && pc == "scissors") || (my == "scissors" && pc == "paper") {
          resultLabel.text = "You Won"
          yourScore! += 1
      } else {
          resultLabel.text = "You Lost"
          pcScore! += 1
      }
    }
    
    @IBAction func playAgain(_ sender: Any) {
        performSegue(withIdentifier: "VC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VC" {
                let dVC = segue.destination as! ViewController
                dVC.yScore = yourScore!
                dVC.pScore = pcScore!
        }
    }

    
    
    
    
    
    
}
