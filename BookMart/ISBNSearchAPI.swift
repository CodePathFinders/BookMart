//
//  ISBNSearchAPI.swift
//  BookMart
//
//  Created by Sita Mulomudi on 3/30/16.
//  Copyright © 2016 CodePathFinders. All rights reserved.
//

import Foundation
import Alamofire
import Kanna

class ISBNSearchAPI {
    
    static let urlString = "http://www.isbnsearch.org/isbn/";
    
    // assumes valid ISBN (error handling done in CameraVC)
    class func getInfo(ISBN: String, success: (NSURLRequest?, NSHTTPURLResponse?, NSData?) -> (), failure: (NSError?)->()) {
        let URL = urlString + ISBN;
        Alamofire.request(.GET, URL).response { (request, response, data, error) in
            if let error = error {
                failure(error)
            } else {
                success(request, response, data)
            }
        }
    }
    
    class func parse(htmlString: String, offerToAdd: Offer) -> (Book?) {
        if let doc = Kanna.HTML(html: htmlString, encoding: NSUTF8StringEncoding) {
            print(doc.title)
            
            //image URL
            print(doc.css("#book .thumbnail img"))
            let imgURL = doc.css("#book .thumbnail img")[0]["src"]
            print("Image URL: \(imgURL)")
            
            //book info
            var count = 0;
            var isbn = "";
            var authors = "";
            for p in doc.css("#book .bookinfo p") {
                if count == 1 {
                    isbn = (p.text?.componentsSeparatedByString(":")[1])!
                } else if count == 2 {
                    authors = (p.text?.componentsSeparatedByString(":")[1])!
                }
                print("Text: \(p.text?.componentsSeparatedByString(":")[1])");
                count += 1;
            }
            
            let title = doc.css("#book .bookinfo h2")[0].text;
            
            // check if book exists, if so, add Offer to Offers in object
            
            // else create new book object with offer as only member of array
            let newBook = Book(title: title!, imageURL: imgURL, isbn: isbn, authors: authors)
            newBook.addOffer(offerToAdd)
            return newBook;
        } else {
            return nil
        }
    }
}

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        Alamofire.request(.GET, urlString)
            .response { request, response, data, error in
                self.image = UIImage(data: data!)
        }
    }
}
