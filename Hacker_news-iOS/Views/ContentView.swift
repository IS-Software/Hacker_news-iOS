//
//  ContentView.swift
//  Hacker_news-iOS
//
//  Created by Nikita Gavrilov on 09.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            ZStack {
                if networkManager.posts.isEmpty {
                    ProgressView()
                } else {
                    List.init(networkManager.posts) { post in
                        PostCell(
                            points: post.points,
                            title: post.title,
                            url: post.url
                        )
                    }
                }
            }
            .listStyle(.inset)
            .navigationTitle("Hacker news")
        }
        .onAppear { self.networkManager.fetchData() }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
