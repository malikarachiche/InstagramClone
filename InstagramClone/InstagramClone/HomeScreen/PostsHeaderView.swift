//
//  PostsHeaderView.swift
//  InstagramClone
//
//  Created by Malik Arachiche on 5/6/21.
//

import UIKit

class PostsHeaderView: UIView {
    
    var profileAction: (() -> Void)?
    var subtitleAction: (() -> Void)?
    var optionsAction: (() -> Void)?
    
    lazy var imageView: UIImageView = {
        let imageGR = UITapGestureRecognizer(target: self, action: #selector(profileTapped))
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = .systemGray3
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(imageGR)
        return imageView
    }()
    
    lazy var usernameLabel: UILabel = {
        let labelGR = UITapGestureRecognizer(target: self, action: #selector(profileTapped))
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .label
        label.font = UIFont(name: HelveticaFont.medium, size: 16)
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(labelGR)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let labelGR = UITapGestureRecognizer(target: self, action: #selector(subtitleTapped))
        let label = UILabel()
        label.textAlignment = .left
        label.textColor = .label
        label.font = UIFont(name: HelveticaFont.regular, size: 13)
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(labelGR)
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
        button.addTarget(self, action: #selector(optionsTapped), for: .touchUpInside)
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
    
    @objc func profileTapped() { profileAction?() }
    @objc func subtitleTapped() { subtitleAction?() }
    @objc func optionsTapped() { optionsAction?() }
}
