//
//  AppDelegate.swift
//  Search_Recipes
//
//  Created by Anastasia on 21.02.2021.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  private var appCoordinator: Coordinator!

  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let navController = UINavigationController()
    appCoordinator = AppCoordinator(router: Router(with: navController))
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = navController
    window?.makeKeyAndVisible()
    
    appCoordinator.start()
    
    return true
  }
}

