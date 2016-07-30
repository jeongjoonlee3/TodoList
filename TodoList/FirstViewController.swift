//
//  FirstViewController.swift
//  TodoList
//
//  Created by Jeongjoon Lee on 7/26/16.
//  Copyright © 2016 Jeongjoon Lee. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDataSource {

	@IBOutlet var taskTable: UITableView!

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return taskManager.numberOfTasks()
	}

	// Insert tasks for each cells
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")

		if let task = taskManager.getTask(at: indexPath.row) {
			cell.textLabel?.text = task.title
		}

		return cell
	}

	// Delete task
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
		if (editingStyle == UITableViewCellEditingStyle.delete) {
			if taskManager.removeTask(at: indexPath.row) {
				taskTable.reloadData()
			}
		}
	}

	// Reload task table view
	override func viewWillAppear(_ animated: Bool) {
		taskTable.reloadData()
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
