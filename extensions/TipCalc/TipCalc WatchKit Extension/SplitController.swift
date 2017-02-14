//
//  SplitController.swift
//  TipCalc
//
//  Created by Stephen Rogers on 13/02/2017.
//  Copyright © 2017 Appcelerator, Inc. All rights reserved.
//

import WatchKit
import Foundation


class SplitController: WKInterfaceController {

    @IBOutlet var splitBetween: WKInterfaceLabel!
    var split: Int = 1
    var sourceController: InterfaceController!

    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        sourceController = context as? InterfaceController
        split = sourceController.splitBetween
        updateSplit()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }


    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    // increase Split up to 50
    @IBAction func increaseSplit() {
        if split < 50 {
            split += 1
            updateSplit()
        }
    }
    
    // if split > 1 then decrease
    @IBAction func decreaseSplit() {
        if split > 1 {
            split -= 1
            updateSplit()
        }
    }
    
    // update the slit display and the bill split
    func updateSplit(){
        sourceController.splitBetween = split
        splitBetween.setText("\(split)")
    }
    
}
