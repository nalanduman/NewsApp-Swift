//
//  WebService.swift
//  NewsApp
//
//  Created by Nalan Duman on 23.12.2021.
//

import Foundation

class WebService {
    func downloadNews(url: URL, completion: @escaping ([News]?) -> ()) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let newsArray = try? JSONDecoder().decode([News].self, from: data)
                if let newsArray = newsArray {
                    completion(newsArray)
                }
            }
        }.resume()
    }
}
