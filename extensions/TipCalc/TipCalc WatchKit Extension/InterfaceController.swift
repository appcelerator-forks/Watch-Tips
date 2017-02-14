//
//  InterfaceController.swift
//  tips WatchKit Extension
//
//  Created by not specified on 2/11/2017.
//  not specified. All rights reserved.
//

import WatchKit
import WatchConnectivity
import Foundation

class InterfaceController: WKInterfaceController, WCSessionDelegate {

    
    var tipAmount: Int = 10
    var splitBetween: Int = 1
    var billTotal = Double(0)

    
    @IBOutlet var currentTip: WKInterfaceButton!
    @IBOutlet var currentTotal: WKInterfaceLabel!
    @IBOutlet var currentSplit: WKInterfaceButton!
    @IBOutlet var costEach: WKInterfaceLabel!
    @IBOutlet var withTip: WKInterfaceLabel!
    
    
    override init() {
        super.init()
    }

    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        updateCalc()
    }

    override func willActivate() {
        super.willActivate()
        if WCSession.isSupported() {
            let session = WCSession.default()
            session.delegate = self
            session.activate()
        }
        updateCalc()
    }

    override func didDeactivate() {
        super.didDeactivate()
    }

    @available(watchOS 2.2, *)
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        // This will be called when the activation of a session finishes.
    }
    
    
    // show the Split Controller
    @IBAction func showSplitController() {
        presentController(withName: "SplitController", context: self)
    }
    
    
    // show the Tip controller
    @IBAction func showTipController() {
        presentController(withName: "TipController", context: self)
    }
    
    // Show the Bill Controller
    @IBAction func showBillController() {
        presentController(withName: "BillController", context: self)
    }
    
    /**
    func session(_ session: WCSession, didReceiveApplicationContext applicationContext: [String : Any]) {
        if let status = applicationContext["status"] as? String {
            currentTip.setTitle(status)
        } else {
            currentTip.setTitle("NOSTAT")
            
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        currentTip.setTitle("MSGRLPY")
    }

    func session(_ session: WCSession, didReceiveMessageData messageData: Data) {
        currentTip.setTitle("MSGDATA")
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        currentTip.setTitle("MSGNOR")
    }
    
    func session(_ session: WCSession, didReceiveUserInfo userInfo: [String : Any] = [:]) {
        if let data = userInfo["data"] as? String {
            currentTip.setTitle(data)
        } else {
            currentTip.setTitle("NOUINF")
            
        }
    }
     **/

    // Update the actual calculations
    func updateCalc(){
        
        // do bill calculations
        let tip = (billTotal/100) * Double(tipAmount)
        let billWithTip = billTotal + tip
        let perPerson = billWithTip / Double(splitBetween)
        
        // update display
        currentTip.setTitle("\(tipAmount)%")
        currentSplit.setTitle("\(splitBetween)")
        currentTotal.setText(String(format: "%.2f", billTotal))
        withTip.setText(String(format: "%.2f", billWithTip))
        costEach.setText(String(format: "%.2f", perPerson))
        
        // now see if we can sent the calc data back to the app
        if WCSession.isSupported() {
            let session = WCSession.default()
            let calcInfo = [
                "tip":"\(tipAmount)",
                "split": "\(splitBetween)",
                "bill": "\(billTotal)"
            ] as [String : Any];
            session.transferUserInfo(calcInfo)
        }
    }

    
}
