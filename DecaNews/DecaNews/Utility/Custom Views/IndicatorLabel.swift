//
//  IndicatorLabel.swift
//  DecaNews
//
//  Created by Geniusjames on 22/01/2022.
//

import UIKit

class IndicatorLabel: UILabel {

    required init?(coder: NSCoder) {
        super .init(coder: coder)
        self.setup()
    }
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.setup()
    }
    private func setup() {
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
}
