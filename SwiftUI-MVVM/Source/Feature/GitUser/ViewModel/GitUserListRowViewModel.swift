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

    // MARK: - Properties

    private let service: GitUserServiceProtocol

    // MARK: - Initializers

    init(gitUser: GitUser, service: GitUserServiceProtocol = GitUserService()) {
        self.service = service
        self.gitUser = gitUser
    }
}
