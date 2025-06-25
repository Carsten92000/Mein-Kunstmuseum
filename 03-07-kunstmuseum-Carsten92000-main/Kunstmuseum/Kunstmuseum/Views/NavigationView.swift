//
//  TwoTabs.swift
//  Kunstmuseum
//
//  Created by Carsten Jahn on 16.09.24.
//

import SwiftUI

struct NavigationView: View {
    
    var body: some View {
        VStack {
            TabView {
                ArtListView()
                    .tabItem {
                        Label("Kunstwerke", systemImage: "paintbrush.fill")
                    }
                
                FavoritesView()
                    .tabItem {
                        Label("Favoriten", systemImage: "heart.fill")
                    }
                
                SovenirShopView()
                    .tabItem{
                        Label("Shop", systemImage: "cart")
                    }
            } // ende TabView
        } // ende VStack
    } // ende body
} // ende struct

#Preview {
    NavigationView()
        .environmentObject(ArtViewModel())
}
