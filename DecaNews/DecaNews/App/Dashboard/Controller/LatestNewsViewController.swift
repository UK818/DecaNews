//
//  LatestNewsViewController.swift
//  DecaNews
//
//  Created by mac on 10/02/2022.
//

import UIKit

class LatestNewsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	@IBOutlet weak var tableView: UITableView!
	
    var viewModel: LatestNewsViewModel?
	
    override func viewDidLoad() {
        super.viewDidLoad()
		config()
    }
	
	private func config() {
        fetchData()
		tableView.delegate = self
		tableView.dataSource = self
		self.navigationController?.navigationBar.backIndicatorImage = UIImage(named: "arrow-left")
		self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "arrow-left")
		self.navigationController?.navigationBar.backItem?.title = "from"
		self.navigationController?.navigationBar.backItem?.titleView?.tintColor = .black
	}
	
	private func fetchData() {
        viewModel?.fetchData() {
			DispatchQueue.main.async { [weak self] in
				self?.tableView.reloadData()
			}
		} errorCompletion: { error in
			print("THE ERROR IS: ", error)
		}
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel?.articles.count ?? 20
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: "LatestNewsCell", for: indexPath) as? LatestNewsTableViewCell
		else { return UITableViewCell() }
        if let articles = viewModel?.articles {
			let article = articles[indexPath.row]
			cell.setup(with: article)
		}
		return cell
	}
    
//    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
//        tableView.deselectRow(at: indexPath, animated: true)
//        guard let newsDetailsController = UIStoryboard(name: "NewsDetails", bundle: nil).instantiateViewController(withIdentifier: "NewsDetails") as? DetailsViewController else {
//            return
//        }
//        navigationController?.pushViewController(newsDetailsController, animated: true)
//    }
}

extension LatestNewsViewController: Storyboardable {
    static var storyboard: Storyboard { .dashboard }
}
