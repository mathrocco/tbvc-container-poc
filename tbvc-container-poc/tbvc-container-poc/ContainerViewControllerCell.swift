//
//  ContainerViewControllerCell.swift
//  tbvc-container-poc
//
//  Created by Matheus Rocco on 30/06/20.
//

import UIKit

class ContainerViewControllerCell: UITableViewCell, ReusableCell {
    
    static let identifier = "ContainerViewControllerCell"
    
    weak var containerController: UIViewController?
}
