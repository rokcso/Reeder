//
//  ReederApp.swift
//  Reeder
//
//  Created by niein on 2024/3/12.
//

import SwiftUI
// 因为需要使用 LocalAuthentication 来锁定整个 App，所以放在程序最顶层入口
import LocalAuthentication

@main
struct ReederApp: App {
    let motionManager = MotionManager()
    @State var locked = false
    
    var body: some Scene {
        WindowGroup {
            Group {
                if locked {
                    Locked(authorize: authorize)
                } else {
                    TabView {
                        ContentView()
                            .environmentObject(motionManager)
                            .tabItem {
                                Label("Reading", systemImage: "books.vertical")
                            }
                        ReadingNote()
                            .tabItem {
                                Label("Notes", systemImage: "note.text")
                            }
                    }
                }
            }
            .onAppear{ authorize() }
        }
    }
    
    func authorize() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Unlock your app") { result, _ in
                if result { locked = false }
            }
        }
    }
}
