//
//  WebView.swift
//  Hacker_news-iOS
//
//  Created by Nikita Gavrilov on 09.12.2021.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context) -> some UIView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                let webView = uiView as! WKWebView
                webView.load(request)
            }
        }
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some UIViewRepresentable {
        WebView(urlString: "https://www.yandex.ru")
    }
}
