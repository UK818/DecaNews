//
//  CommentsCell.swift
//  DecaNews
//
//  Created by Decagon on 20/02/2022.
//

import UIKit

class CommentsCell: UITableViewCell {
    
    var comment: CommentModel?
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var userComment: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    let networkManager = NetworkManager()
    @IBOutlet weak var likeCount: UILabel!
    
    @IBAction func likeButtonAction(_ sender: UIButton) {
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setLikeImage(_ isLiked: Bool) {
        if isLiked {
            likeButton.imageView?.image = UIImage(systemName: "hand.thumbsup.fill")
        } else {
            likeButton.imageView?.image = UIImage(systemName: "hand.thumbsup")
        }
    }
    let viewModel = CommentViewModel()
    func configureCell(index: Int) {
        viewModel.readComments { comments in
            self.profilePic.setImage(with: self.viewModel.getPhotoURL())
            self.userComment.text = comments[index].commentText
            let days =  Date.timeDifference(lhs: Date(), rhs: comments[index].dateAndTime).toString()
            self.time.text = "\(days) ago"
            self.setLikeImage(comments[index].liked ?? false)
        }
    }
    func setUp() {
        if let url = URL(string: comment?.imageUrl ?? "") {
            self.profilePic.setImage(with: url)
        }
        setLikeImage(comment?.liked ?? false)
        userComment.text = comment?.commentText
        name.text = comment?.usersName
        time.text = String((comment?.dateAndTime ?? Date()) - Date())
    }
}
