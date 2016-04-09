//
//  Author.swift
//  NSCodingDemo
//
//  Created by Brian on 12/2/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation

class Author: NSObject {
  
  let firstName: String
  let lastName: String
  let authorId: Int
  
  override var description: String {
    return "Author: \(firstName) \(lastName) - (\(authorId))"
  }
  
  init(withFirstName firstName: String, lastName: String, authorId: Int) {
    self.firstName = firstName
    self.lastName = lastName
    self.authorId = authorId
  }
}