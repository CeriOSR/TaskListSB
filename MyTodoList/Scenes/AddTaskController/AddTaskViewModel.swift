//
//  AddTaskViewModel.swift
//  MyTodoList
//
//  Created by Rey Cerio on 2021-08-07.
//

import Foundation
import RealmSwift

class AddTaskViewModel: AddTaskViewModelProtocol {
    private let realm = try! Realm()
    var completionHandler: VoidResult?
    
    func addTaskItem(
        _ text: String,
        date: Date,
        completion: @escaping VoidResult
    ) {
        realm.beginWrite()
        let newItem = TaskItem()
        newItem.item = text
        newItem.date = date
        realm.add(newItem)
        try! realm.commitWrite()
        completionHandler?()
        completion()
    }
}
