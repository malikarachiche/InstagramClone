//
//  ViewController.swift
//  InstagramClone
//
//  Created by Malik Arachiche on 5/6/21.
//

import UIKit
import Firebase
import SnapKit

class HomeViewController: UIViewController {
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        tableView.showsVerticalScrollIndicator = false
        tableView.register(StoriesTableViewCell.self, forCellReuseIdentifier: StoriesTableViewCell.reUse)
        tableView.register(PostsTableViewCell.self, forCellReuseIdentifier: PostsTableViewCell.reUse)
        tableView.sectionFooterHeight = 0.0
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setConstraints()
        createBarButtonItems()
    }
    
    func setUpView() {
        view.addSubview(tableView)
        view.backgroundColor = .systemBackground
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func setConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
    
    func createBarButtonItems() {
        let addPost = UIBarButtonItem(image: UIImage(systemName: "plus.bubble"), style: .plain, target: self, action: #selector(addPostTapped))
        let activity = UIBarButtonItem(image: UIImage(systemName: "heart"), style: .plain, target: self, action: #selector(activityTapped))
        let message = UIBarButtonItem(image: UIImage(systemName: "message"), style: .plain, target: self, action: #selector(messageTapped))
        
        navigationItem.rightBarButtonItems = [message, activity, addPost]
        
        let instagramLogo = UIBarButtonItem(title: "Instagram", style: .plain, target: self, action: #selector(logoTapped))
        instagramLogo.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "Noteworthy-Bold", size: 22)!], for: .normal)
        navigationItem.leftBarButtonItems = [instagramLogo]
        
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    @objc func messageTapped() {
        print("Message tapped")
    }
    
    @objc func activityTapped() {
        print("Activity tapped")
    }
    
    @objc func addPostTapped() {
        print("add post tapped")
    }
    
    @objc func logoTapped() {
        print("Logo tapped")
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView: PostsHeaderView = {
            let view = PostsHeaderView()
            view.usernameLabel.text = "sportscenter"
            view.subtitleLabel.text = "Boston, Massachusetts"
            view.profileAction = { print("Profile tapped") }
            view.subtitleAction = { print("Subtitle tapped") }
            view.optionsAction = { print("Options tapped") }
            return view
        }()
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        } else {
            return 56
        }
    }
    
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: StoriesTableViewCell.reUse) as! StoriesTableViewCell
            cell.collectionView.delegate = self
            cell.collectionView.dataSource = self
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostsTableViewCell.reUse) as! PostsTableViewCell
            cell.likesLabel.text = "592 likes"
            cell.captionLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas ac rhoncus ipsum, et elementum eros."
            cell.viewAllCommentsLabel.text = "View all 29 comments"
            cell.timePostedLabel.text = "32 minutes ago"
            cell.likeLabelAction = { [weak self] in self?.navigationController?.pushViewController(LikesViewController(), animated: true) }
            cell.likeAction = { print("Like tapped") }
            cell.commentAction = { print("Comment tapped") }
            cell.shareAction = { print("Share tapped") }
            cell.saveAction = { print("Save tapped") }
            return cell
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StoryCollectionViewCell.reUse, for: indexPath) as! StoryCollectionViewCell
        
        if indexPath.row == 0 {
            // user's own account
            cell.usernameLabel.text = "Your Story"
        } else {
            cell.usernameLabel.text = "fro_fro23"
        }
        cell.storyAction = { print("Story at index \(indexPath.row) tapped")}
        return cell
    }
    
    
}

