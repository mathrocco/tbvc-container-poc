//
//  MosquitoViewController.swift
//  tbvc-container-poc
//
//  Created by Matheus Rocco on 30/06/20.
//

import UIKit

typealias Mosquito = String

class MosquitoViewController: UIViewController {
    
    var mosquitos: [Mosquito]
    var updateMosquitos: (([Mosquito]) -> Void)?
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        return stackView
    }()

    init(mosquitos: [Mosquito]) {
        self.mosquitos = mosquitos
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addStackView()
        configureStackView()
    }
    
    private func addStackView() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    }
    
    private func configureStackView() {
        mosquitos.enumerated().forEach { (index, mosquito) in
            let button = BlockButton { [weak self] in
                if self?.mosquitos[index] == "🔥" {
                    self?.displayDeadMosquitoAlert()
                }

                self?.mosquitos[index] = "🔥"
                self?.reloadMosquitos()
            }

            button.setTitle(mosquito, for: .normal)
            stackView.addArrangedSubview(button)
        }
    }
    
    private func reloadMosquitos() {
        updateMosquitos?(mosquitos)
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        configureStackView()
    }
    
    private func displayDeadMosquitoAlert() {
        let alertController = UIAlertController(title: "Mosquito is already dead", message: "Kill more mosquitos!", preferredStyle: .actionSheet)
        let action = UIAlertAction.init(title: "Okay!", style: .default, handler: { _ in
            alertController.dismiss(animated: true, completion: nil)
        })
        
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}
