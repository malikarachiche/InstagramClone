//
//  LikesViewController.swift
//  InstagramClone
//
//  Created by Malik Arachiche on 5/8/21.
//

import UIKit

class LikesViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.showsVerticalScrollIndicator = false
        tableView.register(LikesProfileTableViewCell.self, forCellReuseIdentifier: LikesProfileTableViewCell.reUse)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setConstraints()
    }
    
    func setUpView() {
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        title = "Likes"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension LikesViewController: UITableViewDelegate {
    
}

extension LikesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LikesProfileTableViewCell.reUse, for: indexPath) as! LikesProfileTableViewCell
        return cell
    }
    
    
}
