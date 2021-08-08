//
//  TaskListController.swift
//  MyTodoList
//
//  Created by Rey Cerio on 2021-08-07.
//

import UIKit
import RealmSwift

class TaskListController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var viewmodel: TaskListViewModelProtocol!

    @IBOutlet private(set) var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK:- Setup View
private extension TaskListController {
    func setupView() {
        viewmodel = TaskListViewModel()
        viewmodel.fetchTasks()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "taskListCell")
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.largeTitleDisplayMode = .always
    }
}

// MARK:- Actions
private extension TaskListController {
    @IBAction func didTapAddButton() {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "AddTaskController") as? AddTaskController else { return }
        vc.viewmodel = AddTaskViewModel()
        vc.viewmodel.completionHandler = { [weak self] in
            self?.refresh()
        }
        vc.title = "Add Task"
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func refresh() {
        viewmodel.fetchTasks()
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
        }
    }
}

// MARK:- Delegates
extension TaskListController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let taskItem = viewmodel.data[indexPath.row]
        guard let vc = storyboard?.instantiateViewController(identifier: "TaskDetailController") as? TaskDetailController else { return }
        vc.viewmodel = TaskDetailViewModel(taskItem: taskItem)
        vc.viewmodel.deletionHandler = { [weak self] in
            guard let self = self else { return }
            self.refresh()
        }
        vc.title = taskItem.item
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK:- DataSource
extension TaskListController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewmodel.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskListCell", for: indexPath)
        cell.textLabel?.text = viewmodel.data[indexPath.row].item
        return cell
    }
}


