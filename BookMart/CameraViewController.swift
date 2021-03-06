//
//  CameraViewController.swift
//  BookMart
//
//  Created by Sita Mulomudi on 3/10/16.
//  Copyright © 2016 CodePathFinders. All rights reserved.
//

import UIKit
import ZBarSDK

extension ZBarSymbolSet: SequenceType {
    public func generate() -> NSFastGenerator {
        return NSFastGenerator(self)
    }
}

class CameraViewController: UIViewController, ZBarReaderDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    var ZBarReader: ZBarReaderViewController?
    
    @IBOutlet weak var resultText: UITextField!
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet var userPrice: UITextField!
    
    var parentPageView: OffersPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultText.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onScan(sender: AnyObject) {
        if (self.ZBarReader == nil) {
            self.ZBarReader = ZBarReaderViewController()
            print("itworks")
        }
        
        //self.ZBarReader = ZBarReaderViewController()
        self.ZBarReader?.readerDelegate = self
        self.ZBarReader?.scanner.setSymbology(ZBAR_ISBN13, config: ZBAR_CFG_ENABLE, to: 1)
        self.ZBarReader?.readerView.zoom = 1.0
        self.ZBarReader?.modalInPopover = false
        self.ZBarReader?.showsZBarControls = false
        //navigationController?.pushViewController(self.ZBarReader!, animated:true)
        self.presentViewController(self.ZBarReader!, animated: true, completion: nil)
        print("makesithere")
        
        
        //reader.supportedOrientationsMask = ZBarOrientationMaskAll //can't get #define to work in swift
        
        /*UIInterfaceOrientation orientation = [UIApplication sharedApplication].statusBarOrientation
        
        if (UIDeviceOrientationLandscapeLeft == orientation) {
        //Rotate 90
        reader.cameraViewTransform = CGAffineTransformMakeRotation (3*M_PI/2.0);
        } else if (UIDeviceOrientationLandscapeRight == orientation) {
        //Rotate 270
        reader.cameraViewTransform = CGAffineTransformMakeRotation (M_PI/2.0);
        }*/
    }
    
    func imagePickerController(reader: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [String: AnyObject]) {
            // ADD: get the decode results
            let results: NSFastEnumeration = info[ZBarReaderControllerResults] as! NSFastEnumeration
            
            var symbolFound : ZBarSymbol?
            
            for symbol in results as! ZBarSymbolSet {
                symbolFound = symbol as? ZBarSymbol
                break
            }
            let resultString = NSString(string: symbolFound!.data)
            self.resultText.text = resultString as String    //set barCode
            self.resultImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
            
            dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "goToFinalizeOffer" {
            let vc = segue.destinationViewController as! AddOfferViewController
            ISBNSearchAPI.getInfo(resultText.text!, success: { (request, response, data) in
                vc.book = Book(htmldata: String(data: data!, encoding: NSUTF8StringEncoding)!, isbn: self.resultText.text!, offer: Offer(price: Double(self.userPrice.text!)!))
                vc.offer = Offer(price: Double(self.userPrice.text!)!)
                }, failure: { (error) in
                    print(error)
            })
            //vc.book = Book(isbn: resultText.text!, offer: Offer(price: Double(userPrice.text!)!))
            //vc.offer = Offer(price: Double(userPrice.text!)!)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
