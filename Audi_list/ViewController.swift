//
//  ViewController.swift
//  Audi_list
//
//  Created by Kaustubh on 13/01/20.
//  Copyright © 2020 KaustubhtestApp. All rights reserved.
//

import UIKit
protocol TableViewReloadDelegate {
    func loadNextsPosts()
}
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource = PostDataSource()
    var offset = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.dataSource = dataSource
        self.tableView.delegate = dataSource
        dataSource.delegate = self
        loadPosts()
    }
    
    func loadPosts() {
        PostsService().loadPosts(offset: offset, limit: 10) {[weak self] posts, error in
            guard let self = self else {return}
            DispatchQueue.main.async{
                if error == nil {
                    if let posts = posts {
                        self.dataSource.appendPosts(newPost: posts)
                        self.tableView.reloadData()
                    }
                }
                else {
                    var message = "Something went wrong!!!"
                    if let errorcode = error?.code {
                        message = "Something went wrong. Error code- " + "\(errorcode)"
                    }
                    Alert.show(title: "Error", message: message, buttonTitle: "Ok")
                }
            }
        }
    }
}

extension ViewController : TableViewReloadDelegate {
    func loadNextsPosts() {
        offset += 10
        loadPosts()
    }
}

class PostDataSource: NSObject {
    var posts = [Post]()
    var delegate : TableViewReloadDelegate?
    func appendPosts(newPost: [Post]) {
        posts.append(contentsOf: newPost)
    }
}

extension PostDataSource : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "postcell", for: indexPath) as? PostCell else {
            return UITableViewCell()
        }
        cell.setPost(post: posts[indexPath.row])
        //configure(cell: cell, for: indexPath, for: tableView)
        return cell
    }
    
    //THis doesnt work
    func configure(cell: PostCell, for indexPath: IndexPath, for tableView: UITableView) {
        let post = posts[indexPath.row]
        cell.nameLabel.text = post.user.name
        cell.messageLabel.text = post.message
        ImageDownloader.shared.downloadImage(from: post.user.image_url) { image, error in
            DispatchQueue.main.async{
                if let updateCell = tableView.cellForRow(at: indexPath), let image = image {
                    updateCell.imageView?.image = image
                }
            }
        }
        
    }
}

extension PostDataSource : UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if posts.count - 1 == indexPath.row {
            if let delegate = delegate {
                delegate.loadNextsPosts()
            }
        }
    }
}

