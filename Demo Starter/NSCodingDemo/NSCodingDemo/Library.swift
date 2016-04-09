//
//  Library.swift
//  NSCodingDemo
//
//  Created by Brian on 12/2/15.
//  Copyright © 2015 Razeware LLC. All rights reserved.
//

import Foundation

class Library: NSObject  {
  
  var books: [Book] = []
  var authors: [Author] = []
  
  override init() {
    super.init()
  }
  
  init(books:[Book], authors:[Author]) {
    super.init()
    self.books = books
    self.authors = authors
  }
  
  
}