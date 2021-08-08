//
//  TaskDetailController.swift
//  MyTodoList
//
//  Created by Rey Cerio on 2021-08-07.
//

import UIKit
import RealmSwift

class TaskDetailController: UIViewController {
    
    @IBOutlet var taskItemLabel: UILabel!
    @IBOutlet var taskDateLabel: UILabel!
    
    var viewmodel: TaskDetailViewModelProtocol!
    
    // Static because Dateformatters takes a lot of memory so we only want to instantiate it once
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        return dateFormatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

// MARK: - Setup
private extension TaskDetailController {
    func setupView() {
        taskItemLabel.text = viewmodel.taskItem.item
        taskDateLabel.text = Self.dateFormatter.string(from: viewmodel.taskItem.date)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(didTapDelete))
    }
}

// MARK: - Actions
extension TaskDetailController {
    @objc private func didTapDelete() {
        viewmodel.deleteItem(viewmodel.taskItem) { [weak self] in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
