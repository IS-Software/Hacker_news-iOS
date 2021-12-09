//
//  DetailView.swift
//  Hacker_news-iOS
//
//  Created by Nikita Gavrilov on 09.12.2021.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.yandex.ru")
    }
}
