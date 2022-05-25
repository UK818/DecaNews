//
//  DashboardReTableViewController.swift
//  DecaNews
//
//  Created by Decagon on 08/03/2022.
//

import UIKit
import SideMenu

final class DashboardViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var sideMenuController: SideMenuViewController!
    private var sideMenu: SideMenuNavigationController?
    
    var viewModel: DashboardTableViewModel?
    
    var didSelectArticle: ((Article) -> Void)?
    var didSelectShowSearch: CoordinatorTransition?
    var didSelectShowNotification: CoordinatorTransition?
    
    private var dashboardTableDatasource: DashboardTableViewDatasource<DashboardTableViewCell, Article>?
    var headerViewModel: DashboardCollectionViewModel?
    
    private var articles: [Article]? {
        didSet {
            runSetup()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupOnLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func setupOnLoad() {
        configureTableView()
        configureSideMenu()
        fetchData()
        configureNavigationBar()
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.register(DashboardHeader.self, forHeaderFooterViewReuseIdentifier: DashboardHeader.viewIdentifier)
        tableView.rowHeight = 115
    }
    
    private func configureSideMenu() {
        sideMenu = SideMenuNavigationController(rootViewController: sideMenuController)
        SideMenuManager.default.leftMenuNavigationController = sideMenu
        SideMenuManager.default.addPanGestureToPresent(toView: view)
        sideMenu?.setNavigationBarHidden(true, animated: false)
        sideMenu?.leftSide = true
    }
    
    private func configureNavigationBar() {
        let searchButton = UIBarButtonItem(image: UIImage(named: "search-normal"), style: .plain,
                                           target: self, action: #selector(showSearch))
        let notificationButton = UIBarButtonItem(image: UIImage(named: "Notification"), style: .plain,
                                                 target: self, action: #selector(showNotication))
        let menuButton = UIBarButtonItem(image: UIImage(named: "Menu"), style: .plain,
                                         target: self, action: #selector(showSideMenu))
        navigationItem.leftBarButtonItems = [menuButton]
        navigationItem.rightBarButtonItems = [notificationButton, searchButton]
    }
    
    func fetchData() {
        viewModel?.fetchData(successCompletion: {
            DispatchQueue.main.async { [weak self] in
                self?.articles = self?.viewModel?.articles ?? []
                self?.tableView.reloadData()
            }
        }, errorCompletion: {_ in
            
        })
    }
    
    @objc func showSideMenu() {
        present(sideMenu!, animated: true)
    }
    
    @objc func showSearch() {
        didSelectShowSearch?()
    }
    
    @objc func showNotication() {
        didSelectShowNotification?()
    }
    
    func runSetup() {
        if let articles = articles {
            self.dashboardTableDatasource = DashboardTableViewDatasource(data: articles, headerViewModel: headerViewModel) { (cell, article) in
                
                cell.setup(with: article, viewModel: self.viewModel)
            }
            tableView.dataSource = dashboardTableDatasource
        }
    }
}

extension DashboardViewController: Storyboardable {
    static var storyboard: Storyboard { .dashboard }
}

extension DashboardViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        400
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: DashboardHeader.viewIdentifier) as? DashboardHeader else { return UIView() }
        headerView.viewModel = headerViewModel
        headerView.setHeaderCollectionViewModel()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let article = viewModel?.articles[indexPath.row] {
            didSelectArticle?(article)
        }
    }
}
