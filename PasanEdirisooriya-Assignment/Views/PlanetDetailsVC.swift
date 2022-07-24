//
//  PlanetDetailsVC.swift
//  PasanEdirisooriya-Assignment
//
//  Created by Pasan Edirisooriya on 2022-07-23.
//

import UIKit

class PlanetDetailsVC: UIViewController {

    let vm = PlanetDetailsVM()
    
    @IBOutlet weak var imgPlanet: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblOrbitalPeriod: UILabel!
    @IBOutlet weak var lblGravity: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupUI()
    }
    
    func setupUI(){
        imgPlanet.setRoundBorders(5)
    }
    
    //MARK: Setting data set by previous view controller
    func setData(){
        imgPlanet.downloaded(from: Constants.PICSUM_IMAGE + "200.jpg")
        lblName.text = vm.planet?.name ?? ""
        lblOrbitalPeriod.text = "\(vm.planet?.orbitalPeriod ?? "") Days"
        lblGravity.text = "\(vm.planet?.gravity ?? "") Gs"
    }
    
    @IBAction func didTapOnBack(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
