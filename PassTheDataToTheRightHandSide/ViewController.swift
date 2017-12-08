//
//  ViewController.swift
//  PassTheDataToTheRightHandSide
//
//  Created by Sain-R Edwards Jr. on 12/7/17.
//  Copyright © 2017 Appybuildmore Apps. All rights reserved.
//

import UIKit

// Step 2. Conform to protocol in the ViewController receiving the data
class ViewController: UIViewController, CanReceive {
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
    }

    @IBAction func passTheDataButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: Storyboard.secondVCSegue, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Storyboard.secondVCSegue {
            
            let destinationVC = segue.destination as! SecondViewController
            
            destinationVC.data = textField.text!
            
            // Set delegate up as current view controller. The first VC is the one that receives the data
            destinationVC.delegate = self
        }
    }
    
    @IBAction func colorChangingLizardButtonTapped(_ sender: Any) {
        view.backgroundColor = UIColor.purple
    }
    
    struct Storyboard {
        static let secondVCSegue = "goToSecondVC"
    }
    
    // Step 3. Implement the required protocol method and do something with data received.
    func dataReceived(data: String) {
        label.text = data
    }
    
}

