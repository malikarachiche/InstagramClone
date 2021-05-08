//
//  LikesProfileTableViewCell.swift
//  InstagramClone
//
//  Created by Malik Arachiche on 5/8/21.
//

import UIKit

class LikesProfileTableViewCell: UITableViewCell {
    static let reUse = "LikesProfileTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func setUpView() {
        
    }

}
