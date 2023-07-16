//
//  MainViewController.swift
//  HW3-AnimalInfosApp
//
//  Created by imrahor on 16.07.2023.
//

import UIKit
import AVKit
import AVFoundation

class MainViewController: UIViewController {
    
    @IBOutlet weak var cheetah: AnimalView!
    @IBOutlet weak var elephant: AnimalView!
    @IBOutlet weak var giraffe: AnimalView!
    @IBOutlet weak var gorilla: AnimalView!
    @IBOutlet weak var hippo: AnimalView!
    @IBOutlet weak var lion: AnimalView!
    @IBOutlet weak var ostrich: AnimalView!
    @IBOutlet weak var zebra: AnimalView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Animals"
        setupView()
        setupAnimalViews()
        setupVideo()
    }
    func setupView() {
        elephant.animalName.text = "Elephant"
        elephant.animalImage.image = UIImage(named: "elephant")
        elephant.video = "elephant"
        elephant.webLink = "https://en.wikipedia.org/wiki/Elephant"
        
        cheetah.animalName.text = "Cheetah"
        cheetah.animalImage.image = UIImage(named: "cheetah")
        cheetah.video = "cheetah"
        cheetah.webLink = "https://en.wikipedia.org/wiki/Cheetah"
        
        giraffe.animalName.text = "Giraffe"
        giraffe.animalImage.image = UIImage(named: "giraffe")
        giraffe.video = "giraffe"
        giraffe.webLink = "https://en.wikipedia.org/wiki/Giraffe"
        
        gorilla.animalName.text = "Gorilla"
        gorilla.animalImage.image = UIImage(named: "gorilla")
        gorilla.video = "gorilla"
        gorilla.webLink = "https://en.wikipedia.org/wiki/Gorilla"
        
        hippo.animalName.text = "Hippo"
        hippo.animalImage.image = UIImage(named: "hippo")
        hippo.video = "hippo"
        hippo.webLink = "https://en.wikipedia.org/wiki/Hippopotamus"
        
        lion.animalName.text = "Lion"
        lion.animalImage.image = UIImage(named: "lion")
        lion.video = "lion"
        lion.webLink = "https://en.wikipedia.org/wiki/Lion"
        
        ostrich.animalName.text = "Ostrich"
        ostrich.animalImage.image = UIImage(named: "ostrich")
        ostrich.video = "ostrich"
        ostrich.webLink = "https://en.wikipedia.org/wiki/Common_ostrich"
        
        zebra.animalName.text = "Zebra"
        zebra.animalImage.image = UIImage(named: "zebra")
        zebra.video = "zebra"
        zebra.webLink = "https://en.wikipedia.org/wiki/Zebra"
    }
    private func setupVideo() {
        cheetah.openVideo = watchVideo()
        elephant.openVideo = watchVideo()
        giraffe.openVideo = watchVideo()
        gorilla.openVideo = watchVideo()
        hippo.openVideo = watchVideo()
        lion.openVideo = watchVideo()
        ostrich.openVideo = watchVideo()
        zebra.openVideo = watchVideo()
    }
    
    private func setupAnimalViews() {
            cheetah.openWebAction = routeWebVC()
            elephant.openWebAction = routeWebVC()
            giraffe.openWebAction = routeWebVC()
            gorilla.openWebAction = routeWebVC()
            hippo.openWebAction = routeWebVC()
            lion.openWebAction = routeWebVC()
            ostrich.openWebAction = routeWebVC()
            zebra.openWebAction = routeWebVC()
    }
    
    func routeWebVC() -> (String) -> () {
        return { urlString in
            let storyboard = UIStoryboard(name: "WebViewController", bundle: nil)

            if let webVC = storyboard.instantiateViewController(withIdentifier: "WebViewController") as? WebViewController {
                webVC.urlString = urlString
                self.navigationController?.pushViewController(webVC, animated: true)
            }
        }
    }
    func watchVideo() -> (String) -> () {
        return { video in
            
            if let path = Bundle.main.path(forResource: video, ofType: "mp4") {
                let player = AVPlayer(url: URL(filePath: path))
                
                let playerControl = AVPlayerViewController()
                playerControl.player = player
                
                self.present(playerControl, animated: true) {
                    player.play()
                }
            }
        }
    }
}



