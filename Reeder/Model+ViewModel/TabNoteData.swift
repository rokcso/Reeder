//
//  TabNoteData.swift
//  Reeder
//
//  Created by rokcso on 2024/3/12.
//

import Foundation
import SwiftUI

// Model
struct Note: Codable, Identifiable {
    var id: UUID
    var title: String
    var content: String
    var imageURLAppendix: String?
}

// ViewModel
class TabNoteData: ObservableObject {
    @Published var notes = [Note]()
    
    // 获取 App 默认 sandbox 路径
    static let sandboxURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    let notesURL = sandboxURL.appendingPathComponent("notes.json")
    
    init() {
        notes = getNotes()
    }
    
    func getNotes() -> [Note] {
        var result: [Note] = []
        // 判断 notesURL 地址中是否存在任何文件
        if FileManager.default.fileExists(atPath: notesURL.path) {
            let data = try! Data(contentsOf: notesURL)
            result = try! JSONDecoder().decode([Note].self, from: data)
        }
        return result
    }
    
    func saveNotes() {
        DispatchQueue.global(qos: .userInitiated).async {
            let data = try? JSONEncoder().encode(self.notes)
            try? data?.write(to: self.notesURL)
        }
    }
    
    func getImage(_ imageAppendix: String) -> UIImage {
        let url = TabNoteData.sandboxURL.appendingPathComponent(imageAppendix)
        let imageData = try! Data(contentsOf: url)
        return UIImage(data: imageData, scale: 0.5)!
    }
    
    func saveImage(id: UUID, data: Data) {
        DispatchQueue.global(qos: .userInitiated).async {
            let url = TabNoteData.sandboxURL.appendingPathComponent("\(id).png")
            try? data.write(to: url)
        }
    }
}
