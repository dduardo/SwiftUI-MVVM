//
//  GitUserListRowView.swift
//  SwiftUI-MVVM
//
//  Created by Carlos Eduardo Santiago on 30/08/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//

import Foundation
import SwiftUI

struct GitUserListRowView: View {
    @State var gitUser: GitUser
    
    var body: some View {
        NavigationLink(destination: GitUserRepositoryView(viewModel: .init(), gitUser: gitUser)) {
            HStack {
                Image(uiImage: gitUser.avatar ?? UIImage())
                    .resizable()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 1))
                    .shadow(radius: 1)
                Text(gitUser.login)
            }
        }
    }
}
