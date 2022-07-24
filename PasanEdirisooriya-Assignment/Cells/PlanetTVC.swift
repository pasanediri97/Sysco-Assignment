//
//  PlanetTVC.swift
//  PasanEdirisooriya-Assignment
//
//  Created by Pasan Edirisooriya on 2022-07-23.
//

import UIKit

class PlanetTVC: UITableViewCell {
    
    @IBOutlet weak var imgPlanet: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblClimate: UILabel!
    @IBOutlet weak var mainView: UIView!
    
    static let id = "PlanetTVC"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
        // Initialization code
    }
    
    func setupUI(){
        [mainView,imgPlanet].forEach { view in
            view.setRoundBorders(5)
        }
        
        mainView.layer.shadowRadius = 2
        mainView.layer.shadowColor = UIColor.black.withAlphaComponent(0.3) .cgColor
        mainView.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        mainView.layer.shadowOpacity = 1
        mainView.layer.masksToBounds = false 
    }
    
    // MARK: - Populate data
    func configureCell(with:Planet){
        imgPlanet.downloaded(from:Constants.PICSUM_IMAGE + "80.jpg")
        lblName.text = "Name: \(with.name ?? "")"
        lblClimate.text = "Climate: \(with.climate ?? "")"
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
