//
//  ArtObject.swift
//  Kunstmuseum
//
//  Created by Carsten Jahn on 16.09.24.
//

import Foundation

struct ArtObject: Codable, Identifiable {
    var id: Int { objectID }
    
    var objectID: Int
    var title: String
    var artistDisplayName: String
    var primaryImage: String
    var artistDisplayBio: String
    var objectDate: String
    var medium: String
    var culture: String
}

