//
//  GitUser.swift
//  SwiftUI-MVVM
//
//  Created by Carlos Eduardo Santiago on 30/08/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Item

class GitUser: Codable {
    var avatar: UIImage? = nil
    let login: String
    let id: Int
    let avatarURL: String
    let gravatarID: String
    let url, htmlURL, followersURL: String
    let followingURL, gistsURL, starredURL: String
    
    enum CodingKeys: String, CodingKey {
         case login, id
         case avatarURL = "avatar_url"
         case gravatarID = "gravatar_id"
         case url
         case htmlURL = "html_url"
         case followersURL = "followers_url"
         case followingURL = "following_url"
         case gistsURL = "gists_url"
         case starredURL = "starred_url"
     }
}
