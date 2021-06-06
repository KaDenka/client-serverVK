//
//  APIRequests.swift
//  client-serverVK
//
//  Created by Denis Kazarin on 06.06.2021.
//

import Foundation
import Alamofire


class APIRequests {
    
    let baseUrl = "https://api.vk.com/method"
    
    let token = Session.shared.authorizedToken
    
    let clientId = "7873298"
    
    let version = "5.131"
    
    func getFriends(completion: @escaping([User])->()) {
        AF.request("\(baseUrl)/friends.get?fields=online,photo_50,nickname&access_token=\(Session.shared.authorizedToken)&v=\(version)").responseData { response in
            guard let data = response.value else {return}
            
            guard let friendsResponse = try? JSONDecoder().decode(Friends.self, from: data) else {return}
            
            let friends = friendsResponse.response.items
            
            DispatchQueue.main.async {
                completion(friends)
            }
        }
    }
    
    
    func getGroups(completion: @escaping([GroupElement])->()) {
        AF.request("\(baseUrl)/groups.get?extended=1&filter=groups&access_token=\(Session.shared.authorizedToken)&v=\(version)").responseData{ response in
            guard let data = response.value else {return}
            
            guard let groupsResponse = try? JSONDecoder().decode(Groups.self, from: data) else {return}
            
            let groupsList = groupsResponse.response.items
            
            DispatchQueue.main.async {
                completion(groupsList)
            }
        }
    }
    
    func getPhotos(completion: @escaping([Item])->()) {
        AF.request("\(baseUrl)/photos.get?album_id=wall&rev=0&access_token=\(Session.shared.authorizedToken)&v=\(version)").responseData{ response in
            guard let data = response.value else { return }
            
            guard let photoResponse = try? JSONDecoder().decode(Photos.self, from: data) else {return}
            
            let photosCollection = photoResponse.response.items
            
            DispatchQueue.main.async {
               completion(photosCollection)
            }
        }
    }
   
}
