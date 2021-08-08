//
//  TaskListViewModelProtocol.swift
//  MyTodoList
//
//  Created by Rey Cerio on 2021-08-07.
//

import Foundation

protocol TaskListViewModelProtocol {
    var data: [TaskItem] { get set }
    
    func fetchTasks()
}
