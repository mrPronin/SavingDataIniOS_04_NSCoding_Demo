//
//  Author.swift
//  NSCodingDemo
//
//  Created by Brian on 12/2/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation

class Author: NSObject, NSCoding {
    
    let firstName: String
    let lastName: String
    let authorId: Int
    
    override var description: String {
        return "Author: \(firstName) \(lastName) - (\(authorId))"
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let firstName = aDecoder.decodeObjectForKey("authorFirstName") as? String, lastName = aDecoder.decodeObjectForKey("authorLastName") as? String else {
            return nil
        }
        self.init(withFirstName: firstName, lastName: lastName, authorId: aDecoder.decodeIntegerForKey("authorId"))
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(firstName, forKey: "authorFirstName")
        aCoder.encodeObject(lastName, forKey: "authorLastName")
        aCoder.encodeInteger(authorId, forKey: "authorId")
    }
    
    init(withFirstName firstName: String, lastName: String, authorId: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.authorId = authorId
    }
}