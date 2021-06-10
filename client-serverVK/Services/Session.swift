//
//  Session.swift
//  client-serverVK
//
//  Created by Denis Kazarin on 06.06.2021.
//

import Foundation

final class Session {
    
    static let shared = Session()
    
    private init() {}
    
    var authorizedToken = ""
    
}
