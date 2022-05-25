//
//  DashboardHeaderDatasource.swift
//  DecaNews
//
//  Created by Decagon on 08/03/2022.
//

import UIKit

final class DashboardHeaderDatasource<TCell: UICollectionViewCell, T>: NSObject, UICollectionViewDataSource {
    
    private var data: [T]
    private var cellIdentifier: String
    private var configureCell: (TCell, T) -> Void
    
    init(cellIdentifier: String, data: [T], configureCell: @escaping (TCell, T) -> Void) {
        self.cellIdentifier = cellIdentifier
        self.data = data
        self.configureCell = configureCell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return  min(data.count, 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? TCell {
            let data = data[indexPath.row]
            configureCell(cell, data)
            return cell
        }
        return TCell()
    }
}
