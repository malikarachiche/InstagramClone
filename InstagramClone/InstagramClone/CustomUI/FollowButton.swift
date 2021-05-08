//
//  FollowButton.swift
//  InstagramClone
//
//  Created by Malik Arachiche on 5/8/21.
//

import UIKit

class FollowButton: UIButton {
    
    var isFollowing: Bool = false {
        didSet {
            setUpButton()
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpButton()
    }
    
    func setUpButton() {
        if isFollowing {
            tintColor = .label
            backgroundColor = .clear
            layer.borderWidth = 0.25
            layer.borderColor = UIColor.label.cgColor
            setTitle("Following", for: .normal)
        } else {
            tintColor = .white
            backgroundColor = .systemBlue
            setTitle("Follow", for: .normal)
        }
        titleLabel?.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 15)
        layer.cornerRadius = 5
    }
}
