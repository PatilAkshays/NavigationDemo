//
//  NewViewController.swift
//  NavigationDemo
//
//  Created by Treel Mobility  on 04/03/19.
//  Copyright © 2019 Treel Mobility . All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    @IBAction func backbuttonAc(_ sender: Any) {
        dismiss(animated: true)
    }
    
    @IBAction func backB(_ sender: Any) {
        dismiss(animated: true)
        NotificationCenter.default.post(name: .showHomeScreen, object: nil);
        //        self.navigationController?.popViewController(animated: true)
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
