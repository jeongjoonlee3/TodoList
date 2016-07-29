//
//  TaskManager.swift
//  TodoList
//
//  Created by Jeongjoon Lee on 7/28/16.
//  Copyright © 2016 Jeongjoon Lee. All rights reserved.
//

struct Task {
	var title: String
	var description: String
}

class TaskManager {
	private var taskList = [Task]()

	func addTask(title: String, description: String) {
		let task = Task(title: title, description: description)
		taskList.append(task)
	}

	func removeTask(index: Int) {
		taskList.remove(at: index)
	}
}
