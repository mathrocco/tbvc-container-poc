//
//  UITableView+Extension.swift
//  tbvc-container-poc
//
//  Created by Matheus Rocco on 30/06/20.
//

import UIKit

extension UITableView {
    func register<T: ReusableCell>(cell: T.Type) {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }
    
    func dequeueReusableCell<T: ReusableCell>(cell: T.Type) -> T {
        guard let reusableCell = self.dequeueReusableCell(withIdentifier: T.identifier) as? T else {
            fatalError()
        }
        
        return reusableCell
    }
}
