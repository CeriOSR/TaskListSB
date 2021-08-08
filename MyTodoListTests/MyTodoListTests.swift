//
//  MyTodoListTests.swift
//  MyTodoListTests
//
//  Created by Rey Cerio on 2021-08-07.
//

import XCTest
import RealmSwift
@testable import MyTodoList

class TaskListViewModelTest: XCTestCase {
    let realm = try! Realm()
    func testFetchTask() {
        let count: Int = 2
        let vm = TaskListViewModel()
        vm.fetchTasks()
        XCTAssertEqual(count, vm.data.count)
    }
}

class TaskDetailViewModelTest: XCTestCase {
    let realm = try! Realm()
    func testDeleteItem() {
        let data = realm.objects(TaskItem.self).map({ $0 })
        let count = data.count
        let vm = TaskDetailViewModel(taskItem: data[0])
        vm.deleteItem {}
        XCTAssertEqual(count - 1, data.count)
    }
}

class AddTaskViewModelTest: XCTestCase {
    let realm = try! Realm()
    func testAddTaskItem() {
        let data = realm.objects(TaskItem.self).map({ $0 })
        let count = data.count
        let vm = AddTaskViewModel()
        vm.addTaskItem("New Item_\(count + 1)", date: Date()) {}
        let newCount = realm.objects(TaskItem.self).map({ $0 }).count
        XCTAssertEqual(count + 1, newCount)
    }
}
