//
//  StartViewController.swift
//  AlpakAR
//
//  Created by Cem-Marvin von Hagen on 29.10.17.
//  Copyright © 2017 Jugend Hackt. All rights reserved.
//

import UIKit
import MessageUI
import StoreKit

class StartViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        startRatingTimer()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var contactUS: UIButton!
    var ratingTimer: Timer!

    @IBAction func sendMail(_ sender: Any) {
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setToRecipients(["alpacAR@vHagen.me"])
        self.present(mc, animated: true, completion: nil)
        ratingTimer.invalidate()
    }
    
    @IBAction func cU(_ sender: Any) {
        ratingTimer.invalidate()

    }
    @IBAction func SA(_ sender: Any) {
        ratingTimer.invalidate()

    }
    
    public func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        // Dismiss the mail compose view controller.
        controller.dismiss(animated: true, completion: nil)
    }
    @objc func rR(_ timer: Timer) {
        if #available(iOS 10.3, *) {
            SKStoreReviewController.requestReview()
        }
    }
    
    func startRatingTimer() {
        if #available(iOS 10.3, *) {
            ratingTimer = Timer.scheduledTimer(timeInterval: 15, target: self, selector: #selector(rR(_:)), userInfo: nil, repeats: false)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
