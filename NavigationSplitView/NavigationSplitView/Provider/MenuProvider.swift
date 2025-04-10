//
//  MenuProvider.swift
//

import Foundation

struct MenuProvider {
    let mainMenuItems = {
        // Items for Walk
        let devices: [MenuItem] = [
            MenuItem( name: "Mac", icon: "macmini"),
            MenuItem(name: "Strada", icon: "ipod"),
            MenuItem(name: "iPod Shuffle", icon: "ipodshuffle.gen3"),
            MenuItem(name: "Cinema Display",icon: "display"),
            MenuItem(name: "Flip Phone", icon: "flipphone"),
            MenuItem(name: "Radio Waves", icon: "airtag.radiowaves.forward.fill")
        ]
        
        // Items for Run
        let sports: [MenuItem] = [
            MenuItem(name: "Badminton", icon: "figure.badminton"),
            MenuItem(name: "Barre", icon: "figure.barre"),
            MenuItem(name: "Baseball", icon: "figure.baseball"),
            MenuItem(name: "Basketball", icon: "figure.basketball")
        ]
        
        // Items for Roll
        let vehicules = [
            MenuItem(name: "Car", icon: "car.fill"),
            MenuItem(name: "Airplane", icon: "airplane"),
            MenuItem(name: "Boat", icon: "sailboat.fill"),
            MenuItem(name: "Train", icon: "cablecar")
        ]
        
        // Everything is here
        let mainItems = [
            MenuItem(name: "Devices", icon: "command.circle.fill", subMenuItems: devices),
            MenuItem(name: "Fitness", icon: "figure.run.circle.fill", subMenuItems: sports),
            MenuItem(name: "Transportation", icon: "bicycle.circle.fill", subMenuItems: vehicules)
        ]
        
        return mainItems
    }()
    
    func subMenuItems(for id: MenuItem.ID) -> [MenuItem]? {
        guard let menuItem = mainMenuItems.first(where: { $0.id == id }) else {
            return nil
        }
        
        return menuItem.subMenuItems
    }
    
    func menuItem(for categoryID: MenuItem.ID, itemID: MenuItem.ID) -> MenuItem? {
        guard let subMenuItems = subMenuItems(for: categoryID) else {
            return nil
        }
        
        guard let menuItem = subMenuItems.first(where: { $0.id == itemID }) else {
            return nil
        }
        
        return menuItem
    }
}
