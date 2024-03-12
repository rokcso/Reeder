//
//  Row.swift
//  Reeder
//
//  Created by niein on 2024/3/12.
//

import SwiftUI

struct Row: View {
    var article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title)
                .font(.title)
                .bold()
                .padding(.bottom, 3)
            Text(article.body)
                .lineLimit(3)
        }
        .padding()
    }
}

//#Preview {
//    Row()
//}
