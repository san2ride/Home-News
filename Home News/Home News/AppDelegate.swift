//
//  AppDelegate.swift
//  Home News
//
//  Created by Jason Sanchez on 9/29/18.
//  Copyright © 2018 Jason Sanchez. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var coreData = CoreDataStack()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        checkDataStore()
        
        let managedObjectContext = coreData.persistentContainer.viewContext
        
        let tabBarController = self.window?.rootViewController as! UITabBarController
        
        // First Tab - Home List
        let homeListNavController = tabBarController.viewControllers?[0] as! UINavigationController
        let homeListController = homeListNavController.topViewController as! HomeListController
        homeListController.managedObjectContext = managedObjectContext
        
        // Second Tab - Summary View
        let summaryNavController = tabBarController.viewControllers?[1] as! UINavigationController
        let summaryController = summaryNavController.topViewController as! SummaryController
        summaryController.managedObjectContext = managedObjectContext
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {}

    func applicationDidEnterBackground(_ application: UIApplication) {}

    func applicationWillEnterForeground(_ application: UIApplication) {}

    func applicationDidBecomeActive(_ application: UIApplication) {}

    func applicationWillTerminate(_ application: UIApplication) {
        coreData.saveContext()
    }
    
    func checkDataStore() {
        let request: NSFetchRequest<Home> = Home.fetchRequest()
        let moc = coreData.persistentContainer.viewContext
        do {
            let homeCount = try moc.count(for: request)
            
            if homeCount == 0 {
                uploadSampleData()
            }
        }
        catch {
            fatalError("Error in counting home record")
        }
    }
    
    func uploadSampleData() {
        
    }
}
