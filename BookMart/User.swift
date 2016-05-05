//
//  User.swift
//  BookMart
//
//  Created by Nav Saini on 4/12/16.
//  Copyright © 2016 CodePathFinders. All rights reserved.
//

import UIKit

class User: NSObject {
    var email: String!
    var name: String!
    var phone: String!
    var offers: [Offer] = []
    
    init(email: String, name: String, phone: String) {
        self.email = email
        self.name = name
        self.phone = phone
    }
    
    func addOffer(offer: Offer) {
        offers.append(offer);
    }
    
    func addOffers(offers: [Offer]) {
        self.offers.appendContentsOf(offers)
    }
}
