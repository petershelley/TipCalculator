//
//  ViewController.swift
//  TipCalculator
//
//  Created by Peter Shelley on 7/8/20.
//  Copyright © 2020 Peter Shelley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let defaults = UserDefaults.standard

    @IBOutlet var billAmt: UITextField!
    @IBOutlet var tipAmt: UILabel!
    @IBOutlet var tipLabel: UILabel!
    @IBOutlet var totalAmt: UILabel!
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var tipSegCtrl: UISegmentedControl!
    
    @IBOutlet var twoPerson: UILabel!
    @IBOutlet var twoPic: UIImageView!
    @IBOutlet var twoPic_2: UIImageView!
    @IBOutlet var threePerson: UILabel!
    @IBOutlet var threePic: UIImageView!
    @IBOutlet var threePic_2: UIImageView!
    @IBOutlet var threePic_3: UIImageView!
    @IBOutlet var fourPerson: UILabel!
    @IBOutlet var fourPic: UIImageView!
    @IBOutlet var fourPic_2: UIImageView!
    @IBOutlet var fourPic_3: UIImageView!
    @IBOutlet var fourPic_4: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        billAmt.borderStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tipSegCtrl.selectedSegmentIndex = defaults.integer(forKey: "selectedSegment")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func hideSpecs(_ sender: Any) {
        twoPerson.isHidden=true
        twoPic.isHidden=true
        twoPic_2.isHidden=true
        threePerson.isHidden=true
        threePic.isHidden=true
        threePic_2.isHidden=true
        threePic_3.isHidden=true
        fourPerson.isHidden=true
        fourPic.isHidden=true
        fourPic_2.isHidden=true
        fourPic_3.isHidden=true
        fourPic_4.isHidden=true
    }
    
    @IBAction func showSpecs(_ sender: Any) {
        twoPerson.isHidden=false
        twoPic.isHidden=false
        twoPic_2.isHidden=false
        threePerson.isHidden=false
        threePic.isHidden=false
        threePic_2.isHidden=false
        threePic_3.isHidden=false
        fourPerson.isHidden=false
        fourPic.isHidden=false
        fourPic_2.isHidden=false
        fourPic_3.isHidden=false
        fourPic_4.isHidden=false
    }
    
    
    @IBAction func calculate(_ sender: Any) {
        let bill  = Double(billAmt.text!) ?? 0
        let tipPerc = [0.10, 0.15, 0.20]
        
        //calc tip and total
        let tip = bill * tipPerc[tipSegCtrl.selectedSegmentIndex]
        let total = bill + tip
        
        //update the tip and total labels
        tipAmt.text = String(format: "$%.2f", tip)
        totalAmt.text = String(format: "$%.2f", total)
        twoPerson.text = String(format: "$%.2f", total/2)
        threePerson.text = String(format: "$%.2f", total/3)
        fourPerson.text = String(format: "$%.2f", total/4)
    }
    
    @IBAction func reveal(_ sender: Any) {
        if (!tipLabel.isHidden){
            return
        }
        tipLabel.alpha = 0.0
        tipLabel.transform = CGAffineTransform.identity.translatedBy(x: 0.8, y: 0.8)
        UIView.animate(withDuration: 1.0, animations: {
            self.tipLabel.alpha = 1
            self.tipLabel.transform = CGAffineTransform.identity
        })
        tipLabel.isHidden=false
        
        tipAmt.alpha = 0.0
        tipAmt.transform = CGAffineTransform.identity.translatedBy(x: 0.8, y: 0.8)
        UIView.animate(withDuration: 1.0, animations: {
            self.tipAmt.alpha = 1
            self.tipAmt.transform = CGAffineTransform.identity
        })
        tipAmt.isHidden=false
        
        totalAmt.alpha = 0.0
        totalAmt.transform = CGAffineTransform.identity.translatedBy(x: 0.8, y: 0.8)
        UIView.animate(withDuration: 1.0, animations: {
            self.totalAmt.alpha = 1
            self.totalAmt.transform = CGAffineTransform.identity
        })
        totalAmt.isHidden=false
        
        totalLabel.alpha = 0.0
        totalLabel.transform = CGAffineTransform.identity.translatedBy(x: 0.8, y: 0.8)
        UIView.animate(withDuration: 1.0, animations: {
            self.totalLabel.alpha = 1
            self.totalLabel.transform = CGAffineTransform.identity
        })
        totalLabel.isHidden=false
        
        tipSegCtrl.alpha = 0.0
        tipSegCtrl.transform = CGAffineTransform.identity.translatedBy(x: 0.8, y: 0.8)
        UIView.animate(withDuration: 1.0, animations: {
            self.tipSegCtrl.alpha = 1
            self.tipSegCtrl.transform = CGAffineTransform.identity
        })
        tipSegCtrl.isHidden=false
    }
}
