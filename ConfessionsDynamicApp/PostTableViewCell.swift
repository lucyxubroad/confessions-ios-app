//
//  PostTableViewCell.swift
//  ConfessionsDynamicApp
//
//  Created by Lucy Xu on 12/24/18.
//  Copyright © 2018 Lucy Xu. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    var postTextLabel: UILabel!
    var userImageView: UIImageView!
    var userNameLabel: UILabel!
    
    let username: String = "Anonymous #1231"
    
    var likeButton: UIButton!
    var commentButton: UIButton!
    
    let padding: CGFloat = 8
    let labelHeight: CGFloat = 32
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        postTextLabel = UILabel()
        postTextLabel.frame = CGRect(x: 0, y: 0, width: 400, height: 300)
        postTextLabel.translatesAutoresizingMaskIntoConstraints = false
        postTextLabel.textColor = .black
        postTextLabel.lineBreakMode = .byWordWrapping
        postTextLabel.numberOfLines = 0
        postTextLabel.font = UIFont.systemFont(ofSize: 14)
        
        userImageView = UIImageView()
        userImageView.translatesAutoresizingMaskIntoConstraints = false
        userImageView.image = UIImage(named: "profile-men")
        userImageView.layer.cornerRadius = 20
        userImageView.layer.masksToBounds = true
        
        userNameLabel = UILabel()
        userNameLabel.text = username
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.textColor = .black
        userNameLabel.font = UIFont.systemFont(ofSize: 14)
        
        likeButton = UIButton()
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.setTitle("Like", for: .normal)
        likeButton.setTitleColor(.black, for: .normal)
        likeButton.layer.borderWidth = 1
        likeButton.layer.borderColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1.0).cgColor
//        likeButton.addTarget(self, action: #selector(presentModalViewController), for: .touchUpInside)
        
        commentButton = UIButton()
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentButton.setTitle("Comment", for: .normal)
        commentButton.setTitleColor(.black, for: .normal)
        commentButton.layer.borderWidth = 1
        commentButton.layer.borderColor = UIColor(red: 243/255, green: 243/255, blue: 243/255, alpha: 1.0).cgColor
        //        likeButton.addTarget(self, action: #selector(presentModalViewController), for: .touchUpInside)
        
        contentView.addSubview(userImageView)
        contentView.addSubview(postTextLabel)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
        
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
//            postTextLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            likeButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            likeButton.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),
            likeButton.heightAnchor.constraint(equalToConstant: 50),
            likeButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        
        NSLayoutConstraint.activate([
            commentButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            commentButton.leadingAnchor.constraint(equalTo: contentView.centerXAnchor),
            commentButton.heightAnchor.constraint(equalToConstant: 50),
            commentButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            ])
        
        super.updateConstraints()
    }
    
    func configure(for post: Post) {
        postTextLabel.text = post.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
