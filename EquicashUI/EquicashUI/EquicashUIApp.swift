//
//  EquicashUIApp.swift
//  EquicashUI
//
//  Created by katy schaarschmidt on 30.10.24.
//

import SwiftUI
import FirebaseCore

// AppDelegate class for Firebase configuration
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct EquicashUIApp: App {
    // Integrate AppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            HauptmenuView()
        }
    }
}
