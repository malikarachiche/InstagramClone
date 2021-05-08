//
//  StoryCollectionViewCell.swift
//  InstagramClone
//
//  Created by Malik Arachiche on 5/6/21.
//

import UIKit

class StoryCollectionViewCell: UICollectionViewCell {
    static let reUse = "StoryCollectionViewCell"
    
    var storyAction: (() -> Void)?
    
    lazy var userImageView: UIImageView = {
        let imageGR = UITapGestureRecognizer(target: self, action: #selector(storyTapped))
        let userImageView = UIImageView()
        userImageView.contentMode = .scaleAspectFill
        userImageView.clipsToBounds = true
        userImageView.backgroundColor = .systemGray3
        userImageView.layer.cornerRadius = 36
        userImageView.isUserInteractionEnabled = true
        userImageView.addGestureRecognizer(imageGR)
        return userImageView
    }()
    
    lazy var usernameLabel: UILabel = {
        let labelGR = UITapGestureRecognizer(target: self, action: #selector(storyTapped))
        let label = UILabel()
        label.font = label.font.withSize(12)
        label.textAlignment = .center
        label.textColor = .label
        label.numberOfLines = 1
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(labelGR)
        return label
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userImageView, usernameLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillProportionally
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
        contentView.addSubview(stackView)
        
        userImageView.snp.makeConstraints { (make) in
            make.height.width.equalTo(72)
        }
        
        stackView.snp.makeConstraints { (make) in
            make.leading.equalTo(8)
            make.trailing.equalTo(-8)
            make.top.bottom.equalToSuperview()
        }
    }
    
    @objc func storyTapped() { storyAction?() }
}
