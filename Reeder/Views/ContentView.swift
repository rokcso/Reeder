//
//  ContentView.swift
//  Reeder
//
//  Created by niein on 2024/3/12.
//

import SwiftUI

// View
struct ContentView: View {
    @StateObject var data = TabReadingData()
    @AppStorage("darkMode") var darkMode = false
    
    var body: some View {
        NavigationView {
            List(data.articles) { article in
                NavigationLink(destination: Detail(article: article, darkMode: $darkMode)) {
                    Row(article: article)
                }
            }
            .navigationTitle("Today")
            .toolbar {
                Setting(darkMode: $darkMode)
            }
        }
        .preferredColorScheme(darkMode ? .dark : .light)
    }
}

//#Preview {
//    ContentView()
//}


