//
//  SceneDelegate.swift
//  MSZCollectionViewLayout
//
//  Created by MSZ on 11/7/19.
//  Copyright © 2019 MSZ. All rights reserved.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController()
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}

