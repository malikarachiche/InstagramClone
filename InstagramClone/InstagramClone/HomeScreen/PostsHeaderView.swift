//
//  PostsHeaderView.swift
//  InstagramClone
//
//  Created by Malik Arachiche on 5/6/21.
//

import UIKit

class PostsHeaderView: UIView {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray3
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var usernameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .label
        label.font = UIFont(name: "AppleSDGothicNeo-SemiBold", size: 17)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .label
        label.font = UIFont(name: "AppleSDGothicNeo-Regular", size: 14)
        return label
    }()
    
    lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [usernameLabel, subtitleLabel])
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var optionsButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .label
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        setUpView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        backgroundColor = .systemBackground
        addSubview(imageView)
        addSubview(labelStackView)
        addSubview(optionsButton)
        
        imageView.snp.makeConstraints { (make) in
            make.leading.equalTo(8)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(40)
        }
        
        labelStackView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.height.equalTo(imageView.snp.height)
            make.leading.equalTo(imageView.snp.trailing).offset(8)
            make.trailing.equalTo(optionsButton.snp.leading).offset(-8)
        }
        
        optionsButton.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.height.equalTo(imageView.snp.height)
            make.trailing.equalTo(-8)
            make.width.equalTo(24)
        }
    }
}
