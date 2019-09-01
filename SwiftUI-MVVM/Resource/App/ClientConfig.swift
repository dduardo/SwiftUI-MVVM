//
//  ClientConfig.swift
//  CoreApp
//
//  Created by Carlos Eduardo Santiago on 30/08/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//

import Foundation

struct ClientConfig {
    
    // MARK: URLs
    static let baseURL: String = {
        return "https://api.github.com"
    }()
    
    static let baseWebViewURL: String = {
       return "https://github.com"
    }()
    
     // MARK: Users
    
    static let Users: String = {
        return "users"
    }()
    
     // MARK: repositories
    
    static let Repositories: String = {
        return "repositories"
    }()
    
    // MARK: Search
    
    static let Search: String = {
        return "/search/"
    }()
    
    static let SearchUsers: String = {
        return Search + Users
    }()
    
    static let SearchRepositories: String = {
        return Search + Repositories
    }()
}
