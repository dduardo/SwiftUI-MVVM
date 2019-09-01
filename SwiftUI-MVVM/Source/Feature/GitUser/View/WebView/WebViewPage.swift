//
//  WebViewPage.swift
//  SwiftUI-MVVM
//
//  Created by Carlos Eduardo Santiago on 01/09/19.
//  Copyright © 2019 Carlos Eduardo Santiago. All rights reserved.
//

import Foundation
import SwiftUI
import WebKit

struct WebViewPage : UIViewRepresentable {
    var repoName: String
    
    func makeUIView(context: Context) -> WKWebView  {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let url = URL(string: String(format: Localizable.webViewParameters.localize(), ClientConfig.baseWebViewURL, self.repoName)) else { return }

        let req = URLRequest(url: url)
        uiView.load(req)
    }
}
