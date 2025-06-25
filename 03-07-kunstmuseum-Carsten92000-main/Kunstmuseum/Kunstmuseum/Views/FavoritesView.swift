//
//  FavoritesView.swift
//  Kunstmuseum
//
//  Created by Carsten Jahn on 17.09.24.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoriteViewModel: ArtViewModel
    
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    ForEach(favoriteViewModel.favoriteObjects) { favorites in
                        HStack {
                            let url = favorites.primaryImage
                            
                            AsyncImage(url: URL(string:url)) { image in
                                image
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .scaledToFill()
                                    .clipShape(.rect(cornerRadius: 12))
                            } placeholder: {
                                Image(systemName: "camera")
                                Text("Kein Bild vorhanden")
                                    .fontDesign(.serif)
                                    .foregroundStyle(.red)
                            } // ende AsyncImage
                            
                            VStack {
                                Text(favorites.title)
                                    .font(.headline)
                                Text(favorites.artistDisplayName)
                                    .font(.subheadline)
                            } // ende VStack
                        } // ende HStack
                    } // ende ForEach
                } // ende List
                .padding()
                .background(.gray.opacity(0.3))
                .clipShape(.rect(cornerRadius: 12))
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("Meine Favoriten")
                            .truncationMode(.middle)
                            .font(.title)
                    } // ende ToolbarItem
                } // ende Toolbar
                
            } // ende NavigationStack
        } // ende VStack
        
    } // ende body
} // ende struct

#Preview {
    FavoritesView()
        .environmentObject(ArtViewModel())
}
