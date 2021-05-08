//
//  PostsTableViewCell.swift
//  InstagramClone
//
//  Created by Malik Arachiche on 5/6/21.
//

import UIKit

class PostsTableViewCell: UITableViewCell {
    static let reUse = "PostsTableViewCell"
    
    var likeLabelAction: (() -> Void)?
    var likeAction: (() -> Void)?
    var commentAction: (() -> Void)?
    var shareAction: (() -> Void)?
    var saveAction: (() -> Void)?

    lazy var postImageView: UIImageView = {
        let postImageGR = UITapGestureRecognizer(target: self, action: #selector(likeTapped))
        postImageGR.numberOfTapsRequired = 2
        let postImageView = UIImageView()
        postImageView.backgroundColor = .systemOrange
        postImageView.isUserInteractionEnabled = true
        postImageView.addGestureRecognizer(postImageGR)
        return postImageView
    }()
    
    lazy var likeButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .medium, scale: .medium)
        button.setImage(UIImage(systemName: "heart", withConfiguration: config), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .label
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(likeTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var commentButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .medium, scale: .medium)
        button.setImage(UIImage(systemName: "message", withConfiguration: config), for: .normal)
        button.tintColor = .label
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(commentTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var shareButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .medium, scale: .medium)
        button.setImage(UIImage(systemName: "paperplane", withConfiguration: config), for: .normal)
        button.tintColor = .label
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(shareTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var saveButton: UIButton = {
        let button = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 22, weight: .medium, scale: .medium)
        button.setImage(UIImage(systemName: "bookmark", withConfiguration: config), for: .normal)
        button.tintColor = .label
        button.backgroundColor = .clear
        button.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var likesLabel: UILabel = {
        let label = UILabel()
        let labelGR = UITapGestureRecognizer(target: self, action: #selector(likeLabelTapped))
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        label.textAlignment = .left
        label.textColor = .label
        label.backgroundColor = .clear
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(labelGR)
        return label
    }()
    
    lazy var captionLabel: UILabel = {
        let label = UILabel()
        let labelGR = UITapGestureRecognizer(target: self, action: #selector(commentTapped))
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        label.textAlignment = .left
        label.textColor = .label
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(labelGR)
        return label
    }()
    
    lazy var viewAllCommentsLabel: UILabel = {
        let labelGR = UITapGestureRecognizer(target: self, action: #selector(commentTapped))
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 15)
        label.textAlignment = .left
        label.textColor = .secondaryLabel
        label.backgroundColor = .clear
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(labelGR)
        return label
    }()
    
    lazy var timePostedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 12)
        label.textAlignment = .left
        label.textColor = .secondaryLabel
        label.backgroundColor = .clear
        return label
    }()
    
    lazy var buttonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likeButton, commentButton, shareButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 12
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likesLabel, captionLabel, viewAllCommentsLabel, timePostedLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
        stackView.spacing = 4
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
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(postImageView)
        contentView.addSubview(buttonStackView)
        contentView.addSubview(labelStackView)
        contentView.addSubview(saveButton)
        
        postImageView.snp.makeConstraints { (make) in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(375)
        }
        
        buttonStackView.snp.makeConstraints { (make) in
            make.leading.equalTo(8)
            make.top.equalTo(postImageView.snp.bottom).offset(8)
        }
        
        labelStackView.snp.makeConstraints { (make) in
            make.leading.equalTo(likeButton.snp.leading).offset(2)
            make.top.equalTo(buttonStackView.snp.bottom).offset(8)
            make.width.equalTo(369)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
        }
        
        saveButton.snp.makeConstraints { (make) in
            make.trailing.equalTo(-8)
            make.top.equalTo(postImageView.snp.bottom).offset(8)
        }
    }
    
    @objc func likeLabelTapped() { likeLabelAction?() }
    @objc func likeTapped() { likeAction?() }
    @objc func commentTapped() { commentAction?() }
    @objc func shareTapped() { shareAction?() }
    @objc func saveTapped() { saveAction?() }
}
