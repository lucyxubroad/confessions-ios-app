//
//  PostTableViewCell.swift
//  ConfessionsDynamicApp
//
//  Created by Lucy Xu on 12/24/18.
//  Copyright © 2018 Lucy Xu. All rights reserved.
//

import UIKit

protocol PostTableViewCellDelegate: class {
    func commentButtonClicked(cell: PostTableViewCell)
    func likeButtonClicked(cell: PostTableViewCell)
}

class PostTableViewCell: UITableViewCell {
    
    var postTextLabel: UILabel!
    var userImageView: UIImageView!
    var userNameLabel: UILabel!
    
    var grayHeartImageView: UIImageView!
    var likeCountLabel: UILabel!
    var grayCommentImageView: UIImageView!
    var commentCountLabel: UILabel!
    
    let username: String = "Anonymous #1231"
    
    var likeButton: UIButton!
    var commentButton: UIButton!
    
    let padding: CGFloat = 8
    let labelHeight: CGFloat = 32
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    weak var delegate: PostTableViewCellDelegate?
    
    let randomNumber = Int.random(in: 1 ..< 6)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        postTextLabel = UILabel()
        postTextLabel.frame = CGRect(x: 0, y: 0, width: 400, height: 300)
        postTextLabel.translatesAutoresizingMaskIntoConstraints = false
        postTextLabel.textColor = .black
        postTextLabel.lineBreakMode = .byWordWrapping
        postTextLabel.numberOfLines = 0
        postTextLabel.font = UIFont.systemFont(ofSize: 14)
        
        userImageView = UIImageView()
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.image = UIImage(named: "\(randomNumber)")
        userImageView.layer.cornerRadius = 20
        userImageView.layer.masksToBounds = true
        
        userNameLabel = UILabel()
        userNameLabel.text = username
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.textColor = .black
        userNameLabel.font = UIFont.systemFont(ofSize: 14)
        
        grayHeartImageView = UIImageView()
        grayHeartImageView.translatesAutoresizingMaskIntoConstraints = false
        
        likeCountLabel = UILabel()
        likeCountLabel.translatesAutoresizingMaskIntoConstraints = false
        likeCountLabel.textColor = UIColor(red: 185/255, green: 185/255, blue: 185/255, alpha: 1)
        likeCountLabel.font = UIFont.systemFont(ofSize: 12)
        
        grayCommentImageView = UIImageView()
        grayCommentImageView.translatesAutoresizingMaskIntoConstraints = false

        commentCountLabel = UILabel()
        commentCountLabel.translatesAutoresizingMaskIntoConstraints = false
        commentCountLabel.textColor = UIColor(red: 185/255, green: 185/255, blue: 185/255, alpha: 1)
        commentCountLabel.font = UIFont.systemFont(ofSize: 12)
        
        likeButton = UIButton()
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.setTitle("Like", for: .normal)
        likeButton.setTitleColor(.black, for: .normal)
        likeButton.layer.borderWidth = 1
        likeButton.layer.borderColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1.0).cgColor
        likeButton.addTarget(self, action: #selector(likeButtonClicked), for: .touchUpInside)
        
        commentButton = UIButton()
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentButton.setTitle("Comment", for: .normal)
        commentButton.setTitleColor(.black, for: .normal)
        commentButton.layer.borderWidth = 1
        commentButton.layer.borderColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1.0).cgColor
        commentButton.addTarget(self, action: #selector(commentButtonClicked), for: .touchUpInside)
        
        contentView.addSubview(userImageView)
        contentView.addSubview(postTextLabel)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(grayHeartImageView)
        contentView.addSubview(likeCountLabel)
        contentView.addSubview(grayCommentImageView)
        contentView.addSubview(commentCountLabel)
        
        updateConstraints()
    }
    
    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            userImageView.widthAnchor.constraint(equalToConstant: 40),
            userImageView.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            userNameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: padding*2),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
            ])
        
        NSLayoutConstraint.activate([
            postTextLabel.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor),
            postTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            postTextLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: padding),
            ])
        
        NSLayoutConstraint.activate([
            grayHeartImageView.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor),
            grayHeartImageView.topAnchor.constraint(equalTo: postTextLabel.bottomAnchor, constant: padding),
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
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            likeButton.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),
            likeButton.heightAnchor.constraint(equalToConstant: 50),
            likeButton.topAnchor.constraint(equalTo: grayHeartImageView.bottomAnchor, constant: padding*2),
            ])
        
        NSLayoutConstraint.activate([
            commentButton.topAnchor.constraint(equalTo: likeButton.topAnchor),
            commentButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            commentButton.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
            commentButton.heightAnchor.constraint(equalToConstant: 50),
            ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: userImageView.topAnchor, constant: -30),
            contentView.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor, constant: -30),
            contentView.trailingAnchor.constraint(equalTo: postTextLabel.trailingAnchor, constant: padding),
            contentView.bottomAnchor.constraint(equalTo: commentButton.bottomAnchor)
            ])
        
        super.updateConstraints()
    }
    
    @objc func likeButtonClicked() {
        print("likeButtonClicked")
        delegate?.likeButtonClicked(cell: self)
    }
    
    @objc func commentButtonClicked() {
//        print("commentButtonClicked")
        delegate?.commentButtonClicked(cell: self)
    }
    
    func configure(for post: Post) {
        postTextLabel.text = post.text
        if (post.score > 0) {
            grayHeartImageView.image = UIImage(named: "heart-pink")
        } else {
            grayHeartImageView.image = UIImage(named: "heart-gray")
        }
        likeCountLabel.text = "\(post.score)"
        if (post.comment_count > 0) {
            grayCommentImageView.image = UIImage(named: "comment-pink")
        } else {
            grayCommentImageView.image = UIImage(named: "comment-gray")
        }
        commentCountLabel.text = "\(post.comment_count)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

