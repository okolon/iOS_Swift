//
//  NoteEntity+CoreDataProperties.swift
//  NotesAPP
//
//  Created by Norman Okolo on 03/05/2023.
//
//

import Foundation
import CoreData


extension NoteEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<NoteEntity> {
        return NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
    }

//    @NSManaged public var deleted: Date?
    @NSManaged public var desc: String?
    @NSManaged public var id: Int64
    @NSManaged public var title: String?

}

extension NoteEntity : Identifiable {

}
