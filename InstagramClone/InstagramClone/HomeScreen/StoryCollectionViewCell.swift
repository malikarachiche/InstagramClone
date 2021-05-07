//
//  StoryCollectionViewCell.swift
//  InstagramClone
//
//  Created by Malik Arachiche on 5/6/21.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    static let reUse = "StoryCollectionViewCell"
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var userImageView: UIImageView = {
        let userImageView = UIImageView()
        userImageView.contentMode = .scaleAspectFill
        userImageView.clipsToBounds = true
        userImageView.backgroundColor = .systemGray3
        userImageView.layer.cornerRadius = 36
        return userImageView
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.textAlignment = .center
        label.textColor = .label
        label.numberOfLines = 1
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userImageView, usernameLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        contentView.backgroundColor = .clear
        contentView.addSubview(containerView)
        containerView.addSubview(stackView)
        
        containerView.snp.makeConstraints { (make) in
            make.width.equalTo(80)
            make.edges.equalToSuperview()
        }
        userImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(72)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    
}
