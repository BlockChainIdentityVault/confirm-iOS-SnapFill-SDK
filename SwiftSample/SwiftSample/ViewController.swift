//
//  ViewController.swift
//  SwiftSample
//
//  Created by Greg Peet on 9/14/16.
//  Copyright © 2016 Confirm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Listen for a start over (back arrow) notification
		NotificationCenter.default.addObserver(forName: NSNotification.Name(rawValue: "startOverNotification"),
		                                       object: nil,
		                                       queue: OperationQueue.main) { (note) in
												self.dismiss(animated: false, completion: nil)
		}
		
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	
	/* 
	
	A simple example of presenting the CFScanViewController and displaying an alert
	containing various (data derived from the ID Model after a successful scan)
	
	Note: numbers in comments indicate sequential order of steps
	
	*/
	@IBAction func extractDataTapped(_ sender: AnyObject) {
		
		// #1 - Get the view controller for scanning
		var vc: CSFScanViewController
		
		// #3 - Begin scanning and handle the resulting model with a callback
		vc = SnapFill.sharedInstance().scanLicense(completion: {(idModel) in

			// #4 - Dismiss the scanning view controller
			self.dismiss(animated: true, completion: { 
				
				// #5 - Begin aggregating the data you desire from the model's constituent parts
				// (see headers for CSFBioModel and CSFIssuanceModel)
				let dateFormatter = DateFormatter()
				dateFormatter.dateFormat = "MM-dd-yyyy"
				
				let resultString = String(format: "Name: %@ %@\nDOB: %@\nNumber: %@",
				                          idModel!.bio.firstName,
				                           idModel!.bio.lastName,
				                           dateFormatter.string(from: idModel!.bio.birthday),
				                           idModel!.issuance.number)
				
				let alertController = UIAlertController(title: "Confirm SnapFill",
				                                        message: resultString,
				                                        preferredStyle: .alert)
				
				let OKAction = UIAlertAction(title: "Done", style: .default) { (action) in
					
					// #7 - Dismiss the alert to complete scan cycle
					self.dismiss(animated: true, completion: nil)
				}
				alertController.addAction(OKAction)
				
				// #6 - Show the alert
				self.present(alertController, animated: true, completion: nil)
			})
		})
		// #2 - Present the view controller
		self.present(vc, animated: true, completion: nil)
		
	}
}

