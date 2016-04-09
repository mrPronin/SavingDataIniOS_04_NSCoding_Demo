//
//  Book.swift
//  NSCodingDemo
//
//  Created by Brian on 12/2/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation

class Book: NSObject, NSCoding {
    
    let title: String
    let publicationDate: NSDate
    let numberOfPages: Int
    var author: Author?
    
    override var description: String {
        return "Book: \(title) - \(numberOfPages) pages: Published on \(publicationDate)"
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let title = aDecoder.decodeObjectForKey("title") as? String, let publicationDate = aDecoder.decodeObjectForKey("publicationDate") as? NSDate else {return nil}
        self.init(withTitle: title, publicationDate: publicationDate, andNumberOfPages: aDecoder.decodeIntegerForKey("numberOfPages"))
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(title, forKey: "title")
        aCoder.encodeObject(publicationDate, forKey: "publicationDate")
        aCoder.encodeInteger(numberOfPages, forKey: "numberOfPages")
    }
    
    init(withTitle title:String, publicationDate: NSDate, andNumberOfPages numberOfPages: Int) {
        self.title = title
        self.publicationDate = publicationDate
        self.numberOfPages = numberOfPages
    }
}