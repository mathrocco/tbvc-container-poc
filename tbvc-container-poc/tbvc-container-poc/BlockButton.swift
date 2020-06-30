//
//  BlockButton.swift
//  tbvc-container-poc
//
//  Created by Matheus Rocco on 30/06/20.
//

import UIKit

class BlockButton: UIButton {
    
    let action: () -> Void

    init(action: @escaping () -> Void) {
        self.action = action
        super.init(frame: .zero)
        self.addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func touchUpInside() {
        action()
    }
}
