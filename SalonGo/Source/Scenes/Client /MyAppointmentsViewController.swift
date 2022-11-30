//
//  MyAppointmentsViewController.swift
//  SalonGo
//
//  Created by Milena Maia Araújo on 29/11/22.
//

import UIKit

class TableHeader: UITableViewHeaderFooterView {
    static let identifier = "MyAppointmentsViewControllerHeader"
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

class MyAppointmentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let savedAppointments = services

    let tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableViewConfigConstraints()
        tableView.register(AppointmentsTableViewCell.self, forCellReuseIdentifier: AppointmentsTableViewCell.identifier)
        tableView.register(TableHeader.self, forHeaderFooterViewReuseIdentifier: "MyAppointmentsViewControllerHeader")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return savedAppointments.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: AppointmentsTableViewCell.identifier, for: indexPath) as? AppointmentsTableViewCell {
            cell.myServices = savedAppointments[indexPath.row]
            return cell
        }
        return UITableViewCell()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    // alterar título da section pelo número
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "CLIENTE"
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "MyAppointmentsViewControllerHeader")
        return header
    }

    func tableViewConfigConstraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10)])
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("cell \(indexPath.row + 1) tapped.")
    }
}
