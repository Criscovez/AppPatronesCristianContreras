//
//  HomeViewModel.swift
//  AppPatronesCristianContreras
//
//  Created by Cristian Contreras Velásquez on 26-01-24.
//

import Foundation

final class HomeViewModel {
    
    //binding con UI
    var homeStatusLoad: ((CustomStatusLoad) -> Void)?
    
    //caseUse
    let homeUseCase: HomeUseCaseProtocol
    
    var dataHeroes: [HeroModel] = []
    
    //init
    init(homeUseCase: HomeUseCaseProtocol = HomeUseCase()) {
        self.homeUseCase = homeUseCase
    }
    
    //Llamada a getHeroes
    func loadHeros() {
        homeStatusLoad?(.loading)
        
        homeUseCase.getHeroes { [weak self] heroes in
            DispatchQueue.main.async {
                print(heroes)
                self?.dataHeroes = heroes
                self?.homeStatusLoad?(.loaded)
            }
        } onError: { [weak self] networkError in
            DispatchQueue.main.async {
                self?.homeStatusLoad?(.error)
            }
        }
    }
}
