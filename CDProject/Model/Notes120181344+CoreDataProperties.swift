//
//  Notes+CoreDataProperties.swift
//  CDProject
//
//  Created by Hamdi moh on 5/28/21.
//  Copyright © 2021 com.iug. All rights reserved.
//
//

import Foundation
import CoreData


extension Notes120181344 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Notes120181344> {
        return NSFetchRequest<Notes120181344>(entityName: "Notes120181344")
    }

    @NSManaged public var note: String?
    @NSManaged public var date: String?
    @NSManaged public var noteDescription: String?

}
