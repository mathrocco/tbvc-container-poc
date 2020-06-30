//
//  ViewController.swift
//  tbvc-container-poc
//
//  Created by Matheus Rocco on 30/06/20.
//

import UIKit

class ViewController: UIViewController {
    
    var mosquitos: [String] = [
        "🦟 🦟 🦟 🦟 🦟",
        "🦟 🦟 🦟 🦟 🦟",
        "🦟 🦟 🦟 🦟 🦟",
        "🦟 🦟 🦟 🦟 🦟",
        "🦟 🦟 🦟 🦟 🦟",
        "🦟 🦟 🦟 🦟 🦟",
        "🦟 🦟 🦟 🦟 🦟",
        "🦟 🦟 🦟 🦟 🦟",
        "🦟 🦟 🦟 🦟 🦟",
        "🦟 🦟 🦟 🦟 🦟",
        "🦟 🦟 🦟 🦟 🦟",
        "🦟 🦟 🦟 🦟 🦟",
        "🦟 🦟 🦟 🦟 🦟",
        "🦟 🦟 🦟 🦟 🦟",
        "🦟 🦟 🦟 🦟 🦟",
    ]

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 60
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }

    private func configureTableView() {
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true

        tableView.register(cell: ContainerViewControllerCell.self)
        tableView.dataSource = self
    }
}

extension ViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mosquitos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cell: ContainerViewControllerCell.self)
        cell.textLabel?.text = mosquitos[indexPath.row]
        return cell
    }
}
