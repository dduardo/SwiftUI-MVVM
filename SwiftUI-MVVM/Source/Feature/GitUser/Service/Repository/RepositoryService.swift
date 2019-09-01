//
//  RepositoryService.swift
//  SwiftUI-MVVM
//
//  Created by Carlos Eduardo Santiago on 30/08/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//

import Alamofire
import Foundation

typealias ReposByUserCallback = (() throws -> [SearchRepositoryResponse]) -> Void

class RepositoryService: RepositoryServiceProtocol {        
    
    /// Fetch  Reposotories from gitHub
    ///
    /// - Parameters:
    ///   - username: String
    ///   - completion: GitUsersCallback
    func fetchReposByUser(userName: String, _ completion: @escaping ReposByUserCallback) {
        debugPrint(gitUserRepos(userName.removeSpaceToBeEncoded()))
        Alamofire.request(gitUserRepos(userName.removeSpaceToBeEncoded()))
            .validate()
            .responseData { (response) in
                debugPrint("Look the Repo: \(response)")
                
                switch response.result {
                case .success(let data):
                    guard let response = self.convertToRepos(data) else { return }
                    debugPrint(response)
                    completion { response }
                case .failure(let error):
                    completion { throw error }
                }
        }
    }
    
    private func convertToRepos(_ data: Data) -> [SearchRepositoryResponse]? {
        let decoder = JSONDecoder()
        debugPrint(data[0])
        return try? decoder.decode([SearchRepositoryResponse].self, from: data)
    }
    
    private func gitUserRepos(_ userName: String) -> String {
         return "https://api.github.com/users/\(userName)/repos"
     }
}
