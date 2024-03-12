//
//  Setting.swift
//  Reeder
//
//  Created by niein on 2024/3/12.
//

import SwiftUI

struct Setting: View {
    @Binding var darkMode: Bool
    
    var body: some View {
        Button(action: {
            Vibration.selection.vibrate()
            darkMode.toggle()
        }, label: {
            Image(systemName: darkMode ? "sun.max.fill" : "moon.fill")
                .font(.system(.headline, design: .rounded))
        })
    }
}

//#Preview {
//    Setting()
//}
