//
//  SettingsBackgroundUIView.swift
//  DecaNews
//
//  Created by Decagon on 10/02/2022.
//

import UIKit

class SettingsBackgroundUIView: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = UIColor(named: "grey")
        layer.cornerRadius = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
