//
//  Offer.swift
//  BookMart
//  
//  The Offer object is the lowest level object in the hierarchy.
//
//  Created by Pranav Harathi on 4/12/16.
//  Copyright © 2016 CodePathFinders. All rights reserved.
//

import UIKit

class Offer: NSObject {
    var price: Double!
    var user: User!
    var book: Book!
    
    init(price: Double, user: User, book: Book) {
        self.price = price
        self.user = user
        self.book = book
    }
    
    init(price: Double) {
        self.price = price
    }
    
    func specifyUser(user: User) {
        self.user = user
    }
    
    func specifyBook(book: Book) {
        self.book = book
    }
}
