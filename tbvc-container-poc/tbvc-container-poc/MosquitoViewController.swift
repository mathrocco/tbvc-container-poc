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
                self?.mosquitos[index] = "🔥"
                self?.reloadMosquitos()
            }

            button.setTitle(mosquito, for: .normal)
            stackView.addArrangedSubview(button)
        }
    }
    
    private func reloadMosquitos() {
        stackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        configureStackView()
    }
}
