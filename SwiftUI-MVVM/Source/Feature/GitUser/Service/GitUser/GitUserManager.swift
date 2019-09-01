//
//  GitUserManager.swift
//  SwiftUI-MVVM
//
//  Created by Carlos Eduardo Santiago on 30/08/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//

import Foundation

class GitUserManager: GitUserManagerProtocol {
    
    // MARK: - Properties

    private let group = DispatchGroup()
    private let service: GitUserServiceProtocol?
    
    // MARK: - Initializers

    init(service: GitUserServiceProtocol = GitUserService()) {
        self.service = service
    }
    
    // MARK: - Public methods

    func fetch(userName: String, _ completion: @escaping ([GitUser]) -> Void) {
        var gitUsers: [GitUser] = []
        
        service?.fetchUsers(userName: userName, { [weak self] (result) in
            guard let weakSekf = self else { return }
            do {
                let dataResult = try result()
                gitUsers = dataResult.items
                
                // TODO improve loop performance
                // gitUsers.filter({$0.id == gitUser.id}).forEach { $0.avatar = dataResult }
                for item in gitUsers {
                    weakSekf.group.enter()
                    weakSekf.service?.fetchGitAvatarUser(avatarUrl: item.avatarURL, { (result) in
                        do {
                            item.avatar = try result()                            
                            debugPrint(dataResult)
                        } catch {
                            debugPrint(error.localizedDescription)
                        }
                        weakSekf.group.leave()
                    })
                }
                
                weakSekf.group.notify(queue: .main, execute: {
                    debugPrint(gitUsers)
                    completion(gitUsers)
                })
                
            } catch {
                debugPrint(error.localizedDescription)
            }
        })
    }
}
