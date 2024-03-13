//
//  NoteEntryAndList.swift
//  Reeder
//
//  Created by rokcso on 2024/3/12.
//

import SwiftUI
//import ImagePickerView

struct NoteEntryAndList: View {
    @State var titleInput: String = ""
    @State var contentInput: String = ""
    @StateObject var noteData = TabNoteData()
    @State var image: UIImage?
//    @State var showImagePicker: Bool = false
    
    var body: some View {
        VStack {
            // 创建笔记
            VStack {
                HStack {
                    if image != nil {
                        Image(uiImage: image!)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 100, height: 100)
                            .cornerRadius(4)
                    }
                    
                    VStack {
                        TextField("Title", text: $titleInput)
                        TextField("Content", text: $contentInput)
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                }
                HStack {
//                    Button(action: {
//                        showImagePicker.toggle()
//                    }, label: {
//                        RoundButton(text: "Add image", image: "photo")
//                    })
//                    .sheet(isPresented: $showImagePicker, content: {
//                        ImagePickerView(sourceType: .photoLibrary, onImagePicked: {
//                            image in
//                            self.image = image
//                        })
//                    })
                    Spacer()
                    Button(action: {
                        save()
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
                        HStack {
//                            if note.imageURLAppendix != nil {
//                                Image(uiImage: noteData.getImage(note.imageURLAppendix!))
//                                    .resizable()
//                                    .aspectRatio(contentMode: .fill)
//                                    .frame(width: 100, height: 100)
//                                    .cornerRadius(4)
//                            }
                            VStack(alignment: .leading, spacing: 10) {
                                Text(note.title)
                                    .font(.title)
                                    .bold()
                                Text(note.content)
                            }
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
    
    func save() {
        let id = UUID()
        if let data = image?.pngData() {
            noteData.saveImage(id: id, data: data)
        }
        let newNote = Note(id: id, title: titleInput, content: contentInput, imageURLAppendix: image == nil ? nil : "\(id).png")
        noteData.notes.append(newNote)
        noteData.saveNotes()
        titleInput = ""
        contentInput = ""
        image = nil
    }
}

#Preview {
    NoteEntryAndList()
}
