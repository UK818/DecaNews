//
//  MenuTableViewController.swift
//  DecaNews
//
//  Created by Decagon on 10/02/2022.
//

import UIKit

final class SideMenuViewController: UIViewController {
    
    var viewModel: SideMenuViewModel!
    var didSelectMenuOption: ((MenuOption) -> Void)?
    var didSelectShowProfile: CoordinatorTransition?
    weak var menuControllerDelegate: MenuControllerDelegate?
    
    @IBOutlet weak var sideMenuTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewOnLoad()
    }
    
    private func setupViewOnLoad() {
        let tableFooter = SideMenuFooter()
        sideMenuTable.tableFooterView = tableFooter
        sideMenuTable.tableFooterView?.frame.size = CGSize(width: sideMenuTable.frame.width, height: CGFloat(146))
        sideMenuTable.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.viewIdentifier)
        sideMenuTable.register(SideMenuHeader.self, forHeaderFooterViewReuseIdentifier: SideMenuHeader.viewIdentifier)
        sideMenuTable.register(SideMenuTableViewCell.self, forCellReuseIdentifier: SideMenuTableViewCell.viewIdentifier)
    }
    
    @objc private func showProfile() {
        dismiss(animated: false) { [weak self] in
            self?.didSelectShowProfile?()
        }
    }
    
    private func selectMenu(at index: Int) {
        let selectedMenu = viewModel.menuItem[index]
        dismiss(animated: false) { [weak self] in
            self?.didSelectMenuOption?(selectedMenu)
        }
    }
}

extension SideMenuViewController: Storyboardable {
    static var storyboard: Storyboard { .sideMenu }
}

extension SideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.menuItem.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.viewIdentifier, for: indexPath)
        cell.contentView.backgroundColor = UIColor(named: "black")
        cell.textLabel?.textColor = .white
        cell.textLabel?.text = viewModel.menuItem[indexPath.row].displayname
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        
        let imageName = viewModel.menuItem[indexPath.row].icon
        cell.imageView?.image = UIImage(named: imageName)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectMenu(at: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 217
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: SideMenuHeader.viewIdentifier) as? SideMenuHeader else {
            return nil
        }
        headerView.viewProfileButton.addTarget(self, action: #selector(showProfile), for: .touchUpInside)
        headerView.setHeader(viewModel: viewModel)
        return headerView
    }
}
