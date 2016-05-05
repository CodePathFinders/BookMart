//
//  OfferCell.swift
//  BookMart
//
//  Created by Sita Mulomudi on 4/14/16.
//  Copyright © 2016 CodePathFinders. All rights reserved.
//

import UIKit
import Alamofire

class OfferCell: UITableViewCell {

    @IBOutlet var bookImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var authorsLabel: UILabel!
    @IBOutlet var lowestPriceLabel: UILabel!
    @IBOutlet var numSellersLabel: UILabel!
    
    var book: Book! {
        didSet {
            bookImageView.imageFromUrl(book.imageURL!)
            titleLabel.text = book.title
            authorsLabel.text = book.authors
            lowestPriceLabel.text = "$100.00"
            // need to set this up with DB model
            numSellersLabel.text = "5 sellers"
            // need to set this up with DB model
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
