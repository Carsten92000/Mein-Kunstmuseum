//
//  Souvenir.swift
//  Kunstmuseum
//
//  Created by Carsten Jahn on 19.09.24.
//

import Foundation

struct Souvenir: Identifiable {
    let id: UUID = UUID()
    let name: String
    let description: String
    let price: Double 
}
