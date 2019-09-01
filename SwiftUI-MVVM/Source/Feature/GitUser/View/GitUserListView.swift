//
//  GitUserListView.swift
//  SwiftUI-MVVM
//
//  Created by Carlos Eduardo Santiago on 30/08/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//

import Foundation
import SwiftUI

struct GitUserListView: View {
    private let KIconSearch = "magnifyingglass"
    
    @ObservedObject var gitUserListViewModel: GitUserListViewModel
    @State var searchTextField: String = ""

    var body: some View {
        VStack {
            NavigationView {
                List {
                    HStack {
                        TextField(Localizable.gitUserSearchPlaceholder.localize(), text: $searchTextField)
                        .padding(.all)

                        Button(action: {
                            if self.searchTextField.count > 0 {
                                self.gitUserListViewModel.fetchGitUsers(userName: self.searchTextField)
                            }
                        }) {
                            Image(systemName: self.KIconSearch)
                        }
                    }

                    ForEach(self.gitUserListViewModel.gitUsers, id: \.id) { gitUser in
                        GitUserListRowView(gitUser: gitUser)                        
                    }
                        
                    .alert(isPresented: $gitUserListViewModel.isErrorShown, content: { () -> Alert in
                        Alert(title: Text(Localizable.error.localize()), message: Text(gitUserListViewModel.errorMessage))
                    })
                    
                }
                .navigationBarTitle(Text(Localizable.gitUsers.localize()))
            }
        }
    }
}
