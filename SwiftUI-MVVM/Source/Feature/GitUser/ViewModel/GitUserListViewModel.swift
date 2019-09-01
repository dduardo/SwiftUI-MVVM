//
//  GitUserListViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Carlos Eduardo Santiago on 30/08/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//


import SwiftUI
import Combine
final class GitUserListViewModel: ObservableObject {

    // MARK: Output
    @Published private(set) var gitUsers: [GitUser] = []
    @Published var isErrorShown = false
    @Published var errorMessage = ""

    private let gitUserManager: GitUserManagerProtocol?

    init(gitUserManager: GitUserManagerProtocol = GitUserManager()) {
        self.gitUserManager = gitUserManager
    }

    func fetchGitUsers(userName: String) {
        gitUserManager?.fetch(userName: userName, { [weak self] (result) in
            guard let weakSelf = self else { return }
            weakSelf.isErrorShown = false            
            do {
                weakSelf.gitUsers = result
                print(weakSelf.gitUsers)
            } catch {
                debugPrint(error.localizedDescription)
                weakSelf.isErrorShown = true
                weakSelf.errorMessage = Localizable.defaultErrorMessage.localize()
            }
        })
    }
}
