//
//  HeroModels.swift
//  AppPatronesCristianContreras
//
//  Created by Cristian Contreras Velásquez on 27-01-24.
//

import Foundation

struct HeroModel: Decodable, CustomCell {
    let id: String
    let name: String
    let description: String
    let photo: String
    let favorite: Bool
}
