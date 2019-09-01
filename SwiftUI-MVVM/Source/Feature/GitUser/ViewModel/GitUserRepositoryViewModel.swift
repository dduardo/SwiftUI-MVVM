//
//  GitUserRepositoryViewModel.swift
//  SwiftUI-MVVM
//
//  Created by Carlos Eduardo Santiago on 30/08/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//

import Combine
import Foundation

class GitUserRepositoryViewModel:  ObservableObject {
    
    // MARK: Output
    
    @Published private(set) var repositories: [SearchRepositoryResponse] = []
    @Published var errorMessage = ""
    
    // MARK: - Properties
    
    private let repositoryService: RepositoryServiceProtocol?
    
    // MARK: - Initializers
    
    init( repositoryService: RepositoryServiceProtocol = RepositoryService()) {
        self.repositoryService = repositoryService
    }
    
    // MARK: - Public methods

    func fetchReposByUser(userName: String) {
        repositoryService?.fetchReposByUser(userName: userName, { [weak self] (result) in
            guard let weakSelf = self else { return }
            do {
                let dataResult = try result()
                weakSelf.repositories = dataResult
            } catch {
                debugPrint(error.localizedDescription)
                weakSelf.errorMessage = Localizable.defaultErrorMessage.localize()
            }
        })
    }
}

