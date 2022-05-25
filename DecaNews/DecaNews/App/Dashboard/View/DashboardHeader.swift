//
//  DashboardHeader.swift
//  DecaNews
//
//  Created by Decagon on 08/03/2022.
//

import UIKit

class DashboardHeader: UITableViewHeaderFooterView {

    var viewModel: DashboardCollectionViewModel?
    
    let popularButton: UIButton = {
        let button = UIButton()
        button.setTitle("Popular", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let trendingButton: UIButton = {
        let button = UIButton()
        button.setTitle("Trending", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    let recentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Recent", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        return button
    }()
    
    lazy var headerCollectionView: DashboardHeaderCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        return DashboardHeaderCollectionView(frame: .zero, collectionViewLayout: layout)
    }()
    
    let latestNewsLabel: UILabel = {
        let label = UILabel()
        label.text = "Latest News"
        return label
    }()
    
    let seeMoreButton: UIButton = {
        let button = UIButton()
        button.setTitle("See more", for: .normal)
        button.setTitleColor(UIColor(named: "deepPeach"), for: .normal)
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
        configureButtonsTapped()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContents() {
        addSubviews(headerCollectionView, popularButton, trendingButton, recentButton, latestNewsLabel, seeMoreButton)
        constrainTopHeader()
        constrainCollectionView()
        constrainButtomHeader()
    }
    
    func configureButtonsTapped() {
        popularButton.addTarget(self, action: #selector(didTapPopular), for: .touchUpInside)
        trendingButton.addTarget(self, action: #selector(didTapTrending), for: .touchUpInside)
        recentButton.addTarget(self, action: #selector(didTapRecent), for: .touchUpInside)
        seeMoreButton.addTarget(self, action: #selector(didTapSeeMore), for: .touchUpInside)
    }
    
    func constrainTopHeader() {
        popularButton.anchored(top: safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 5))
        popularButton.constrainHeight(constant: 32)
        trendingButton.anchored(top: safeAreaLayoutGuide.topAnchor, leading: popularButton.trailingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 5))
        trendingButton.constrainHeight(constant: 32)
        recentButton.anchored(top: safeAreaLayoutGuide.topAnchor, leading: trendingButton.trailingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 5))
        recentButton.constrainHeight(constant: 32)
    }
    
    func constrainCollectionView() {
        headerCollectionView.constrainHeight(constant: 300)
        headerCollectionView.anchored(top: popularButton.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: safeAreaLayoutGuide.trailingAnchor, padding: UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20))
    }
    
    func constrainButtomHeader() {
        latestNewsLabel.anchored(top: headerCollectionView.bottomAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: nil, trailing: nil, padding: UIEdgeInsets(top: 10, left: 20, bottom: 15, right: 20))
        seeMoreButton.anchored(top: headerCollectionView.bottomAnchor, leading: nil, bottom: nil, trailing: safeAreaLayoutGuide.trailingAnchor, padding: UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 20))
    }
    
    func setHeaderCollectionViewModel() {
        headerCollectionView.viewModel = viewModel
        headerCollectionView.config()
    }
    
    @objc func didTapPopular() {
        popularButton.setTitleColor(.black, for: .normal)
        trendingButton.setTitleColor(.gray, for: .normal)
        recentButton.setTitleColor(.gray, for: .normal)
        headerCollectionView.fetchData(1)
    }

    @objc func didTapTrending() {
        popularButton.setTitleColor(.gray, for: .normal)
        trendingButton.setTitleColor(.black, for: .normal)
        recentButton.setTitleColor(.gray, for: .normal)
        headerCollectionView.fetchData(2)
    }

    @objc func didTapRecent() {
        popularButton.setTitleColor(.gray, for: .normal)
        trendingButton.setTitleColor(.gray, for: .normal)
        recentButton.setTitleColor(.black, for: .normal)
        headerCollectionView.fetchData(3)
    }

    @objc func didTapSeeMore() {
        
    }
    
    func setupData(article: Article) {
        
    }
}
