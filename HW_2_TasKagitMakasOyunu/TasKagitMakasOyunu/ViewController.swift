//
//  ViewController.swift
//  TasKagitMakasOyunu
//
//  Created by imrahor on 7.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var rock: UIImageView!
    @IBOutlet weak var paper: UIImageView!
    @IBOutlet weak var scissors: UIImageView!
    @IBOutlet weak var yourScore: UILabel!
    @IBOutlet weak var pcScore: UILabel!
    
    var chosenImage: String?
    var yScore = 0
    var pScore = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.navigationItem.hidesBackButton = true
        yourScore.text = "Your Score: \(yScore)"
        pcScore.text = "Computer Score: \(pScore)"
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(pickedImage))
        rock.addGestureRecognizer(gestureRecognizer)
        let gestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(pickedImage2))
        paper.addGestureRecognizer(gestureRecognizer2)
        let gestureRecognizer3 = UITapGestureRecognizer(target: self, action: #selector(pickedImage3))
        scissors.addGestureRecognizer(gestureRecognizer3)
    }
    
    @objc func pickedImage(){
        rock.alpha = 0.30
        scissors.alpha = 1
        paper.alpha = 1
        chosenImage = "rock"
    }
    @objc func pickedImage2(){
        paper.alpha = 0.30
        rock.alpha = 1
        scissors.alpha = 1
        chosenImage = "paper"
    }
    @objc func pickedImage3(){
        scissors.alpha = 0.30
        rock.alpha = 1
        paper.alpha = 1
        chosenImage = "scissors"
    }
    
    func alertMessage(){
        let alert = UIAlertController(title: "Alert", message: "Chose your image!", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    @IBAction func result(_ sender: Any) {
        if chosenImage == nil {
            alertMessage()
        } else {
            performSegue(withIdentifier: "toViewController2", sender: nil)
            paper.alpha = 1
            rock.alpha = 1
            scissors.alpha = 1
        }
    }
    
    @IBAction func start(_ sender: Any) {
        yourScore.text = "Your Score: 0"
        pcScore.text = "Computer Score: 0"
        yScore = 0
        pScore = 0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toViewController2" {
            let dVC = segue.destination as! ViewController2
            dVC.chosenImage = chosenImage
            dVC.yourScore = yScore
            dVC.pcScore = pScore
        }
    }
}

