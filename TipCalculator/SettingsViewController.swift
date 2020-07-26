//
//  SettingsViewController.swift
//  TipCalculator
//
//  Created by Peter Shelley on 7/26/20.
//  Copyright © 2020 Peter Shelley. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var defaultTipSegCtrl: UISegmentedControl!
    let defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        defaultTipSegCtrl.isHidden=false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        defaultTipSegCtrl.selectedSegmentIndex = defaults.integer(forKey: "selectedSegment")
        // This is a good place to retrieve the default tip percentage from UserDefaults
        // and use it to update the tip amount
    }
    
    @IBAction func saveDefaultTip(_ sender: Any) {
        defaults.set(defaultTipSegCtrl.selectedSegmentIndex, forKey: "selectedSegment")
        defaults.synchronize()
    }
    
    
    
    

}
