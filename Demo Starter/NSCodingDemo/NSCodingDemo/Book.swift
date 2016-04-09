//
//  Book.swift
//  NSCodingDemo
//
//  Created by Brian on 12/2/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation

class Book: NSObject {
  
  let title: String
  let publicationDate: NSDate
  let numberOfPages: Int
  var author: Author?

  override var description: String {
    return "Book: \(title) - \(numberOfPages) pages: Published on \(publicationDate)"
  }
  
  init(withTitle title:String, publicationDate: NSDate, andNumberOfPages numberOfPages: Int) {
    self.title = title
    self.publicationDate = publicationDate
    self.numberOfPages = numberOfPages
  }
}