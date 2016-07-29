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

	func addTask(title: String, description: String) -> Bool {
		// Do not add task on the task list
		if title.isEmpty { return false }

		// Add task to the task list
		let task = Task(title: title, description: description)
		taskList.append(task)
		return true
	}

	func removeTask(at index: Int) -> Bool {
		// Remove task from the task list
		if 0..<numberOfTasks() ~= index {
			taskList.remove(at: index)
			return true
		}

		// By default, do not remove task from the task list
		return false
	}

	func numberOfTasks() -> Int {
		return taskList.count
	}
}
