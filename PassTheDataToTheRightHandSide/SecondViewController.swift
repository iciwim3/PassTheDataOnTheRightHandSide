//
//  SecondViewController.swift
//  PassTheDataToTheRightHandSide
//
//  Created by Sain-R Edwards Jr. on 12/7/17.
//  Copyright © 2017 Appybuildmore Apps. All rights reserved.
//

import UIKit

// Step 1. Create a protocol that has a name and a required method
protocol CanReceive {
    func dataReceived(data: String)
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    // Step 4. Create property of type 'CanReceive' that is an optional
    var delegate: CanReceive?
    
    var data = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = data
        
    }

    @IBAction func onTheLeftHandSideButtonTapped(_ sender: Any) {
        /* If someone claims to be the delegate, we
         call the 'dataReceived' method which will send
         the data entered into this 'textField' via the method
         'dataReceived' which is on the first view controller. */
        delegate?.dataReceived(data: textField.text!)
        
        dismiss(animated: true, completion: nil)
    }
    
}
