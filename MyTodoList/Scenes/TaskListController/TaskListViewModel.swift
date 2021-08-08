//
//  TaskListViewModel.swift
//  MyTodoList
//
//  Created by Rey Cerio on 2021-08-07.
//

import Foundation
import RealmSwift

class TaskListViewModel: TaskListViewModelProtocol {
    let realm = try! Realm()
    var data: [TaskItem] = []
    
    func fetchTasks() {
        data = realm.objects(TaskItem.self).map({ $0 })
    }
}
