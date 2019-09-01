//
//  GitUserManagerProtocol.swift
//  SwiftUI-MVVM
//
//  Created by Carlos Eduardo Santiago on 30/08/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//

import Foundation

protocol GitUserManagerProtocol {
    func fetch(userName: String, _ completion: @escaping ([GitUser]) -> Void)
}
