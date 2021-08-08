//
//  AddTaskController.swift
//  MyTodoList
//
//  Created by Rey Cerio on 2021-08-07.
//

import UIKit
import RealmSwift

class AddTaskController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet private(set) var taskField: UITextField!
    @IBOutlet private(set) var datePicker: UIDatePicker!
    
    var viewmodel: AddTaskViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

// MARK: - Setup
private extension AddTaskController {
    func setupViews() {
        taskField.becomeFirstResponder()
        taskField.delegate = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(didTapSaveButton))
        datePicker.setDate(Date(), animated: true)
    }
}

// MARK: - Actions
private extension AddTaskController {
    @objc func didTapSaveButton() {
        if let text = taskField.text, !text.isEmpty {
            let date = datePicker.date
            viewmodel.addTaskItem(text, date: date) { [weak self] in
                guard let self = self else { return }
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
}

// MARK: - Delegates
extension AddTaskController {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        taskField.resignFirstResponder()
        return true
    }
}
