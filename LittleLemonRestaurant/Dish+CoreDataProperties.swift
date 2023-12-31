//
//  Dish+CoreDataProperties.swift
//  LittleLemonRestaurant
//
//  Created by Tosin Akinbobuyi on 10/3/23.
//
//

import Foundation
import CoreData


extension Dish {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Dish> {
        return NSFetchRequest<Dish>(entityName: "Dish")
    }

    @NSManaged public var image: String?
    @NSManaged public var price: String?
    @NSManaged public var title: String?

    
    static func createDishesFrom(menuItems:[MenuItem],
                                 _ context:NSManagedObjectContext) {
      
        for item in menuItems {
            let dish = Dish(context: context)
            dish.title = item.title
            dish.price = item.price
            dish.image = item.image
        }
        let dish = Dish(context: context)
        dish.title = "Éclairs"
        dish.price = "15"
        dish.image = ""
        try? context.save()
    }
    
}

extension Dish : Identifiable {

}
