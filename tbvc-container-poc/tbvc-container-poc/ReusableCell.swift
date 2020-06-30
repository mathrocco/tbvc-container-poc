//
//  ReusableCell.swift
//  tbvc-container-poc
//
//  Created by Matheus Rocco on 30/06/20.
//

import Foundation

protocol ReusableCell: class {
    static var identifier: String { get }
}
