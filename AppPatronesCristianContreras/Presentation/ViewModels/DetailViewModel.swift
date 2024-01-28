//
//  DetailViewModel.swift
//  AppPatronesCristianContreras
//
//  Created by Cristian Contreras Velásquez on 28-01-24.
//

import Foundation

final class DetailViewModel {
//binding con UI
var detailStatusLoad: ((CustomStatusLoad) -> Void)?

//caseUse
let detailUseCase: DetailUseCaseProtocol

var dataHeroe: [HeroModel] = []

//init
init(detailUseCase: DetailUseCaseProtocol = DetailUseCase()) {
    self.detailUseCase = detailUseCase    
}

//Llamada a getHeroes
    func loadHero(name: String) {
    detailStatusLoad?(.loading)
    
        detailUseCase.getHeroes(name: name) { [weak self] heroe in
        DispatchQueue.main.async {
            //print(heroe)
            self?.dataHeroe = heroe
            self?.detailStatusLoad?(.loaded)
        }
    } onError: { [weak self] networkError in
        DispatchQueue.main.async {
            self?.detailStatusLoad?(.error)
        }
    }
}
    
    
}
