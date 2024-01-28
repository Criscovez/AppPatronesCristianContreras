//
//  SceneDelegate.swift
//  AppPatronesCristianContreras
//
//  Created by Cristian Contreras Velásquez on 26-01-24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        
        //Instanciamos 1r view controller
        let loginVC = LoginViewController()
        //Instanciamos Navigator
        let navigatorController = UINavigationController(rootViewController: loginVC)
        
        window.rootViewController = navigatorController
        window.makeKeyAndVisible()
        self.window = window
    }
}
