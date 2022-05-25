//
//  DashboardHeaderCollectionViewCell.swift
//  DecaNews
//
//  Created by Decagon on 08/03/2022.
//

import UIKit

class DashboardHeaderCollectionViewCell: UICollectionViewCell {
    
    private let padding: CGFloat = 30
    private let collectionHeight: CGFloat = 300
    
    let backgroundImage: UIImageView = {
        let imageV = UIImageView()
        imageV.contentMode = .scaleAspectFill
        imageV.clipsToBounds = true
        return imageV
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    let bookMarkImage: UIImageView = {
        let imageV = UIImageView()
        imageV.contentMode = .center
        imageV.clipsToBounds = true
        imageV.backgroundColor = .black
        imageV.image = UIImage(named: "Bookmark-Outline-1")
        return imageV
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        layer.cornerRadius = 30
        constrainHeight(constant: collectionHeight)
        addSubviews(backgroundImage, authorLabel, titleLabel, bookMarkImage)
        
        constrainBackgroundImage()
        constrainTitleLabel()
        constrainAuthorLabel()
        constrainBookMarkImage()
    }
    
    func updateData(article: Article) {
        titleLabel.text = article.title
        authorLabel.text = article.author
        if let articleURLString = article.urlToImage,
            let imageURL = URL(string: articleURLString) {
            backgroundImage.setImage(with: imageURL)
        }
    }
    
    func constrainBackgroundImage() {
        backgroundImage.fillSuperview()
    }
    
    func constrainTitleLabel() {
        titleLabel.anchored(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: collectionHeight / 2, left: 10, bottom: 0, right: 10))
    }
    
    func constrainAuthorLabel() {
        authorLabel.anchored(top: titleLabel.bottomAnchor, leading: titleLabel.leadingAnchor, bottom: nil, trailing: titleLabel.trailingAnchor, padding: UIEdgeInsets(top: 15, left: 0, bottom: 0, right: 0))
    }
    
    func constrainBookMarkImage() {
        bookMarkImage.constrainHeight(constant: 50)
        bookMarkImage.constrainWidth(constant: 50)
        bookMarkImage.layer.cornerRadius = 25
        bookMarkImage.anchored(top: topAnchor, leading: nil, bottom: nil, trailing: trailingAnchor, padding: UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 20))
    }
}
