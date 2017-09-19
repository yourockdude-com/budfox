//
//  AppDelegate.swift
//  budfox
//
//  Created by Vladimir Psyukalov on 18.09.17.
//  Copyright © 2017 YOUROCK INC. All rights reserved.
//


import UIKit


@UIApplicationMain

class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.backgroundColor = .black;
        
        let authenticationVC: BAuthenticationViewController = BAuthenticationViewController()
        
        let navigationCoontroller: UINavigationController = UINavigationController(rootViewController: authenticationVC)
        navigationCoontroller.navigationBar.isTranslucent = false
        navigationCoontroller.navigationBar.barTintColor = UIColor(colorLiteralRed: 236.0 / 255.0,
                                                                   green: 236.0 / 255.0,
                                                                   blue: 236.0 / 255.0,
                                                                   alpha: 1.0)
        
        self.window?.rootViewController = navigationCoontroller
        self.window?.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        //
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        //
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        //
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        //
    }

    func applicationWillTerminate(_ application: UIApplication) {
        //
    }

}
