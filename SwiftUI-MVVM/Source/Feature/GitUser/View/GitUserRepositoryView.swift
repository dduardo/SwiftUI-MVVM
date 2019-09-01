//
//  GitUserRepositoryView.swift
//  SwiftUI-MVVM
//
//  Created by Carlos Eduardo Santiago on 30/08/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//

import Foundation
import SwiftUI

struct GitUserRepositoryView: View {
    @ObservedObject var viewModel: GitUserRepositoryViewModel
    @State var gitUser: GitUser
    
    var body: some View {
            List(viewModel.repositories, id:\.id) { item in
                VStack {
                    NavigationLink(destination: WebViewPage(repoName: item.fullName)) {
                        Text(verbatim: item.fullName)
                    }
                }
            }
            .navigationBarTitle(Text(String(format: "%@ %@", gitUser.login, Localizable.repositories.localize())), displayMode: .inline)
            .onAppear(perform: { self.viewModel.fetchReposByUser(userName: self.gitUser.login) })
    }
}
