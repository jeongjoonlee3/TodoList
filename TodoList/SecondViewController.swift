//
//  SecondViewController.swift
//  TodoList
//
//  Created by Jeongjoon Lee on 7/26/16.
//  Copyright © 2016 Jeongjoon Lee. All rights reserved.
//

import UIKit

var taskManager = TaskManager()

class SecondViewController: UIViewController {

	@IBOutlet var todoText: UITextField!

	@IBAction func addTask(_ sender: AnyObject) {
		if todoText.text?.characters.count > 0 {

			// Always reset to inital state.
			defer {
				todoText.text = ""
				self.view.endEditing(true)
			}

			// Add todo into list.
			if taskManager.addTask(title: todoText.text!, description: "") {
				// Return back to first controller.
				self.tabBarController?.selectedIndex = 0
			}
		}
	}

	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		self.view.endEditing(true)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
