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

    @NSManaged public var title: String?
    @NSManaged public var price: String?
    @NSManaged public var image: String?

}

extension Dish : Identifiable {

}
