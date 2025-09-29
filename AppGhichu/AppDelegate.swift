//
//  AppDelegate.swift
//  AppGhichu
//
//  Created by nguyễn xuân chiến on 4/9/25.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

          // Khởi tạo UIWindow
          window = UIWindow(frame: UIScreen.main.bounds)

          // Load ViewController từ XIB
          let homeVC = MainViewController(nibName: "MainViewController", bundle: nil)

          // Gán rootViewController (bọc trong NavigationController nếu cần)
          window?.rootViewController = UINavigationController(rootViewController: homeVC)

          // Hiển thị
          window?.makeKeyAndVisible()

          return true
      }

  

}

