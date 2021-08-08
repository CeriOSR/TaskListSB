//
//  TaskDetailViewModel.swift
//  MyTodoList
//
//  Created by Rey Cerio on 2021-08-07.
//

import Foundation
import RealmSwift

class TaskDetailViewModel: TaskDetailViewModelProtocol {
    private(set) var taskItem: TaskItem
    var deletionHandler: VoidResult?
    private let realm = try! Realm()
    
    init(taskItem: TaskItem) {
        self.taskItem = taskItem
    }
    
    func deleteItem(
        _ task: TaskItem,
        completion: @escaping VoidResult
    ) {
        realm.beginWrite()
        realm.delete(task)
        try! realm.commitWrite()
        deletionHandler?()
        completion()
    }
}
