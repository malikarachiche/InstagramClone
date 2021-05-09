//
//  ProfileViewController.swift
//  InstagramClone
//
//  Created by Malik Arachiche on 5/6/21.
//

import UIKit

class ProfileViewController: UIViewController {

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 400
        tableView.showsVerticalScrollIndicator = false
        tableView.register(ProfileBioTableViewCell.self, forCellReuseIdentifier: ProfileBioTableViewCell.reUse)
        tableView.register(ProfilePostGridTableViewCell.self, forCellReuseIdentifier: ProfilePostGridTableViewCell.reUse)
        tableView.sectionFooterHeight = 0.0
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setConstraints()
    }
    
    func setUpView() {
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        navigationItem.title = "sneakernews"
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}

extension ProfileViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        return nil
//    }
//
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0 {
//            return 0
//        } else {
//            return 40
//        }
//    }
}

extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfileBioTableViewCell.reUse, for: indexPath) as! ProfileBioTableViewCell
            cell.numberOfPostsLabel.text = "123"
            cell.numberOfFollowersLabel.text = "3,869"
            cell.numberOfFollowingLabel.text = "3,214"
            cell.nameLabel.text = "Sneaker News"
            cell.businessLabel.text = "Media/News Company"
            cell.bioLabel.text = "The Official Instagram account of SneakerNews.com run by johnbeekim and mryumingwu"
            cell.websiteLabel.text = "linkin.bio/sneakernews/"
            cell.followedByLabel.isHidden = true
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ProfilePostGridTableViewCell.reUse, for: indexPath) as! ProfilePostGridTableViewCell
            return cell
        }
    }
}

extension ProfileViewController: UICollectionViewDelegate {
    
}

extension ProfileViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.reUse, for: indexPath) as! StoryCollectionViewCell
        cell.usernameLabel.text = "Highlight"
        return cell
    }
    
    
}

