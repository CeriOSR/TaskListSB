//
//  TaskDetailViewModelProtocol.swift
//  MyTodoList
//
//  Created by Rey Cerio on 2021-08-07.
//

import Foundation

protocol TaskDetailViewModelProtocol {
    var taskItem: TaskItem { get }
    var deletionHandler: VoidResult? {get set}
    
    func deleteItem(
        _ task: TaskItem,
        completion: @escaping VoidResult
    ) 
}
