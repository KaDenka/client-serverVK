//
//  FriendsViewController.swift
//  client-serverVK
//
//  Created by Denis Kazarin on 06.06.2021.
//

import UIKit
import SDWebImage


class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var apiService = APIRequests()
    
    var friends: [Friend] = []
    

    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        let group = DispatchGroup()
//
//        group.enter()
        
        apiService.getFriends { [weak self] list in
            guard let self = self else { return }
            self.friends = list
            self.tableView.reloadData()
            
//            group.leave()
        }
        
//        group.notify(queue: .main) { [weak self] in
//            guard let self = self else { return }
//            self.tableView.reloadData()
//        }
       
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let friend = friends[indexPath.row]
        cell.textLabel?.text = "\(friend.firstName) \(friend.lastName)"
        if let url = URL(string: friend.avatarPhoto) {
            let data = try? Data(contentsOf: url)
            let image = UIImage(data: data!)
            cell.imageView?.image = image
        }
        
        //cell.imageView?.sd_setImage(with: URL(string: friend.photo50), placeholderImage: UIImage())
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }

}
