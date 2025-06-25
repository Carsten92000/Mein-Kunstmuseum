//
//  KunstmuseumApp.swift
//  Kunstmuseum
//
//  Created by Carsten Jahn on 16.09.24.
//

import SwiftUI

@main
struct KunstmuseumApp: App {
    @StateObject private var artVM = ArtViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView()
                .environmentObject(artVM)
        }
    }
}
