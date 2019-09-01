//
//  Localizable.swift
//  CoreApp
//
//  Created by Carlos Eduardo Santiago on 30/08/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//

// swiftlint:disable file_length
// swiftlint:disable type_body_length

import Foundation

enum Localizable: String {
    
    // Screens
    case gitUsers
    case gitUserSearchPlaceholder
    case repositories
    
    case webViewParameters
    
    // Error
    case error
    case defaultErrorMessage

    // MARK: - Public Methods

    func localize() -> String {
        return rawValue.localize()
    }
}

