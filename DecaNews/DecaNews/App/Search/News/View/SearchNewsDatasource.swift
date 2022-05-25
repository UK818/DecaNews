//
//  SearchNewsDatasource.swift
//  DecaNews
//
//  Created by Decagon on 16/02/2022.
//

import UIKit

final class SearchNewsDatasource<TCell: UITableViewCell, T>: NSObject, UITableViewDataSource {
    
    private var cellData: [T]
    private var cellIdentifier: String
    private var configureCell: (TCell, T) -> Void
    
    init(cellIdentifier: String, cellData: [T], configureCell: @escaping (TCell, T) -> Void) {
        self.cellIdentifier = cellIdentifier
        self.cellData = cellData
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TCell {
            let cellRow = cellData[indexPath.row]
            configureCell(cell, cellRow)
            return cell
        }
        return UITableViewCell()
    }
    
    func setCellData(_ cellData: [T]) {
        self.cellData = cellData
    }
}
