//
//  BookmarksViewController.swift
//  DecaNews
//
//  Created by Geniusjames on 09/02/2022.
//

import UIKit

class BookmarksViewController: UIViewController {
    
    // MARK: - Coordinator Closures
    var didCompleteBookmark: CoordinatorTransition?
    var didSelectArticle: ((Article) -> Void)?
    @IBOutlet weak var newsTableView: UITableView!
    var viewModel: BookmarksViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        newsTableView.delegate = self
        newsTableView.dataSource = self
    }
}
extension BookmarksViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.bookmarkArticles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell  = tableView.dequeueReusableCell(withIdentifier: viewModel.cellID, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        cell.viewModel = viewModel
        cell.configureCell(index: indexPath.row)
        cell.removeBookmark = { [self] in
        let bookmark = viewModel.bookmarkArticles[indexPath.row]
            viewModel.removeBookmark(bookmark: bookmark)
            viewModel.bookmarkArticles.remove(at: indexPath.row)
            cell.loadNews()
            tableView.deleteRows(at: [indexPath], with: .fade)
            }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         let bookmarkedArticle = viewModel.bookmarkArticles[indexPath.row]
        
        didSelectArticle?(BookmarkComposer.makeArticleFromBookmark(bookmarkedArticle))
    }

}

extension BookmarksViewController: Storyboardable {
    static var storyboard: Storyboard { .news }
}
