//
//  GitUserListRowViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Carlos Eduardo Santiago on 30/08/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//

import Combine
import Foundation
import UIKit

class GitUserListRowViewModel:  ObservableObject {
    
    // MARK: Output
    @Published private(set) var avatarUser: UIImage = UIImage()
    @Published private(set) var gitUser: GitUser
    @Published var errorMessage = ""

    private let service: GitUserServiceProtocol

    init(gitUser: GitUser, service: GitUserServiceProtocol = GitUserService()) {
        self.service = service
        self.gitUser = gitUser
//        if !gitUser.avatarURL.isEmpty {
//            self.fetchGitAvatarUser(avatarUrl: gitUser.avatarURL)
//        }
    }
    
//    private func fetchGitAvatarUser(avatarUrl: String) {
//        service.fetchGitAvatarUser(avatarUrl: avatarUrl, { [weak self] (result, _) in
//            guard let weakSelf = self else { return }
//            do {
//                let dataResult = try result()
//                weakSelf.avatarUser = dataResult
//            } catch {
//                debugPrint(error.localizedDescription)
//                weakSelf.errorMessage = Localizable.defaultErrorMessage.localize()
//            }
//        })
//    }
}
