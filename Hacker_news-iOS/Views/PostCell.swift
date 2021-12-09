//
//  PostCell.swift
//  Hacker_news-iOS
//
//  Created by idStorm on 09.12.2021.
//

import SwiftUI

struct PostCell: View {
    
    let points: Int
    let title: String
    let url: String?
    
    var body: some View {
        NavigationLink(destination: DetailView(url: url)) {
            HStack {
                Text("\(points)")
                Text(title)
            }
        }
    }
}

struct PostCell_Previews: PreviewProvider {
    static var previews: some View {
        PostCell(points: 0, title: "Post title", url: nil)
    }
}
