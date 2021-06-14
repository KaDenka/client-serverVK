//
//  Photos.swift
//  client-serverVK
//
//  Created by Denis Kazarin on 06.06.2021.
//

import Foundation
import RealmSwift

class Photo: Object, Codable {
    @objc dynamic var photoUrl = ""
    
    enum PhotoResponseKeys: String, CodingKey {
        case items = "items"
    }
    
    enum PhotoItemsKeys: String, CodingKey {
        case sizes = "sizes"
    }
    
    enum SizesKeys: String, CodingKey {
        case url = "url"
    }
    
    convenience required init(from decoder: Decoder) throws {
        self.init()
        let values = try decoder.container(keyedBy: PhotoResponseKeys.self)
        let itemsValues = try values.nestedContainer(keyedBy: PhotoItemsKeys.self, forKey: .items)
        let photoCollectionValues = try itemsValues.nestedContainer(keyedBy: SizesKeys.self, forKey: .sizes)
        self.photoUrl = try photoCollectionValues.decode(String.self, forKey: .url)
        
        
        
    }
}

struct PhotosRequestAnswer: Codable {
    let photosRequestAnswer: PhotoItems
}

struct PhotoItems: Codable {
    let photoItems: [PhotoCollection]
}

struct PhotoCollection: Codable {
    let photoSizes: [Photo]
}

