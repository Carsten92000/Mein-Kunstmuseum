//
//  ArtDetailView.swift
//  Kunstmuseum
//
//  Created by Carsten Jahn on 17.09.24.
//

import SwiftUI

struct ArtDetailView: View {
    
    @EnvironmentObject var object: ArtViewModel
    
    let artObject: ArtObject
    
    var body: some View {
        HStack{
            Text("Favorit")
            Button {
                
                if object.isFavorite == false {
                    object.addFavorite(for: artObject)
                } else {
                    object.removeFavorite(for: artObject)
                }
                object.isFavorite.toggle()
            } label: {
                Text(object.isFavorite ? Image(systemName: "heart.fill") :  Image(systemName:"heart"))
                    .tint(.red)
            }
        } // ende HStack
        
        ScrollView {
            NavigationStack {
                let url = artObject.primaryImage
                
                AsyncImage(url: URL(string:url)) { image in
                    image
                        .resizable()
                        .frame(width: 300, height: 300)
                        .scaledToFill()
                        .clipShape(.rect(cornerRadius: 12))
                } placeholder: {
                    Image(systemName: "camera")
                    Text("Kein Bild vorhanden")
                        .fontDesign(.serif)
                        .foregroundStyle(.red)
                } // ende AsyncImage
                
                Text(artObject.title)
                    .fontDesign(.serif)
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .padding()
                Text("Künstler/in:")
                    .fontDesign(.serif)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                Text(artObject.artistDisplayName)
                    .detailExtension()
                if artObject.artistDisplayName == "" {
                    Text("Keine Angabe Verfügbar")
                }
                
                Text("Lebte von - bis:")
                Text(artObject.artistDisplayBio)
                    .detailExtension()
                if artObject.artistDisplayBio == "" {
                    Text("Keine Angabe Verfügbar")
                }
                
                Text("Erstellungsjahr des Kunstwerkes:")
                Text(artObject.objectDate)
                    .detailExtension()
                if artObject.objectDate == "" {
                    Text("Keine Angabe Verfügbar")
                }
                
                Text("Verwendete Materialien:")
                Text(artObject.medium)
                    .detailExtension()
                if artObject.medium == "" {
                    Text("Keine Angabe Verfügbar")
                }
                
                Text("Herkunftsland: ")
                Text(artObject.culture)
                    .detailExtension()
                if artObject.culture == "" {
                    Text("Keine Angabe Verfügbar")
                }
            }
            .navigationTitle("Detail Ansicht")
        } // ende NavigationStack
        // } // ende ScrollView
        .padding()
        .onAppear {
            object.isToggledFavorit(for: artObject)
        } // ende onAppear
    } // ende body
} // ende struct

#Preview {
    ArtDetailView(artObject: ArtObject(objectID: 1, title: "", artistDisplayName: "", primaryImage: "", artistDisplayBio: "", objectDate: "", medium: "", culture: ""))
}
