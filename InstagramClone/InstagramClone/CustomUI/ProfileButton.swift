//
//  ProfileButton.swift
//  InstagramClone
//
//  Created by Malik Arachiche on 5/9/21.
//

import UIKit

class ProfileButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpButton()
    }
    
    func setUpButton() {
        setTitleColor(.label, for: .normal)
        tintColor = .label
        backgroundColor = .clear
        layer.borderWidth = 0.25
        layer.borderColor = UIColor.label.cgColor
        titleLabel?.font = UIFont(name: HelveticaFont.medium, size: 14)
        layer.cornerRadius = 5
    }

}
