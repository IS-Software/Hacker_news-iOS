//
//  NetworkManager.swift
//  Hacker_news-iOS
//
//  Created by Nikita Gavrilov on 09.12.2021.
//

import Foundation
import UIKit


class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()
    
    let urlString = "http://hn.algolia.com/api/v1/search?tags=front_page"
    
    func fetchData() {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if error == nil {
                    let decoder = JSONDecoder()
                    if let safeData = data {
                        do {
                            let postData = try decoder.decode(PostData.self, from: safeData)
                            DispatchQueue.main.async {
                                self.posts = postData.hits
                            }
                        } catch {
                            print(error)
                        }
                    }
                }
            }
            task.resume()
        }
    }
}
