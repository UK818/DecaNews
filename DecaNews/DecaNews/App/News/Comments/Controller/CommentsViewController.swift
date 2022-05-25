//
//  CommentsViewController.swift
//  DecaNews
//
//  Created by Decagon on 20/02/2022.
//

import UIKit

class CommentsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    private let commentViewModel = CommentViewModel()
    var didCompleteComments: CoordinatorTransition?
    var count = 0
    var like = false
    var ids = [String]()
    var index = 0
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var commentTextField: UITextField!
    @IBOutlet weak var likeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        reloadTableView()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "commentscell", for: indexPath) as? CommentsCell else {
            return UITableViewCell()
        }
        cell.configureCell(index: indexPath.row)
        cell.likeButton.addTarget(self, action: #selector(incrementLike), for: .allTouchEvents)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    @objc func incrementLike() {
        
        _ = like ? { [self] in commentViewModel.increaseOrDecreaseLike(id: ids[index], val: 1)
            like = !like
           return
        }
        : {[self] in
            commentViewModel.increaseOrDecreaseLike(id: ids[index], val: -1)
            like = !like
            return
        }
    }
    @IBAction func sendBtnPressed(_ sender: Any) {
        
        guard let text = commentTextField.text else {return}
        let model = CommentModel(articleId: commentViewModel.artileId, usersName: commentViewModel.userName(), commentText: text, dateAndTime: Date())
        commentViewModel.addComments(comments: model)
        commentTextField.text = ""
        reloadTableView()
    }
    
    func reloadTableView() {
        commentViewModel.readComments { comments in
            
            self.count = comments.count
            self.ids = comments.map { comment in
                comment.id ?? ""
            }
            self.tableView.reloadData()
        }
        tableView.reloadData()
    }
    // pass the article id
    // work on the like function
    
}

extension CommentsViewController: Storyboardable {
    static var storyboard: Storyboard { .news }
}
