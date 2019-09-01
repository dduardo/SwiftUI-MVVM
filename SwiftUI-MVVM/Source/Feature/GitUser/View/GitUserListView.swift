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
    @ObservedObject var gitUserListViewModel: GitUserListViewModel
    @State var searchTextField: String = ""

    var body: some View {
        VStack {
            NavigationView {
                List {
                    HStack {
                        TextField("Search Users", text: $searchTextField)
                        .padding(.all)

                        Button(action: {
                            if self.searchTextField.count > 0 {
                                self.gitUserListViewModel.fetchGitUsers(userName: self.searchTextField)
                            }
                        }) {
                            Image(systemName: "magnifyingglass")
                        }
                    }

                    ForEach(self.gitUserListViewModel.gitUsers, id: \.id) { gitUser in
                        GitUserListRowView(gitUser: gitUser)                        
                    }
                        
                    .alert(isPresented: $gitUserListViewModel.isErrorShown, content: { () -> Alert in
                        Alert(title: Text("Error"), message: Text(gitUserListViewModel.errorMessage))
                    })
                    
                }
                .navigationBarTitle(Text("GitUsers"))
            }
        }
    }
}
