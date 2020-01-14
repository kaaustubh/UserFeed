//
//  PostCell.swift
//  Audi_list
//
//  Created by Kaustubh on 13/01/20.
//  Copyright © 2020 KaustubhtestApp. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    var post: Post?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setPost(post: Post){
        self.post = post
        nameLabel.text = post.user.name
        messageLabel.text = post.message
//        userImage.url = post.user.image_url
        userImage.imageFromServerURL(urlString: post.user.image_url, PlaceHolderImage: UIImage(named: "user", in: Bundle(for: PostCell.self), compatibleWith: nil)!)
    }
}
