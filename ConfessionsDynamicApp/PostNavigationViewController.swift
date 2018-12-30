//
//  Post NavigationViewController.swift
//  ConfessionsDynamicApp
//
//  Created by Lucy Xu on 12/24/18.
//  Copyright © 2018 Lucy Xu. All rights reserved.
//

import UIKit

class PostNavigationViewController: UIViewController {
    
    var post: Post!
    
    var backArrowImageView: UIImageView!
    var userImageView: UIImageView!
    var postTextLabel: UILabel!
    var userNameLabel: UILabel!
    var commentBoxView: UIView!
    var commentTextField: UITextField!
    var commentPostButton: UIButton!
    
    var grayHeartImageView: UIImageView!
    var likeCountLabel: UILabel!
    var grayCommentImageView: UIImageView!
    var commentCountLabel: UILabel!
    
    var largeGrayHeartImageView: UIImageView!
    
    var commentsTableView: UITableView!
    let commentsReuseIdentifier = "CommentTableViewCellReuse"
    
    var feedNavigationButton: UIButton!
    var signOutNavigationButton: UIButton!
    var userNavigationButton: UIButton!
    var writePostNavigationButton: UIButton!
    var settingsNavigationButton: UIButton!
    
    var navigationTabBarView: UIView!
    
    let username: String = "Anonymous #1231"
    let padding: CGFloat = 8
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var randomNumber: Int!
    
    var comments = [Comment1]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let comment = Comment(id: 1, score: 1, text: "please work test comment test test", username: "Lucy")
//        comments = [comment, comment, comment, comment, comment, comment]

        // Do any additional setup after loading the view.
        
        view.backgroundColor = .white
    
