//
//  AppDelegate.swift
//  SwiftUI-MVVM
//
//  Created by Carlos Eduardo Santiago on 30/08/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//

import Foundation

extension String {
    
    /// Wrapper method to access Localized string
    ///
    /// - Returns: String from Localizable.strings file
    func localize() -> String {
        return NSLocalizedString(self, tableName: "Localizable", bundle: Bundle.main, value: "", comment: "")
    }
    
    /// Camel Case
    /// - Returns: String in CamelCase format
    func camelCase() -> String {
        return components(separatedBy: CharacterSet.alphanumerics.inverted)
            .filter { !$0.isEmpty }
            .map { $0.capitalized }
            .joined()
    }
    
    func removeSpaceToBeEncoded() -> String {
        return self.replacingOccurrences(of: " ", with: "%20", options: .literal, range: nil)
    }
}
