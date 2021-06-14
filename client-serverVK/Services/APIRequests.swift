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
    
    func getFriends(completion: @escaping([Friend])->()) {
        AF.request("\(baseUrl)/friends.get?fields=online,photo_50,nickname&access_token=\(Session.shared.authorizedToken)&v=\(version)").responseData { response in
            guard let data = response.value else {return}
            
            guard let friendsResponse = try? JSONDecoder().decode(FriendsRequestAnswer.self, from: data) else { print("Not decoded"); return }
            
            
            let friends = friendsResponse.friendsRequestAnswer.friendsList
            
            DispatchQueue.main.async {
                completion(friends)
            }
        }
    }
    
    
    func getGroups(completion: @escaping([Group])->()) {
        AF.request("\(baseUrl)/groups.get?extended=1&filter=groups&access_token=\(Session.shared.authorizedToken)&v=\(version)").responseData{ response in
            guard let data = response.value else {return}
            
            guard let groupsResponse = try? JSONDecoder().decode(GroupsRequestAnswer.self, from: data) else {return}
            
            let groups = groupsResponse.groupsRequestAnswer.groupsList
            
            DispatchQueue.main.async {
                completion(groups)
            }
        }
    }
    
    func getPhotos(completion: @escaping([PhotoCollection])->()) {
        AF.request("\(baseUrl)/photos.get?album_id=wall&rev=0&access_token=\(Session.shared.authorizedToken)&v=\(version)").responseData{ response in
            guard let data = response.value else { return }
            
            guard let photoResponse = try? JSONDecoder().decode(PhotosRequestAnswer.self, from: data) else {return}
            
            let photoCollection = photoResponse.photosRequestAnswer.photoItems
            
            
            DispatchQueue.main.async {
               completion(photoCollection)
            }
        }
    }
   
}
