//
//  TipController.swift
//  TipCalc
//
//  Created by Stephen Rogers on 13/02/2017.
//  Copyright © 2017 Appcelerator, Inc. All rights reserved.
//

import WatchKit
import Foundation


class TipController: WKInterfaceController {

    var sourceController: InterfaceController!
    var tip: Int=0

    @IBOutlet var tipPercent: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        sourceController = context as? InterfaceController
        tip = sourceController.tipAmount
        displayTip()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    // display the current tip value and reset the actual value
    func displayTip(){
        sourceController.tipAmount = tip
        tipPercent.setText("\(tip)%")
    }
    
    // decrease tip down to 0%
    @IBAction func decreaseTip() {
        if tip != 0 {
            tip -= 1
        }
        displayTip();
    }
    
    // increase tip utp 100%
    @IBAction func increaseTip() {
        if tip < 100 {
            tip += 1
        }
        displayTip();
    }
}
