//
//  ArtListView.swift
//  Kunstmuseum
//
//  Created by Carsten Jahn on 16.09.24.
//

import SwiftUI

struct ArtListView: View {
    
 //   @StateObject private var artViewModel = ArtViewModel()
    @EnvironmentObject var artViewModel: ArtViewModel
    
    var body: some View {
        VStack {
            NavigationStack {
                List(artViewModel.artObjects) { viewArt in
                    NavigationLink(destination: ArtDetailView(artObject: viewArt)) {
                        VStack {
                            let url = viewArt.primaryImage
                            HStack{
                                AsyncImage(url: URL(string:url)) { image in
                                    image
                                        .resizable()
                                        .frame(width: 300, height: 300)
                                        .scaledToFill()
                                        .clipShape(.rect(cornerRadius: 12))
                                } placeholder: {
                                    Image(systemName: "camera")
                                    Text("Keine Vorschau vorhanden")
                                        .fontDesign(.serif)
                                        .foregroundStyle(.red)
                                } // ende AsyncImage
                            } // ende HStack
                            Text(viewArt.title)
                                .fontDesign(.serif)
                                .font(.title)
                                .fontWeight(.semibold)
                                .foregroundStyle(.blue)
                            Text(viewArt.artistDisplayName)
                                .fontDesign(.serif)
                                .font(.title2)
                                .fontWeight(.medium)
                                .foregroundStyle(.black)
                        } // ende VStack
                        
                        } // ende NavigationLink
                    } // ende ForEach
                .navigationTitle("Kunstwerke")
            } // ende NavigationStack
        } // ende Vstack
        .task {
            artViewModel.fetchArt()
        }
    } // ende body
} // ende struct

#Preview {
    ArtListView()
       .environmentObject(ArtViewModel())
}
