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
    
    var feedNavigationButton: UIButton!
    var signOutNavigationButton: UIButton!
    var userNavigationButton: UIButton!
    var writePostNavigationButton: UIButton!
    var settingsNavigationButton: UIButton!
    
    var navigationTabBarView: UIView!
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var posts = [Post]()
    var postsTableView: UITableView!
    let postsReuseIdentifier = "PostTableViewCellReuse"
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        view.backgroundColor = .white
        
        userImageView = UIImageView()
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.image = UIImage(named: "\(user.photo_id)")
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
        postsTableView.estimatedRowHeight = 100.0
        postsTableView.separatorStyle = .none
        postsTableView.tableFooterView = UIView() // so there's no empty lines at the bottom
        view.addSubview(postsTableView)
        
        navigationTabBarView = UIView()
        navigationTabBarView.translatesAutoresizingMaskIntoConstraints = false
        navigationTabBarView.backgroundColor = UIColor(red: 217/255, green: 217/255, blue: 217/255, alpha: 1)
        view.addSubview(navigationTabBarView)
        
        feedNavigationButton = UIButton()
        feedNavigationButton.translatesAutoresizingMaskIntoConstraints = false
        feedNavigationButton.setImage(UIImage(named: "feed"), for: .normal)
        feedNavigationButton.addTarget(self, action: #selector(feedNavigationButtonClicked), for: .touchUpInside)
        navigationTabBarView.addSubview(feedNavigationButton)
        
        signOutNavigationButton = UIButton()
        signOutNavigationButton.translatesAutoresizingMaskIntoConstraints = false
        signOutNavigationButton.setImage(UIImage(named: "signout"), for: .normal)
        signOutNavigationButton.addTarget(self, action: #selector(signOutButtonClicked), for: .touchUpInside)
        navigationTabBarView.addSubview(signOutNavigationButton)
        
        userNavigationButton = UIButton()
        userNavigationButton.translatesAutoresizingMaskIntoConstraints = false
        userNavigationButton.setImage(UIImage(named: "user"), for: .normal)
        userNavigationButton.addTarget(self, action: #selector(feedNavigationButtonClicked), for: .touchUpInside)
        navigationTabBarView.addSubview(userNavigationButton)
        
        writePostNavigationButton = UIButton()
        writePostNavigationButton.translatesAutoresizingMaskIntoConstraints = false
        writePostNavigationButton.setImage(UIImage(named: "addpost"), for: .normal)
        writePostNavigationButton.addTarget(self, action: #selector(feedNavigationButtonClicked), for: .touchUpInside)
        navigationTabBarView.addSubview(writePostNavigationButton)
        
        settingsNavigationButton = UIButton()
        settingsNavigationButton.translatesAutoresizingMaskIntoConstraints = false
        settingsNavigationButton.setImage(UIImage(named: "settings"), for: .normal)
        settingsNavigationButton.addTarget(self, action: #selector(feedNavigationButtonClicked), for: .touchUpInside)
        navigationTabBarView.addSubview(settingsNavigationButton)
        
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
            postsTableView.bottomAnchor.constraint(equalTo: navigationTabBarView.topAnchor)
            ])
        
        NSLayoutConstraint.activate([
            feedNavigationButton.heightAnchor.constraint(equalToConstant: 25),
            feedNavigationButton.widthAnchor.constraint(equalToConstant: 25),
            feedNavigationButton.centerXAnchor.constraint(equalTo: navigationTabBarView.leadingAnchor, constant: width/8),
            feedNavigationButton.centerYAnchor.constraint(equalTo: navigationTabBarView.centerYAnchor)
            ])
        
        NSLayoutConstraint.activate([
            settingsNavigationButton.heightAnchor.constraint(equalToConstant: 25),
            settingsNavigationButton.widthAnchor.constraint(equalToConstant: 25),
            settingsNavigationButton.centerXAnchor.constraint(equalTo: feedNavigationButton.centerXAnchor, constant: 3*width/16),
            settingsNavigationButton.centerYAnchor.constraint(equalTo: navigationTabBarView.centerYAnchor)
            ])
        
        NSLayoutConstraint.activate([
            userNavigationButton.heightAnchor.constraint(equalToConstant: 25),
            userNavigationButton.widthAnchor.constraint(equalToConstant: 25),
            userNavigationButton.centerXAnchor.constraint(equalTo: writePostNavigationButton.centerXAnchor, constant: 3*width/16),
            userNavigationButton.centerYAnchor.constraint(equalTo: navigationTabBarView.centerYAnchor)
            ])
        
        NSLayoutConstraint.activate([
            writePostNavigationButton.heightAnchor.constraint(equalToConstant: 25),
            writePostNavigationButton.widthAnchor.constraint(equalToConstant: 25),
            writePostNavigationButton.centerYAnchor.constraint(equalTo: navigationTabBarView.centerYAnchor),
            writePostNavigationButton.centerXAnchor.constraint(equalTo: navigationTabBarView.centerXAnchor)
            ])
        
        NSLayoutConstraint.activate([
            signOutNavigationButton.heightAnchor.constraint(equalToConstant: 25),
            signOutNavigationButton.widthAnchor.constraint(equalToConstant: 25),
            signOutNavigationButton.centerYAnchor.constraint(equalTo: navigationTabBarView.centerYAnchor),
            signOutNavigationButton.centerXAnchor.constraint(equalTo: navigationTabBarView.trailingAnchor, constant: -width/8)
            ])
        
        NSLayoutConstraint.activate([
            navigationTabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationTabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationTabBarView.heightAnchor.constraint(equalToConstant: 50),
            navigationTabBarView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
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
    
    @objc func feedNavigationButtonClicked() {
        print("Feed navigation clicked")
    }
    
    @objc func signOutButtonClicked() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @objc func createPost(text: String) {
        NetworkManager.createPost(text: text) { newPost in
            DispatchQueue.main.async {
                self.posts.insert(newPost, at: 0)
                self.postsTableView.reloadData()
            }
        }
    }
}

extension PostsNavigationViewController: UITableViewDelegate, UITableViewDataSource, PostTableViewCellDelegate {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: postsReuseIdentifier, for: indexPath) as! PostTableViewCell
        cell.delegate = self
        cell.configure(for: posts[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let post = posts[indexPath.row]
        let postNavigationViewController = PostNavigationViewController()
        postNavigationViewController.post = post
        postNavigationViewController.randomNumber = user.photo_id
        navigationController?.pushViewController(postNavigationViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView,heightForRowAt indexPath:IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
    
    func commentButtonClicked(cell: PostTableViewCell) {
        let indexPath = self.postsTableView.indexPath(for: cell)
        if let postIndexPath = indexPath {
            let post = posts[postIndexPath.row]
            let postNavigationViewController = PostNavigationViewController()
            postNavigationViewController.post = post
            postNavigationViewController.randomNumber = user.photo_id
            navigationController?.pushViewController(postNavigationViewController, animated: true)
        }
    }
    
    func likeButtonClicked(cell: PostTableViewCell) {
        let indexPath = self.postsTableView.indexPath(for: cell)
        print("delegate stuff \(indexPath!.row)")
        if let postIndexPath = indexPath {
            let post = posts[postIndexPath.row]
            NetworkManager.likePost(postId: post.id) { newPost in
                DispatchQueue.main.async {
                    self.getPosts()
                    self.postsTableView.reloadData()
                }
            }
        }
    }
}
