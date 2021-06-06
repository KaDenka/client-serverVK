//
//  PhotosViewController.swift
//  client-serverVK
//
//  Created by Denis Kazarin on 06.06.2021.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let apiService = APIRequests()
    
    var photos: [Item] = []
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiService.getPhotos { [weak self] photo in
            guard let self = self else { return }
            self.photos = photo
            self.collectionView.reloadData()
        }
        
    }
    
    
    //MARK: CollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! PhotoCollectionViewCell
        
        let image = photos[indexPath.row]
        guard let imageUrl = image.sizes.first?.url else {return cell}
        
        if let url = URL(string: imageUrl) {
            let data = try? Data(contentsOf: url)
            let image = UIImage(data: data!)
            cell.photoImage.image = image
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
}
