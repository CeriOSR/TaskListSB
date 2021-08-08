//
//  TodoListItem.swift
//  MyTodoList
//
//  Created by Rey Cerio on 2021-08-07.
//

import Foundation
import RealmSwift

class TaskItem: Object {
    @objc dynamic var item: String = ""
    @objc dynamic var date: Date = Date()
}
