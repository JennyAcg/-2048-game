//
//  Point+CoreDataProperties.swift
//  assign4
//
//  Created by Meisheng Liu on 11/5/21.
//
//

import Foundation
import CoreData


extension Point {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Point> {
        return NSFetchRequest<Point>(entityName: "Point")
    }

    @NSManaged public var latitude: Double
    @NSManaged public var longitude: Double

}

extension Point : Identifiable {

}
