//
//  Service.swift
//  SwiftUI-MVVM
//
//  Created by Carlos Eduardo Santiago on 30/08/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//

import Alamofire
import Foundation

typealias GitUserResponsesCallback = (() throws -> GitUsersResponse) -> Void
typealias GitAvatarUserCallback = (() throws -> UIImage) -> Void


//adicionar protocolo para requisição :D
class GitUserService: GitUserServiceProtocol {
    
    /// Fetch User from ther gitHub
    ///
    /// - Parameters:
    ///   - username: String
    ///   - completion: GitUsersCallback
    func fetchUsers(userName: String, _ completion: @escaping GitUserResponsesCallback) {
        Alamofire.request(gitUsersUrl(userName.removeSpaceToBeEncoded()))
            .validate()
            .responseData { (response) in
                debugPrint("All Response Info: \(response)")
                
                switch response.result {
                case .success(let data):
                    guard let response = self.convertToGitUser(data) else { return }
                    completion { response }
                case .failure(let error):
                    completion { throw error }
                }
        }
    }
    
    /// Fetch User Image from gitHub
    ///
    /// - Parameters:
    ///   - username: String
    ///   - completion: GitUsersCallback
    func fetchGitAvatarUser(avatarUrl: String, _ completion: @escaping GitAvatarUserCallback) {
        Alamofire.request(avatarUrl)
            .validate()
            .responseData { (response) in
                debugPrint("All Response IMAGE: \(response)")
                
                switch response.result {
                case .success(let data):
                    completion { self.convertToAvatarUser(data) }
                case .failure(let error):
                    completion { throw error }
                }
        }
    }
    
    
    private func convertToGitUser(_ data: Data) -> GitUsersResponse? {
        let decoder = JSONDecoder()
        return try? decoder.decode(GitUsersResponse.self, from: data)
    }
    
    private func convertToAvatarUser(_ data: Data) -> UIImage {
        return UIImage(data: data) ?? UIImage()
    }
    
    private func gitUsersUrl(_ userName: String) -> String {
        return "https://api.github.com/search/users?q=\(userName)"
    }
    
    private func gitAvatarUrl(_ avatearUrl: String) -> String {
        return avatearUrl
    }
}