        backArrowImageView = UIImageView()
        let tap = UITapGestureRecognizer(target: self, action: #selector(backArrowTapped))
        backArrowImageView.addGestureRecognizer(tap)
        backArrowImageView.isUserInteractionEnabled = true
        backArrowImageView.translatesAutoresizingMaskIntoConstraints = false
        backArrowImageView.image = UIImage(named: "back")
        view.addSubview(backArrowImageView)
        
        userImageView = UIImageView()
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.image = UIImage(named: "\(randomNumber ?? 3)")
        userImageView.layer.cornerRadius = 20
        userImageView.layer.masksToBounds = true
        view.addSubview(userImageView)
        
        userNameLabel = UILabel()
        userNameLabel.text = username
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.textColor = .black
        userNameLabel.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(userNameLabel)
        
        postTextLabel = UILabel()
        postTextLabel.frame = CGRect(x: 0, y: 0, width: 400, height: 300)
        postTextLabel.translatesAutoresizingMaskIntoConstraints = false
        postTextLabel.text = post.text
        postTextLabel.textColor = .black
        postTextLabel.lineBreakMode = .byWordWrapping
        postTextLabel.numberOfLines = 0
        postTextLabel.font = UIFont.systemFont(ofSize: 14)
        view.addSubview(postTextLabel)
        
        grayHeartImageView = UIImageView()
        grayHeartImageView.translatesAutoresizingMaskIntoConstraints = false
        if (post.score > 0) {
            grayHeartImageView.image = UIImage(named: "heart-pink")
        } else {
            grayHeartImageView.image = UIImage(named: "heart-gray")
        }
        
        likeCountLabel = UILabel()
        likeCountLabel.translatesAutoresizingMaskIntoConstraints = false
        likeCountLabel.textColor = UIColor(red: 185/255, green: 185/255, blue: 185/255, alpha: 1)
        likeCountLabel.text = "\(post.score)"
        likeCountLabel.font = UIFont.systemFont(ofSize: 12)
        
        grayCommentImageView = UIImageView()
        if (post.comment_count > 0) {
            grayCommentImageView.image = UIImage(named: "comment-pink")
        } else {
            grayCommentImageView.image = UIImage(named: "comment-gray")
        }
        grayCommentImageView.translatesAutoresizingMaskIntoConstraints = false
        
        largeGrayHeartImageView = UIImageView()
        largeGrayHeartImageView.translatesAutoresizingMaskIntoConstraints = false
        
//        if liked {
//            largeGrayHeartImageView.image = UIImage(named: "comment-pink")
//        } else {
//            largeGrayHeartImageView.image = UIImage(named: "comment-pink")
//        }
        
        commentCountLabel = UILabel()
        commentCountLabel.translatesAutoresizingMaskIntoConstraints = false
        commentCountLabel.text = "\(post.comment_count)"
        commentCountLabel.textColor = UIColor(red: 185/255, green: 185/255, blue: 185/255, alpha: 1)
        commentCountLabel.font = UIFont.systemFont(ofSize: 12)
        
        commentsTableView = UITableView()
        commentsTableView.translatesAutoresizingMaskIntoConstraints = false
        commentsTableView.allowsSelection = false
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
        commentsTableView.register(CommentTableViewCell.self, forCellReuseIdentifier: commentsReuseIdentifier)
        commentsTableView.tableFooterView = UIView() // so there's no empty lines at the bottom
        commentsTableView.rowHeight = UITableView.automaticDimension
        commentsTableView.estimatedRowHeight = 100.0
        commentsTableView.separatorStyle = .none
        view.addSubview(commentsTableView)
        
        commentBoxView = UIView()
        commentBoxView.translatesAutoresizingMaskIntoConstraints = false
        commentBoxView.backgroundColor = .white
        view.addSubview(commentBoxView)
        
        commentTextField = UITextField()
        commentTextField.translatesAutoresizingMaskIntoConstraints = false
        commentTextField.placeholder = "Write a comment..."
        commentTextField.backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        commentTextField.layer.cornerRadius = 15
        commentTextField.textColor = .black
        commentTextField.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        view.addSubview(commentTextField)
        
        commentPostButton = UIButton()
        commentPostButton.translatesAutoresizingMaskIntoConstraints = false
        commentPostButton.setTitle("Post", for: .normal)
        commentPostButton.setTitleColor(UIColor(red: 241/255, green: 53/255, blue: 100/255, alpha: 1), for: .normal)
        commentPostButton.addTarget(self, action: #selector(commentPostButtonClicked), for: .touchUpInside)
        view.addSubview(commentPostButton)
        view.addSubview(grayHeartImageView)
        view.addSubview(likeCountLabel)
        view.addSubview(grayCommentImageView)
        view.addSubview(commentCountLabel)
        
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
        getComments()
    }
    
    func setUpConstraints() {
        
        NSLayoutConstraint.activate([
            backArrowImageView.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            backArrowImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            backArrowImageView.widthAnchor.constraint(equalToConstant: 25),
            backArrowImageView.heightAnchor.constraint(equalToConstant: 25)
            ])
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            userImageView.leadingAnchor.constraint(equalTo: backArrowImageView.trailingAnchor, constant: 15),
            userImageView.widthAnchor.constraint(equalToConstant: 40),
            userImageView.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            postTextLabel.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor),
            postTextLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            postTextLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: padding),
            ])
        
        NSLayoutConstraint.activate([
            userNameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: padding*2),
            userNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            grayHeartImageView.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor),
            grayHeartImageView.topAnchor.constraint(equalTo: postTextLabel.bottomAnchor, constant: padding*3),
            grayHeartImageView.widthAnchor.constraint(equalToConstant: 15),
            grayHeartImageView.heightAnchor.constraint(equalToConstant: 15)
            ])
        
        NSLayoutConstraint.activate([
            likeCountLabel.centerYAnchor.constraint(equalTo: grayHeartImageView.centerYAnchor),
            likeCountLabel.leadingAnchor.constraint(equalTo: grayHeartImageView.trailingAnchor, constant: padding),
            ])
        
        NSLayoutConstraint.activate([
            grayCommentImageView.leadingAnchor.constraint(equalTo: likeCountLabel.trailingAnchor, constant: padding*2),
            grayCommentImageView.topAnchor.constraint(equalTo: grayHeartImageView.topAnchor),
            grayCommentImageView.widthAnchor.constraint(equalToConstant: 15),
            grayCommentImageView.heightAnchor.constraint(equalToConstant: 15)
            ])
        
        NSLayoutConstraint.activate([
            commentCountLabel.centerYAnchor.constraint(equalTo: grayCommentImageView.centerYAnchor),
            commentCountLabel.leadingAnchor.constraint(equalTo: grayCommentImageView.trailingAnchor, constant: padding)
            ])
        
        NSLayoutConstraint.activate([
            commentsTableView.topAnchor.constraint(equalTo: grayHeartImageView.bottomAnchor, constant: padding*3),
            commentsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            commentsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            commentsTableView.bottomAnchor.constraint(equalTo: commentBoxView.topAnchor)
            ])
        
        NSLayoutConstraint.activate([
            commentBoxView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            commentBoxView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            commentBoxView.bottomAnchor.constraint(equalTo: navigationTabBarView.topAnchor),
            commentBoxView.heightAnchor.constraint(equalToConstant: 75)
            ])
        
        NSLayoutConstraint.activate([
            commentTextField.topAnchor.constraint(equalTo: commentBoxView.topAnchor, constant: padding*2),
            commentTextField.leadingAnchor.constraint(equalTo: commentBoxView.leadingAnchor, constant: padding*3),
            commentTextField.bottomAnchor.constraint(equalTo: commentBoxView.bottomAnchor, constant: -padding*2),
            commentTextField.widthAnchor.constraint(equalToConstant: width*0.65)
            ])
        
        NSLayoutConstraint.activate([
            commentPostButton.centerYAnchor.constraint(equalTo: commentTextField.centerYAnchor),
            commentPostButton.leadingAnchor.constraint(equalTo: commentTextField.trailingAnchor, constant: padding*2),
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
    func getComments() {
        NetworkManager.getComments(postId: post.id) { commentsArray in
            self.comments = commentsArray
//            self.comments.reverse()
            DispatchQueue.main.async {
                self.commentsTableView.reloadData()
            }
        }
    }
    
    @objc func commentPostButtonClicked() {
//        print("commentPostButtonClicked")
        if let commentText = commentTextField.text {
            createComment(postId: post.id, text: commentText)
        }
    }
    
    @objc func backArrowTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func feedNavigationButtonClicked() {
        print("Feed navigation clicked")
    }
    
    @objc func signOutButtonClicked() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func createComment(postId: Int, text: String) {
        NetworkManager.createComment(postId: postId, text: text) { returnedPost in
            DispatchQueue.main.async {
                self.getComments()
                self.commentsTableView.reloadData()
            }
        }
    }
}

extension PostNavigationViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: commentsReuseIdentifier, for: indexPath) as! CommentTableViewCell
        cell.configure(for: comments[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }
    
    func tableView(_ tableView: UITableView,heightForRowAt indexPath:IndexPath) -> CGFloat
    {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 100
    }
}

