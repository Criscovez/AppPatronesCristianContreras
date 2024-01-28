//
//  LoginStatusLoad.swift
//  AppPatronesCristianContreras
//
//  Created by Cristian Contreras Velásquez on 26-01-24.
//

import Foundation

enum LoginStatusLoad {
    case loading(_ isLoading: Bool)
    case loaded
    case showErrorEmail(_ error: String?)
    case showErrorPassword(_ error: String?)
    case errorNetwork(_ error: String)
}
