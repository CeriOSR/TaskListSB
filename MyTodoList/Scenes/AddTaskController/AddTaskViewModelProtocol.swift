//
//  AddTaskViewModelProtocol.swift
//  MyTodoList
//
//  Created by Rey Cerio on 2021-08-07.
//

import Foundation

protocol AddTaskViewModelProtocol {
    var completionHandler: VoidResult? { get set }
    
    func addTaskItem(
        _ text: String,
        date: Date,
        completion: @escaping VoidResult
    )
}
