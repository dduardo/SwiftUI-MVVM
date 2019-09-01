//
//  RepositoryServiceProtocol.swift
//  SwiftUI-MVVM
//
//  Created by Carlos Eduardo Santiago on 30/08/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//

import Foundation

protocol RepositoryServiceProtocol {
   func fetchReposByUser(userName: String, _ completion: @escaping ReposByUserCallback)
}
