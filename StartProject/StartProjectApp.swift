//
//  StartProjectApp.swift
//  StartProject
//
//  Created by 박광규 on 2021/03/16.
//
import AdBrixRM
import AppTrackingTransparency
import SwiftUI
import AdSupport


class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]?) -> Bool {
        print("If you can see this log, AppDelegate is working!!!!")
        // Create AdBrixRM Instance
        
        let adBrix = AdBrixRM.getInstance
        adBrix.stopGettingIDFA() // Start Using IDFA
        // Set adbrix appKey & secretKey
        adBrix.initAdBrix(appKey: "fOFp6I5nHkG2uG37zGFPYA", secretKey: "Jr1TpxIrsUGehDVVaDuMMw")
        // If event count is 10, upload event to adbrix server
            adBrix.setEventUploadCountInterval(AdBrixRM.AdBrixEventUploadCountInterval.MIN)
        return true
    }
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        // Create AdBrixRM Instance
        let adBrix = AdBrixRM.getInstance
        
        if connectionOptions.urlContexts.first?.url != nil {
           
          let urlinfo = connectionOptions.urlContexts.first?.url
            
          // Add Deep Link Open Tracking Code
          adBrix.deepLinkOpen(url:urlinfo!)
            print(">>>>>>>>>> UIscene1: deep link open!!!!!   >>>>>>>>>>>>>> ")
        }
           
       }
       
       
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
           
           let url = URLContexts.first!.url as NSURL
           
            // Create AdBrixRM Instance
           let adBrix = AdBrixRM.getInstance
           
           // Add Deep Link Open Tracking Code
        adBrix.deepLinkOpen(url:url as URL)
        print(">>>>>>>>>> UIscene2: deep link open!!!!!   >>>>>>>>>>>>>> ")
           
       }
//       func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
//
//           let url = URLContexts.first!.url as NSURL
//
//            // Create AdBrixRM Instance
//           let adBrix = AdBrixRM.getInstance
//
//           // Add Deep Link Open Tracking Code
//           adBrix.deepLinkOpen(url:url)
//
//       }
    
    
}


@main
struct StartProjectApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    
    // To use Order.swift you have to add @StateObject
    @StateObject var order = Order()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
