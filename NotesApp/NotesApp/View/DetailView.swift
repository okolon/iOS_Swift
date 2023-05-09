//
//  ViewController.swift
//  NotesAPP
//
//  Created by Norman Okolo on 03/05/2023.
//

import Foundation
import UIKit
import CoreData

class DetailView: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
 
    @IBAction func saveNote(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context: NSManagedObjectContext = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "NoteEntity", in: context)
        let newNote = NoteData(entity: entity!, insertInto: context)
        newNote.id = noteList.count as NSNumber
        newNote.title = titleField.text ?? ""
        newNote.desc = descriptionView.text
        
        do {
            try context.save()
            noteList.append(newNote)
            navigationController?.popViewController(animated: true)
        } catch {
            print("Error when trying to save")
        }
    }
    
    
}

