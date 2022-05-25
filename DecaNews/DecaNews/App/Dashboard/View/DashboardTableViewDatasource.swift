//
//  DashboardTableViewDatasource.swift
//  DecaNews
//
//  Created by Decagon on 08/03/2022.
//

import UIKit

final class DashboardTableViewDatasource<TCell: UITableViewCell, T>: NSObject, UITableViewDataSource {
    
    private var data: [T]
    private var configureCell: (TCell, T) -> Void
    private let headerViewModel: DashboardCollectionViewModel?
    
    init(data: [T], headerViewModel: DashboardCollectionViewModel?, configureCell: @escaping (TCell, T) -> Void) {
        self.data = data
        self.configureCell = configureCell
        self.headerViewModel = headerViewModel
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: TCell.viewIdentifier, for: indexPath) as? TCell {
            let data = data[indexPath.row]
            configureCell(cell, data)
            return cell
        }
        return TCell()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
}
