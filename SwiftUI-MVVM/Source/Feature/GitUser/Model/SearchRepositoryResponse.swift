//
//  SearchRepositoryResponse.swift
//  SwiftUI-MVVM
//
//  Created by Carlos Eduardo Santiago on 30/08/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//

import Foundation

struct SearchRepositoryResponse: Codable {
    let id: Int
    let nodeID, name, fullName: String
    let searchRepositoryResponsePrivate: Bool
    let owner: GitUser
    let htmlURL: String
    let searchRepositoryResponseDescription: String?
    let defaultBranch: String

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case searchRepositoryResponsePrivate = "private"
        case owner
        case htmlURL = "html_url"
        case searchRepositoryResponseDescription = "description"
        case defaultBranch = "default_branch"
    }
}
