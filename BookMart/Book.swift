//
//  Book.swift
//  BookMart
//
//  Created by Pranav Harathi on 4/12/16.
//  Copyright © 2016 CodePathFinders. All rights reserved.
//

import UIKit

struct Books {
    var list: [Book] = []
}

class Book: NSObject {
    var title: String!
    var imageURL: String?
    var isbn: String!
    var authors: String!
    private var offers: [Offer] = []
    
    override var description: String {
        return "Book { title: \(self.title), imageURL: \(self.imageURL ?? "None"), isbn: \(isbn), authors: \(authors), offers: \(offers)"
    }
    
    init(title: String, imageURL: String?, isbn: String, authors: String) {
        self.title = title
        self.imageURL = imageURL
        self.authors = authors
        self.isbn = isbn
    }
    
    func addOffer(offer: Offer) {
        offers.append(offer);
    }
    
    func addOffers(offers: [Offer]) {
        self.offers.appendContentsOf(offers)
    }
}
