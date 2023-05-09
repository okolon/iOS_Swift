//
//  NoteData.swift
//  NotesAPP
//
//  Created by Norman Okolo on 03/05/2023.
//

import Foundation
import CoreData

@objc(NoteData)

class NoteData: NSManagedObject {
    @NSManaged var id: NSNumber?
    @NSManaged var title: String!
    @NSManaged var desc: String!
//    @NSManaged var deleted: Date?
}
