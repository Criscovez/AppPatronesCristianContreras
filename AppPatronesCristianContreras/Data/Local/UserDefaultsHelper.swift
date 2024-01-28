//
//  UserDefaultsHelper.swift
//  AppPatronesCristianContreras
//
//  Created by Cristian Contreras Velásquez on 26-01-24.
//

import Foundation

class UserDefaultsHelper {
    
    private static let userDefaults = UserDefaults.standard
    
    private enum Constant {
        static let tokenKey = "KCToken"
    }
    
    static func getToken() -> String? {
        userDefaults.string(forKey: Constant.tokenKey)
    }
    
    static func save(token: String) {
        userDefaults.set(token, forKey: Constant.tokenKey)
    }
    
    static func deleteToken() {
        userDefaults.removeObject(forKey: Constant.tokenKey)
    }
}
