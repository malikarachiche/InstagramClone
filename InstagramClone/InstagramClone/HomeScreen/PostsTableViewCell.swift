//
//  PostsTableViewCell.swift
//  InstagramClone
//
//  Created by Malik Arachiche on 5/6/21.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    static let reUse = "PostsTableViewCell"
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var postImageView: UIImageView = {
        let postImageView = UIImageView()
        postImageView.backgroundColor = .systemOrange
        return postImageView
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .medium, scale: .medium)
        button.setImage(UIImage(systemName: "heart", withConfiguration: config), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .label
        button.backgroundColor = .clear
        return button
    }()
    
    lazy var commentButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .medium, scale: .medium)
        button.setImage(UIImage(systemName: "message", withConfiguration: config), for: .normal)
        button.tintColor = .label
        button.backgroundColor = .clear
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .medium, scale: .medium)
        button.setImage(UIImage(systemName: "paperplane", withConfiguration: config), for: .normal)
        button.tintColor = .label
        button.backgroundColor = .clear
        return button
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .medium, scale: .medium)
        button.setImage(UIImage(systemName: "bookmark", withConfiguration: config), for: .normal)
        button.tintColor = .label
        button.backgroundColor = .clear
        return button
    }()
    
    lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.textAlignment = .left
        label.textColor = .label
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var captionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 16)
        label.textAlignment = .left
        label.textColor = .label
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUpView() {
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.addSubview(postImageView)
        containerView.addSubview(buttonStackView)
        containerView.addSubview(saveButton)
        containerView.addSubview(likesLabel)
        containerView.addSubview(captionLabel)
        
        containerView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
            make.height.equalTo(500)
        }
        
        postImageView.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(375)
        }
        
        buttonStackView.snp.makeConstraints { (make) in
            make.leading.equalTo(8)
            make.top.equalTo(postImageView.snp.bottom).offset(4)
            make.width.equalToSuperview().multipliedBy(0.33)
            make.height.equalTo(48)
        }
        
        saveButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(-8)
            make.top.equalTo(postImageView.snp.bottom).offset(4)
            make.width.height.equalTo(48)
        }
        
        likesLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(16)
            make.top.equalTo(buttonStackView.snp.bottom).offset(4)
            make.width.equalTo(369)
            make.height.equalTo(18)
        }
        
        captionLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(16)
            make.top.equalTo(likesLabel.snp.bottom).offset(4)
            make.width.equalTo(359)
            make.height.equalTo(50)
        }
    }

}
