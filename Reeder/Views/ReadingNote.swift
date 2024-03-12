//
//  ReadingNote.swift
//  Reeder
//
//  Created by rokcso on 2024/3/12.
//

import SwiftUI

struct ReadingNote: View {
//    @Binding var darkMode: Bool
    
    var body: some View {
        NavigationView {
            VStack {
                Link(destination: URL(string: "https://www.rokcso.com")!, label: {
                    RoundButton(text: "Visit rokcso.com", image: "safari")
                })
                NoteEntryAndList()
                Spacer()
            }
            .navigationTitle("Notes")
            .toolbar {
//                Setting(darkMode: $darkMode)
            }
        }
    }
}

//#Preview {
//    ReadingNote()
//}
