//
//  ViewControllerEx.swift
//  TipCalculator
//
//  Created by Peter Shelley on 9/11/20.
//  Copyright © 2020 Peter Shelley. All rights reserved.
//

import UIKit

class ViewControllerEx: UIViewController {

    @IBOutlet var billAmount: UITextField!
    @IBOutlet var tipAmount: UILabel!
    @IBOutlet var tipPercentage: UISegmentedControl!
    @IBOutlet var billTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let bill  = Double(billAmount.text!) ?? 0
        let tipPerc = [0.10, 0.15, 0.20]
        
        //calc tip and total
        let tip = bill * tipPerc[tipPercentage.selectedSegmentIndex]
        let total = bill + tip
        
        //update the tip and total labels
        tipAmount.text = String(format: "$%.2f", tip)
        billTotal.text = String(format: "$%.2f", total)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
