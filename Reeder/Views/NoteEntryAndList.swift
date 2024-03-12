//
//  NoteEntryAndList.swift
//  Reeder
//
//  Created by rokcso on 2024/3/12.
//

import SwiftUI

struct NoteEntryAndList: View {
    @State var titleInput: String = ""
    @State var contentInput: String = ""
    @StateObject var noteData = TabNoteData()
    
    var body: some View {
        VStack {
            // 创建笔记
            VStack {
                VStack {
                    TextField("Title", text: $titleInput)
                    TextField("Content", text: $contentInput)
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack {
                    Spacer()
                    Button(action: {
                        let newNote = Note(id: UUID(), title: titleInput, content: contentInput)
                        noteData.notes.append(newNote)
                        noteData.saveNotes()
                        titleInput = ""
                        contentInput = ""
                    }, label: {
                        RoundButton(text: "Save", image: "note.text.badge.plus")
                    })
                }
            }
            .padding()
            .background(Color.init(.sRGB, white: 0.9, opacity: 0.2))
            .cornerRadius(10)
            .shadow(radius: 3)
            .padding()
            
            // 已有笔记列表
            VStack {
                List {
                    ForEach(noteData.notes) {
                        note in
                        VStack(alignment: .leading, spacing: 10) {
                            Text(note.title)
                                .font(.title)
                                .bold()
                            Text(note.content)
                        }
                    }
                    .onDelete(perform: { indexSet in
                        noteData.notes.remove(atOffsets: indexSet)
                        noteData.saveNotes()
                    })
                }
                .listStyle(InsetGroupedListStyle())
            }
        }
    }
}

#Preview {
    NoteEntryAndList()
}
