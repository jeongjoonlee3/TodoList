//
//  TaskManagerTest.swift
//  TodoList
//
//  Created by Jeongjoon Lee on 7/28/16.
//  Copyright © 2016 Jeongjoon Lee. All rights reserved.
//

import XCTest
@testable import TodoList

class TaskManagerTest: XCTestCase {
	func testAddTask() {
		let taskManager = TaskManager()

		// Adding task with no title -> FAIL
		XCTAssertFalse(taskManager.addTask(title: "", description: "Some description"))
		XCTAssert(taskManager.numberOfTasks() == 0)

		// Adding task with no description -> PASS
		XCTAssert(taskManager.addTask(title: "Some title", description: ""))
		XCTAssert(taskManager.numberOfTasks() == 1)

		// Adding task with both title and description -> PASS
		XCTAssert(taskManager.addTask(title: "Some title", description: "Some description"))
		XCTAssert(taskManager.numberOfTasks() == 2)
	}

	func testRemoveTask() {
		let taskManager = TaskManager()

		// Add some tasks to perform remove functionality
		XCTAssert(taskManager.addTask(title: "Title 0", description: "index 0"))
		XCTAssert(taskManager.addTask(title: "Title 1", description: "index 1"))
		XCTAssert(taskManager.addTask(title: "Title 2", description: "index 2"))
		XCTAssert(taskManager.numberOfTasks() == 3)


		// Out of bound index -> FAIL
		XCTAssertFalse(taskManager.removeTask(at: 3))
		XCTAssertFalse(taskManager.removeTask(at: 10))
		XCTAssert(taskManager.numberOfTasks() == 3)

		// Remove task at index 2 (Title 2) -> PASS
		XCTAssertFalse(taskManager.removeTask(at: 2))
		XCTAssert(taskManager.numberOfTasks() == 2)

		// Remove task at index 0 (Title 0) -> PASS
		XCTAssertFalse(taskManager.removeTask(at: 0))
		XCTAssert(taskManager.numberOfTasks() == 1)

		// Remove task at index 0 (Title 1) -> PASS
		XCTAssertFalse(taskManager.removeTask(at: 0))
		XCTAssert(taskManager.numberOfTasks() == 0)
	}
}
