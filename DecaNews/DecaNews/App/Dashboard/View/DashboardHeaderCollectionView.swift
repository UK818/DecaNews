//
//  DashboardHeaderCollectionView.swift
//  DecaNews
//
//  Created by Decagon on 08/03/2022.
//

import UIKit

class DashboardHeaderCollectionView: UICollectionView {
    
    var viewModel: DashboardCollectionViewModel?
    private let collectionCell = "collectionCell"
    private var dashboardDatasource: DashboardHeaderDatasource<DashboardHeaderCollectionViewCell, Article>?
    var articles: [Article]? {
        didSet {
            setup()
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        delegate = self
        layer.cornerRadius = 30
        isPagingEnabled = true
        register(DashboardHeaderCollectionViewCell.self, forCellWithReuseIdentifier: collectionCell)
    }
    
    func config() {
        fetchData(1)
    }
    
    public func fetchData(_ val: Int) {
        viewModel?.fetchData(val) {
            DispatchQueue.main.async { [weak self] in
                self?.articles = self?.viewModel?.collectionViewNews
                self?.reloadData()
            }
        } errorCompletion: { error in
            print("Error is: ", error)
            
        }
            
    }
    
    func setup() {
        if let articles = articles {
            self.dashboardDatasource = DashboardHeaderDatasource(cellIdentifier: collectionCell, data: articles) { (cell, article) in
                
                cell.updateData(article: article)
            }
            dataSource = dashboardDatasource
        }
        showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension DashboardHeaderCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width, height: frame.height)
    }
}
