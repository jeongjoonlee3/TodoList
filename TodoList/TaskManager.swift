//
//  TaskManager.swift
//  TodoList
//
//  Created by Jeongjoon Lee on 7/28/16.
//  Copyright © 2016 Jeongjoon Lee. All rights reserved.
//

import Foundation

struct Task {
	var title: String
	var description: String
}

class TaskManager {
	private var taskList = [Task]()

	func addTask(title: String, description: String) -> Bool {
		// Do not add task on the task list.
		if title.trimmingCharacters(in: CharacterSet.whitespaces).isEmpty {
			return false
		}

		// Add task to the task list.
		let task = Task(title: title, description: description)
		taskList.append(task)
		
		return true
	}

	func removeTask(at index: Int) -> Bool {
		// Remove task from the task list.
		if 0..<numberOfTasks() ~= index {
			taskList.remove(at: index)
			return true
		}

		return false
	}

	func getTask(at index: Int) -> Task? {

		// Index out bound checking
		if 0..<numberOfTasks() ~= index {
			return taskList[index]
		}

		return nil
	}

	func numberOfTasks() -> Int {
		return taskList.count
	}
}
