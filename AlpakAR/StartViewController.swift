//
//  StartViewController.swift
//  AlpakAR
//
//  Created by Cem-Marvin von Hagen on 29.10.17.
//  Copyright © 2017 Jugend Hackt. All rights reserved.
//

import UIKit
import MessageUI

class StartViewController: UIViewController, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet var contactUS: UIButton!
    
    @IBAction func sendMail(_ sender: Any) {
        let mc: MFMailComposeViewController = MFMailComposeViewController()
        mc.mailComposeDelegate = self
        mc.setToRecipients(["COD3LTA@vHagen.me"])
        self.present(mc, animated: true, completion: nil)
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
