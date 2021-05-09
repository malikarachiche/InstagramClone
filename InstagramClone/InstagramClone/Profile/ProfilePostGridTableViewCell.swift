//
//  ProfilePostGridTableViewCell.swift
//  InstagramClone
//
//  Created by Malik Arachiche on 5/8/21.
//

import UIKit

class ProfilePostGridTableViewCell: UITableViewCell {
    static let reUse = "ProfilePostGridTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUpView() {
        contentView.backgroundColor = .purple
    }

}
