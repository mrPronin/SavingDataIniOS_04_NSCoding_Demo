//
//  ViewController.swift
//  NSCodingDemo
//
//  Created by Brian on 12/2/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var library = Library()
        let fileManager = NSFileManager.defaultManager()
        
        if let dataUrl = NSBundle.mainBundle().URLForResource("LibraryData", withExtension: "plist") {
            if let plistData = NSData(contentsOfURL: dataUrl) {
                var format = NSPropertyListFormat.XMLFormat_v1_0
                do {
                    var plist = try NSPropertyListSerialization.propertyListWithData(plistData, options: .Immutable, format: &format)
                    
                    var books = plist["Books"]! as! [AnyObject]
                    var authors = plist["Authors"]! as! [AnyObject]
                    
                    for authorData in authors {
                        let firstName = authorData["First Name"]!! as! String
                        let lastName = authorData["Last Name"]!! as! String
                        let authorId = authorData["Author ID"]!! as! Int
                        let author = Author(withFirstName: firstName, lastName: lastName, authorId: authorId)
                        library.authors.append(author)
                    }
                    
                    for bookData in books {
                        let bookTitle = bookData["Title"]!! as! String
                        let publicationDate = bookData["Publication Date"]!! as! NSDate
                        let pageCount = bookData["Page Count"]!! as! Int
                        let authorId = bookData["Author ID"]!! as! NSNumber
                        let book = Book(withTitle: bookTitle, publicationDate: publicationDate, andNumberOfPages: pageCount)
                        
                        book.author = library.authors[authorId.integerValue]
                        library.books.append(book)
                        
                    }
                    
                } catch {
                    print(error)
                }
                
            }
        }
        
        print(library)
        
        do {
            let documentDirectory = try fileManager.URLForDirectory(.DocumentDirectory, inDomain: .UserDomainMask, appropriateForURL: nil, create: false)
            
            let saveFile = documentDirectory.URLByAppendingPathComponent("library.bin")
            
            // Save
             let libraryData = NSKeyedArchiver.archivedDataWithRootObject(library)
             libraryData.writeToURL(saveFile, atomically: true)
            
            // Restore
            /*
            let libraryReadData = try NSData(contentsOfURL: saveFile, options: .DataReadingMappedIfSafe)
            let lib = NSKeyedUnarchiver.unarchiveObjectWithData(libraryReadData) as! Library
            print(lib)
            */
            
        } catch {
            print(error)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

