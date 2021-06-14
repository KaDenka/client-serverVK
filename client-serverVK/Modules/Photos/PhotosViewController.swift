//
//  PhotosViewController.swift
//  client-serverVK
//
//  Created by Denis Kazarin on 06.06.2021.
//

import UIKit

class PhotosViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let apiService = APIRequests()
    
    var photos: [Photo] = []
    
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
            for image in photo {
                guard let image = image.photoSizes.first else {return}
                self.photos.append(image)
            }
            self.collectionView.reloadData()
        }
        
    }
    
    
    //MARK: CollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCell", for: indexPath) as! PhotoCollectionViewCell
        
        let image = photos[indexPath.row]
        let imageUrl = image.photoUrl
        
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
