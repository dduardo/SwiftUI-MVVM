//
//  GitUserServiceProtocol.swift
//  SwiftUI-MVVM
//
//  Created by Carlos Eduardo Santiago on 30/08/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//

import Foundation

protocol GitUserServiceProtocol {
    func fetchUsers(userName: String, _ completion: @escaping GitUserResponsesCallback)
    func fetchGitAvatarUser(avatarUrl: String, _ completion: @escaping GitAvatarUserCallback)    
}
