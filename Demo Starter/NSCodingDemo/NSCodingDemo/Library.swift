//
//  Library.swift
//  NSCodingDemo
//
//  Created by Brian on 12/2/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation

class Library: NSObject, NSCoding  {
    
    var books: [Book] = []
    var authors: [Author] = []
    
    override init() {
        super.init()
    }
    
    override var description: String {
        var descriptionString:String = ""
        for author in authors {
            descriptionString = descriptionString + author.description + "\n"
        }
        for book in books {
            descriptionString = descriptionString + book.description + "\n"
        }
        return descriptionString
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let books = aDecoder.decodeObjectForKey("books") as! [Book]
        let authors = aDecoder.decodeObjectForKey("authors") as! [Author]
        self.init(books: books, authors:  authors)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(books, forKey: "books")
        aCoder.encodeObject(authors, forKey: "authors")
    }
    
    init(books:[Book], authors:[Author]) {
        super.init()
        self.books = books
        self.authors = authors
    }
    
    
}