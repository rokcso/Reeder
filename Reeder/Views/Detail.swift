//
//  Detail.swift
//  Reeder
//
//  Created by niein on 2024/3/12.
//

import SwiftUI

struct Detail: View {
    var article: Article
    @Binding var darkMode: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(article.body)
            }
            .padding()
        }
        .navigationTitle(article.title)
        .toolbar {
            Setting(darkMode: $darkMode)
        }
    }
}

//#Preview {
//    Detail()
//}
