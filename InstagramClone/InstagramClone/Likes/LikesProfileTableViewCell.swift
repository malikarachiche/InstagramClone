//
//  LikesProfileTableViewCell.swift
//  InstagramClone
//
//  Created by Malik Arachiche on 5/8/21.
//

import UIKit

class LikesProfileTableViewCell: UITableViewCell {
    static let reUse = "LikesProfileTableViewCell"
    
    var followAction: ((LikesProfileTableViewCell) -> Void)?
    
    lazy var profileImageView: UIImageView = {
        let profileImageView = UIImageView()
        profileImageView.contentMode = .scaleAspectFill
        profileImageView.clipsToBounds = true
        profileImageView.backgroundColor = .systemGray3
        profileImageView.layer.cornerRadius = 32
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        return profileImageView
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .label
        label.font = UIFont(name: HelveticaFont.medium, size: 16)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .secondaryLabel
        label.font = UIFont(name: HelveticaFont.regular, size: 14)
        return label
    }()
    
    lazy var followButton: FollowButton = {
        let button = FollowButton()
        button.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameLabel, subtitleLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 3
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
        contentView.addSubview(labelStackView)
        contentView.addSubview(followButton)
        
        profileImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(12)
            make.top.equalToSuperview().offset(8)
            make.bottom.equalToSuperview().offset(-8)
            make.width.height.equalTo(64)
        }
        
        labelStackView.snp.makeConstraints { (make) in
            make.leading.equalTo(profileImageView.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
            make.trailing.equalTo(followButton).offset(-8)
        }
        
        followButton.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
            make.width.equalTo(104)
            make.height.equalTo(32)
        }
    }
    
    @objc func followButtonTapped() { followAction?(self) }
}
