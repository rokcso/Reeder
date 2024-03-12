//
//  Data.swift
//  Reeder
//
//  Created by niein on 2024/3/12.
//

import Foundation
import Swift

// 一篇文章的数据结构
// Model
struct Article: Codable, Identifiable {
    var id: Int
    var title: String
    var body: String
}

// 传入 App 的是多篇文章组成的列表
// ViewModel
class Data: ObservableObject {
    @Published var articles = [Article]()
    
//    init(articles: [Article] = [Article]()) {
//        self.articles = articles
//    }
    
    init(articles: [Article] = [Article]()) {
        let url = URL(string: "https://www.legolas.me/s/articles.json")!
        
        URLSession.shared.dataTask(with: url) { (data, resp, error) in
            DispatchQueue.main.sync {
                self.articles = try! JSONDecoder().decode([Article].self, from: data!)
            }
        }.resume()
    }
}
