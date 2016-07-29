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
		XCTAssert(taskManager.addTask(title: "Title 1", description: "index 3"))
		XCTAssert(taskManager.numberOfTasks() == 4)


		// Out of bound index -> FAIL
		XCTAssertFalse(taskManager.removeTask(at: 4))
		XCTAssertFalse(taskManager.removeTask(at: 10))
		XCTAssert(taskManager.numberOfTasks() == 4)

		// Remove task at index 2 (description: index 2) -> PASS
		XCTAssert(taskManager.removeTask(at: 2))
		XCTAssert(taskManager.numberOfTasks() == 3)

		// Remove task at index 0 (description: index 0) -> PASS
		XCTAssert(taskManager.removeTask(at: 0))
		XCTAssert(taskManager.numberOfTasks() == 2)

		// Remove task at index 1 (description: index 3) -> PASS
		XCTAssert(taskManager.removeTask(at: 1))
		XCTAssert(taskManager.numberOfTasks() == 1)

		// Remove task at index 0 (description: index 1) -> PASS
		XCTAssert(taskManager.removeTask(at: 0))
		XCTAssert(taskManager.numberOfTasks() == 0)
	}

	func testNumberOfTasks() {
		let taskManager = TaskManager()
		XCTAssertTrue(taskManager.numberOfTasks() == 0)

		// Add tasks
		XCTAssert(taskManager.addTask(title: "task 0", description: "index 0"))
		XCTAssertTrue(taskManager.numberOfTasks() == 1)

		XCTAssert(taskManager.addTask(title: "task 1", description: "index 1"))
		XCTAssertTrue(taskManager.numberOfTasks() == 2)

		XCTAssert(taskManager.addTask(title: "task 2", description: "index 2"))
		XCTAssertTrue(taskManager.numberOfTasks() == 3)

		XCTAssert(taskManager.addTask(title: "task 3", description: "index 3"))
		XCTAssertTrue(taskManager.numberOfTasks() == 4)

		// Remove tasks
		XCTAssert(taskManager.removeTask(at: 0))
		XCTAssertTrue(taskManager.numberOfTasks() == 3)

		XCTAssert(taskManager.removeTask(at: 0))
		XCTAssertTrue(taskManager.numberOfTasks() == 2)

		XCTAssert(taskManager.removeTask(at: 0))
		XCTAssertTrue(taskManager.numberOfTasks() == 1)

		XCTAssert(taskManager.removeTask(at: 0))
		XCTAssertTrue(taskManager.numberOfTasks() == 0)
	}
}
