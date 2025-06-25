//
//  SouvenirViewModel.swift
//  Kunstmuseum
//
//  Created by Carsten Jahn on 19.09.24.
//

import SwiftUI

class SouvenirViewModel: ObservableObject {
    
    @Published var souvenirs: [Souvenir] = []
    @Published var cartSovenirs: [Souvenir] = []
    @Published var sovenirValue: Int = 0
    @Published var isInCart = false
    
    init(){fetchSouvenirs()}
    
    func fetchSouvenirs() {
        
        souvenirs = [
            Souvenir(name: "Magnet", description: "Ein Magnet mit Museumslogo.", price: 5.99),
            Souvenir(name: "Tasse", description: "Eine Tasse mit dem Museumsdesign.", price: 12.99),
            Souvenir(name: "Schlüsselanhänger", description: "Ein eleganter Schlüsselanhänger.", price: 4.99),
            Souvenir(name: "Postkarte", description: "Postkarte mit historischen Motiven.", price: 1.99),
            Souvenir(name: "Notizbuch", description: "Ein handliches Notizbuch.", price: 8.99),
            Souvenir(name: "T-Shirt", description: "T-Shirt mit Museumsaufdruck.", price: 19.99),
            Souvenir(name: "Kunstbuch", description: "Ein Buch über die Kunstwerke im Museum.", price: 25.99),
            Souvenir(name: "Kugelschreiber", description: "Ein Kugelschreiber mit Museumslogo.", price: 3.49),
            Souvenir(name: "Poster", description: "Poster mit berühmtem Gemälde.", price: 9.99),
            Souvenir(name: "Keramikfigur", description: "Eine handgefertigte Keramikfigur.", price: 29.99),
            Souvenir(name: "Hut", description: "Ein stilvoller Hut mit Museumslogo.", price: 14.99),
            Souvenir(name: "Tasche", description: "Eine Stofftasche mit Museumsdesign.", price: 10.99),
            Souvenir(name: "Anstecknadel", description: "Eine dekorative Anstecknadel.", price: 2.49),
            Souvenir(name: "Wasserflasche", description: "Eine wiederverwendbare Wasserflasche.", price: 15.99),
            Souvenir(name: "Puzzle", description: "Ein Puzzle mit historischem Motiv.", price: 13.99)
        ]
    }
    
    func addCart(souvenirs: Souvenir) {
        cartSovenirs.append(souvenirs)
    } // ende addChart
    
    func removeCart(souvenirs: IndexSet) {
       // let index = souvenirs.firstIndex(where: { $0.objectID == souvenirs.id })!
        cartSovenirs.remove(atOffsets: souvenirs)
    } // ende removeCart
}
