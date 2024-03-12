//
//  Locked.swift
//  Reeder
//
//  Created by niein on 2024/3/12.
//

import SwiftUI

struct Locked: View {
    let authorize: () -> ()
    
    var body: some View {
        VStack {
            Text("Your app is locked.")
            Image(systemName: "lock.shield")
                .font(.system(.largeTitle, design: .rounded))
//                        .padding(.bottom, 50)
            Button(action: {
                Vibration.light.vibrate()
                authorize()
            }, label: {
                Text("Try unlocking your app again")
                    .bold()
            })
        }
    }
}

//#Preview {
//    Locked()
//}
