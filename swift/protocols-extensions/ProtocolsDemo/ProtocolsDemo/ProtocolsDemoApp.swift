//
//  ProtocolsDemoApp.swift
//  ProtocolsDemo
//
//  Created by Bhanu Pratap on 23/12/2025.
//

import SwiftUI

@main
struct ProtocolsDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear {
                    runDemo()
                }
        }
    }
}


