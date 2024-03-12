//
//  Row.swift
//  Reeder
//
//  Created by niein on 2024/3/12.
//

import SwiftUI

struct Row: View {
    var article: Article
    @EnvironmentObject var motion: MotionManager
    
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
        .scaleEffect(max(1, (0.7 + -motion.y * 0.45)))
    }
}

//#Preview {
//    Row()
//}
