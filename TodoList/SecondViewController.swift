//
//  SecondViewController.swift
//  TodoList
//
//  Created by Jeongjoon Lee on 7/26/16.
//  Copyright © 2016 Jeongjoon Lee. All rights reserved.
//

import UIKit

var todoList = [String]()

class SecondViewController: UIViewController {

	@IBOutlet var todoText: UITextField!

	@IBAction func addTask(_ sender: AnyObject) {
		if todoText.text?.characters.count > 0 {
			// Add todo into list.
			todoList.append(todoText.text!)

			// Reset to initial state.
			self.view.endEditing(true)
			todoText.text = ""

			// Return back to first controller.
			self.tabBarController?.selectedIndex = 0
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
