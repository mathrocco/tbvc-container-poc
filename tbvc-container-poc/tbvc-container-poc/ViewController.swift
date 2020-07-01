//
//  ViewController.swift
//  tbvc-container-poc
//
//  Created by Matheus Rocco on 30/06/20.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var mosquitos: [[Mosquito]] = {
        Array(repeating: ["🦟", "🦟", "🦟", "🦟", "🦟"], count: 50)
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.allowsSelection = false
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

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mosquitos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cell: ContainerViewControllerCell.self)
        let controller = MosquitoViewController(mosquitos: mosquitos[indexPath.row])
        controller.updateMosquitos = { [weak self] mosquito in
            self?.mosquitos[indexPath.row] = mosquito
        }

        cell.containerController = controller
        addChild(controller)
        cell.contentView.subviews.forEach { $0.removeFromSuperview() }
        cell.contentView.addSubview(cell.containerController!.view)
        controller.view.frame = cell.contentView.frame
        controller.didMove(toParent: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let containerCell = cell as? ContainerViewControllerCell
        containerCell?.containerController?.view.removeFromSuperview()
    }
}
