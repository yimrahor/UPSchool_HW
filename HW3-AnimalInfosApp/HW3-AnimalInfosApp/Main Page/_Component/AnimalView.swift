//
//  AnimalView.swift
//  HW3-AnimalInfosApp
//
//  Created by imrahor on 16.07.2023.
//

import UIKit

class AnimalView : UIView {
    
    var webLink: String?
    var video: String?
    
    var openWebAction: ((_ urlString: String) -> ())?
    var openVideo: ((_ videoPath: String) -> ())?
    
    @IBOutlet weak var animalImage: UIImageView!
    @IBOutlet weak var animalName: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        if let viewForXib = Bundle.main.loadNibNamed("AnimalView", owner: self)?[0] as? UIView {
            viewForXib.frame = self.bounds
            viewForXib.layer.cornerRadius = 20
            addSubview(viewForXib)
        }
    }
    
    @IBAction func goToLink(_ sender: Any) {
        openWebAction?(webLink!)
    }
 
    @IBAction func watchVideo(_ sender: Any) {
        openVideo?(video!)
    }
    
}
