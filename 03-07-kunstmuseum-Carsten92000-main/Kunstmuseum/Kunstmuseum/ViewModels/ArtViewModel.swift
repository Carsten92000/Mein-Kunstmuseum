//
//  ArtViewModel.swift
//  Kunstmuseum
//
//  Created by Carsten Jahn on 16.09.24.
//

import SwiftUI

class ArtViewModel: ObservableObject {
   
    @Published var artObjects: [ArtObject] = []
    @Published var favoriteObjects: [ArtObject] = []
    @Published var isFavorite = false
    
    @MainActor
    func fetchArt() {
        Task {
            do {
                guard let objectIds = try await getArtObjects().objectIDs else { return }
                
                for id in objectIds {
                    let artObject = try await fetchArtObjectDetails(for: id)
                    self.artObjects.append(artObject)
                }
            } catch let error as HTTPError {
                print(error.message)
            } catch {
                print(error)
            }
        }
    }
    
    private func getArtObjects() async throws -> ArtObjectResponse {
        let urlString = "https://collectionapi.metmuseum.org/public/collection/v1/search?isHighlight=true&q=sunflowers"
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(ArtObjectResponse.self, from: data)
    }
    
    private func fetchArtObjectDetails(for objectId: Int) async throws -> ArtObject {
        let urlString = "https://collectionapi.metmuseum.org/public/collection/v1/objects/\(objectId)"
        
        guard let url = URL(string: urlString) else {
            throw HTTPError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        return try JSONDecoder().decode(ArtObject.self, from: data)
        }
        
    // Funktion zur Markierung eines Kunstobjekts als Favorit anhand seiner ID
    func addFavorite(for artObject: ArtObject) {
        favoriteObjects.append(artObject)
    }

    // Funktion zur Löschung eines Kunstobjekts aus der Favoritenliste anhand seiner ID
    func removeFavorite(for artObject: ArtObject) {
        let index = favoriteObjects.firstIndex(where: { $0.objectID == artObject.id })!
        favoriteObjects.remove(at: index)
    }
    
    // Funktion zum überprüfen ob das Kunstobjekt bereits ein Favorit ist oder nicht
    func isToggledFavorit(for artObject: ArtObject) {
        isFavorite = favoriteObjects.contains(where: { $0.objectID == artObject.id})
    }
}

