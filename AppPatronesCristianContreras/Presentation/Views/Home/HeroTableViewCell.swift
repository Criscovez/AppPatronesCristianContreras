//
//  HeroTableViewCell.swift
//  AppPatronesCristianContreras
//
//  Created by Cristian Contreras Velásquez on 27-01-24.
//

import UIKit

protocol CustomCell {
    var photo: String { get }
    var id: String { get }
    var name: String { get }
    var description: String { get }
}

class HeroTableViewCell: UITableViewCell {
    //MARK: - Identifier
    static let identifier = "HeroTableViewCell"

    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroDescriptionLabel: UILabel!
    
    //MARK: - Configure
    func configure<T: CustomCell>(with heroe: T) {
        
        heroNameLabel.text = heroe.name
        heroDescriptionLabel.text = heroe.description
        
        guard let imageURL = URL(string: heroe.photo)  else {
            return
        }
        
        heroImageView.setImage(url: imageURL)
    }
    
}
