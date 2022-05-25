//
//  SideMenuFooter.swift
//  DecaNews
//
//  Created by Oyegoke Oluwatomisin on 14/03/2022.
//

import UIKit

final class SideMenuFooter: UIView {
    
    private let footerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        footerLabel.text = "Version 1.0"
        footerLabel.textColor = UIColor(named: AppColors.deepGrey)
        footerLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        addSubview(footerLabel)
        footerLabel.anchored(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 65, left: 24, bottom: 0, right: 24))
    }
}
