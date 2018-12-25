//
//  PostsNavigationViewController.swift
//  ConfessionsApp
//
//  Created by Lucy Xu on 12/23/18.
//  Copyright © 2018 Lucy Xu. All rights reserved.
//

import UIKit

class PostsNavigationViewController: UIViewController {
    
    var userImageView: UIImageView!
    var postTextField: UITextField!
    var postButton: UIButton!
    
    var posts = [Post]()
    var postsTableView: UITableView!
    let postsReuseIdentifier = "PostTableViewCellReuse"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
        
        userImageView = UIImageView()
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.image = UIImage(named: "profile-men")
        userImageView.layer.cornerRadius = 20
        userImageView.layer.masksToBounds = true
        view.addSubview(userImageView)
        
        postTextField = UITextField()
        postTextField.translatesAutoresizingMaskIntoConstraints = false
        postTextField.placeholder = "What's on your mind?"
        postTextField.textColor = .black
        postTextField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.addSubview(postTextField)
        
        postButton = UIButton()
        postButton.translatesAutoresizingMaskIntoConstraints = false
        postButton.setTitle("Post", for: .normal)
        postButton.backgroundColor = UIColor(red: 241/255, green: 53/255, blue: 100/255, alpha: 1)
        postButton.setTitleColor(.white, for: .normal)
        postButton.addTarget(self, action: #selector(postButtonClicked), for: .touchUpInside)
        view.addSubview(postButton)
        
        postsTableView = UITableView()
        postsTableView.translatesAutoresizingMaskIntoConstraints = false
        postsTableView.allowsSelection = true
        postsTableView.delegate = self
        postsTableView.dataSource = self
        postsTableView.register(PostTableViewCell.self, forCellReuseIdentifier: postsReuseIdentifier)
        postsTableView.tableFooterView = UIView() // so there's no empty lines at the bottom
        view.addSubview(postsTableView)
        
        setUpConstraints()
        getPosts()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            userImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            userImageView.widthAnchor.constraint(equalToConstant: 40),
            userImageView.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            postTextField.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            postTextField.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: 30),
            postTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30)
            ])
        
        NSLayoutConstraint.activate([
            postButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 125),
            postButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postButton.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            postsTableView.topAnchor.constraint(equalTo: postButton.bottomAnchor),
            postsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            postsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            postsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
    }
    
    /// Gets classes from the network by making an API call.
    func getPosts() {
        NetworkManager.getPosts { postsArray in
            self.posts = postsArray
            self.posts.reverse()
            DispatchQueue.main.async {
                self.postsTableView.reloadData()
            }
        }
    }
    
    @objc func postButtonClicked() {
        print(postTextField.text ?? "manual text")
        if let postText = postTextField.text {
            createPost(text: postText)
        }
    }
    
    @objc func createPost(text: String) {
        NetworkManager.createPost(text: text) { newPost in
            self.posts.append(newPost)
            self.posts.reverse()
            DispatchQueue.main.async {
                self.postsTableView.reloadData()
            }
        }
    }
}

extension PostsNavigationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: postsReuseIdentifier, for: indexPath) as! PostTableViewCell
        cell.configure(for: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("clicked")
        let post = posts[indexPath.row]
        let postNavigationViewController = PostNavigationViewController()
        postNavigationViewController.post = post
        navigationController?.pushViewController(postNavigationViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}
