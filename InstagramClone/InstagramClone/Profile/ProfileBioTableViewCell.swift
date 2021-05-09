//
//  ProfileBioTableViewCell.swift
//  InstagramClone
//
//  Created by Malik Arachiche on 5/8/21.
//

import UIKit

class ProfileBioTableViewCell: UITableViewCell {
    static let reUse = "ProfileBioTableViewCell"
    
    lazy var profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.backgroundColor = .systemGray
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.layer.cornerRadius = 40
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        return profileImageView
    }()
    
    lazy var numberOfPostsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .label
        label.font = UIFont(name: HelveticaFont.medium, size: 18)
        return label
    }()
    
    lazy var numberOfFollowersLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .label
        label.font = UIFont(name: HelveticaFont.medium, size: 18)
        return label
    }()
    
    lazy var numberOfFollowingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .label
        label.font = UIFont(name: HelveticaFont.medium, size: 18)
        return label
    }()
    
    lazy var postsLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .label
        label.text = "Posts"
        label.font = UIFont(name: HelveticaFont.regular, size: 15)
        return label
    }()
    
    lazy var followersLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .label
        label.text = "Followers"
        label.font = UIFont(name: HelveticaFont.regular, size: 15)
        return label
    }()
    
    lazy var followingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.textColor = .label
        label.text = "Following"
        label.font = UIFont(name: HelveticaFont.regular, size: 15)
        return label
    }()
    
    lazy var postsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [numberOfPostsLabel, postsLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 2
        return stackView
    }()
    
    lazy var followersStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [numberOfFollowersLabel, followersLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 2
        return stackView
    }()
    
    lazy var followingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [numberOfFollowingLabel, followingLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 2
        return stackView
    }()
    
    lazy var topLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [postsStackView, followersStackView, followingStackView])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .label
        label.font = UIFont(name: HelveticaFont.medium, size: 15)
        return label
    }()
    
    lazy var businessLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .secondaryLabel
        label.font = UIFont(name: HelveticaFont.regular, size: 15)
        return label
    }()
    
    lazy var bioLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .label
        label.numberOfLines = 0
        label.font = UIFont(name: HelveticaFont.regular, size: 15)
        return label
    }()
    
    lazy var websiteLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .label
        label.font = UIFont(name: HelveticaFont.regular, size: 15)
        return label
    }()
    
    lazy var followedByLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .label
        label.numberOfLines = 0
        label.font = UIFont(name: HelveticaFont.regular, size: 15)
        return label
    }()
    
    lazy var bioLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, businessLabel, bioLabel, websiteLabel, followedByLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 3
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var viewShopButton: ProfileButton = {
        let button = ProfileButton()
        button.setTitle("View Shop", for: .normal)
        return button
    }()
    
    lazy var followButton: FollowButton = {
        let button = FollowButton()
        return button
    }()
    
    lazy var messageButton: ProfileButton = {
        let button = ProfileButton()
        button.setTitle("Message", for: .normal)
        return button
    }()
    
    lazy var contactButton: ProfileButton = {
        let button = ProfileButton()
        button.setTitle("Contact", for: .normal)
        return button
    }()
    
    lazy var buttonsHorizontalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [followButton, messageButton, contactButton])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        return stackView
    }()
    
    lazy var buttonsVerticalStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [viewShopButton, buttonsHorizontalStackView])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 6
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        //layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: -12)
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(StoryCollectionViewCell.self, forCellWithReuseIdentifier: StoryCollectionViewCell.reUse)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var bigStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [bioLabelStackView, buttonsVerticalStackView, collectionView])
        stackView.axis = .vertical
        stackView.spacing = 12
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
        contentView.addSubview(profileImageView)
        contentView.addSubview(topLabelStackView)
        contentView.addSubview(bigStackView)
//        contentView.addSubview(bioLabelStackView)
//        contentView.addSubview(buttonsVerticalStackView)
//        contentView.addSubview(collectionView)
        
        profileImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(12)
            make.top.equalTo(12)
            make.width.height.equalTo(80)
        }
        
        topLabelStackView.snp.makeConstraints { (make) in
            make.leading.equalTo(profileImageView.snp.trailing).offset(32)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalTo(profileImageView.snp.centerY)
        }
        
        bigStackView.snp.makeConstraints { (make) in
            make.leading.equalTo(profileImageView.snp.leading)
            make.trailing.equalToSuperview().offset(-12)
            make.top.equalTo(profileImageView.snp.bottom).offset(12)
            make.bottom.equalToSuperview().offset(-12)
        }
        
//        bioLabelStackView.snp.makeConstraints { (make) in
//            make.leading.equalTo(profileImageView.snp.leading)
//            make.trailing.equalToSuperview().offset(-12)
//            make.top.equalTo(profileImageView.snp.bottom).offset(12)
//        }
//
//        buttonsVerticalStackView.snp.makeConstraints { (make) in
//            make.leading.equalTo(profileImageView.snp.leading)
//            make.trailing.equalTo(bioLabelStackView.snp.trailing)
//            make.top.equalTo(bioLabelStackView.snp.bottom).offset(12)
//        }
//
        collectionView.snp.makeConstraints { (make) in
            make.height.equalTo(96)
        }
    }
}
