//
//  SideMenuHeader.swift
//  DecaNews
//
//  Created by Decagon on 09/03/2022.
//

import UIKit

final class SideMenuHeader: UITableViewHeaderFooterView {
    
    private let nameLabel = UILabel()
    private let imageView = UIImageView()
    private let iconContainer =  UIView()
    let viewProfileButton = UIButton()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        iconContainer.constrainWidth(constant: 56)
        iconContainer.constrainHeight(constant: 56)
        iconContainer.layer.cornerRadius = iconContainer.frame.size.width / 2
        
        iconContainer.addSubviews(imageView)
        imageView.fillSuperview()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "avatar")
        
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        
        viewProfileButton.setTitle("View Profile", for: .normal)
        viewProfileButton.setTitleColor(UIColor(named: AppColors.deepGrey), for: .normal)
        viewProfileButton.titleLabel?.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        
        let labelStack = VerticalStack(arrangedSubviews: [nameLabel, viewProfileButton], spacing: 4, alignment: .leading)
        let viewStack = VerticalStack(arrangedSubviews: [iconContainer, labelStack], spacing: 16, alignment: .leading)
        
        addSubviews(viewStack)
        viewStack.anchored(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 65, left: 24, bottom: 0, right: 10))
    }
    
    func setHeader(viewModel: SideMenuViewModel?) {
        let user = viewModel?.getUserDetails()
        nameLabel.text = user?.displayName ?? "--"
        if let imageURL = user?.photoURL {
            self.imageView.setImage(with: imageURL)
        }
    }
}
