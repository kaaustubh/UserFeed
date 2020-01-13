//
//  ViewController.swift
//  Audi_list
//
//  Created by Kaustubh on 13/01/20.
//  Copyright © 2020 KaustubhtestApp. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var dataSource = PostDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.dataSource = dataSource
        PostsService().loadPosts(offset: 0, limit: 10) {[weak self] posts, error in
            guard let self = self else {return}
            DispatchQueue.main.async{
                if error == nil {
                    if let posts = posts {
                        self.dataSource.appendPosts(newPost: posts)
                        self.tableView.reloadData()
                    }
                }
                else {
                    
                }
            }
        }
    }
}

class PostDataSource: NSObject {
    var posts = [Post]()
    
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
        return cell
    }
    
    
}

