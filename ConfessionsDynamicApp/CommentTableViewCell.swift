//
//  PostTableViewCell.swift
//  ConfessionsDynamicApp
//
//  Created by Lucy Xu on 12/24/18.
//  Copyright © 2018 Lucy Xu. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {
    
    var commentTextLabel: UILabel!
    var userImageView: UIImageView!
    var userNameLabel: UILabel!
    var commentBoxView: UIView!
    
    let username: String = "Anonymous #1231"
    
    let padding: CGFloat = 8
    let labelHeight: CGFloat = 32
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor(red: 239/255, green: 239/255, blue: 239/255, alpha: 1)
        
        commentBoxView = UIView()
        commentBoxView.translatesAutoresizingMaskIntoConstraints = false
        commentBoxView.backgroundColor = .white
        commentBoxView.layer.cornerRadius = 15
        
        commentTextLabel = UILabel()
        commentTextLabel.frame = CGRect(x: 0, y: 0, width: 400, height: 300)
        commentTextLabel.translatesAutoresizingMaskIntoConstraints = false
        commentTextLabel.textColor = .black
        commentTextLabel.lineBreakMode = .byWordWrapping
        commentTextLabel.numberOfLines = 0
        commentTextLabel.font = UIFont.systemFont(ofSize: 14)
        
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
        
        contentView.addSubview(userImageView)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(commentTextLabel)
        contentView.addSubview(commentBoxView)
        contentView.sendSubviewToBack(commentBoxView)
        
        updateConstraints()
    }
    
    override func updateConstraints() {
        
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding*2),
            userImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 45),
            userImageView.widthAnchor.constraint(equalToConstant: 40),
            userImageView.heightAnchor.constraint(equalToConstant: 40)
            ])
        
        NSLayoutConstraint.activate([
            userNameLabel.centerYAnchor.constraint(equalTo: userImageView.centerYAnchor),
            userNameLabel.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: padding*2),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding)
            ])

        NSLayoutConstraint.activate([
            commentTextLabel.leadingAnchor.constraint(equalTo: userNameLabel.leadingAnchor),
            commentTextLabel.trailingAnchor.constraint(equalTo: commentBoxView.trailingAnchor, constant: -padding),
            commentTextLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor, constant: padding),
            ])

        NSLayoutConstraint.activate([
            commentBoxView.topAnchor.constraint(equalTo: userImageView.topAnchor),
            commentBoxView.leadingAnchor.constraint(equalTo: userImageView.trailingAnchor, constant: padding),
            commentBoxView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -45),
            commentBoxView.bottomAnchor.constraint(equalTo: commentTextLabel.bottomAnchor, constant: padding*2)
            ])
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: userImageView.topAnchor, constant: -padding*2),
            contentView.leadingAnchor.constraint(equalTo: userImageView.leadingAnchor, constant: -45),
            contentView.trailingAnchor.constraint(equalTo: commentBoxView.trailingAnchor, constant: 45),
            contentView.bottomAnchor.constraint(equalTo: commentBoxView.bottomAnchor, constant: padding*2)
            ])
        
        super.updateConstraints()
    }
    
    func configure(for comment: Comment1) {
        commentTextLabel.text = comment.text
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
