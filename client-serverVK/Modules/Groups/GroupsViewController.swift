//
//  GroupsViewController.swift
//  client-serverVK
//
//  Created by Denis Kazarin on 06.06.2021.
//

import UIKit

class GroupsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let apiService = APIRequests()
    
    var groupsList: [GroupElement] = []

    @IBOutlet weak var tableView: UITableView!{
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UserCell")
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiService.getGroups { [weak self] groups in
            guard let self = self else { return }
            self.groupsList = groups
            self.tableView.reloadData()
        }

    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
        let group = groupsList[indexPath.row]
        cell.textLabel?.text = "\(group.name)"
        if let url = URL(string: group.photo200) {
            let data = try? Data(contentsOf: url)
            let image = UIImage(data: data!)
            cell.imageView?.image = image
        }
        
        //cell.imageView?.sd_setImage(with: URL(string: friend.photo50), placeholderImage: UIImage())
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupsList.count
    }

}
