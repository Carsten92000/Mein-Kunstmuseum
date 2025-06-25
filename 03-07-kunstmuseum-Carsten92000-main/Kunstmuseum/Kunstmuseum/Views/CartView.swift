//
//  CartView.swift
//  Kunstmuseum
//
//  Created by Carsten Jahn on 20.09.24.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var souvenirViewModel: SouvenirViewModel = SouvenirViewModel()
    @State private var showAlert: Bool = false
   
    
    var body: some View {
        
            NavigationStack {
                List {
                    ForEach(souvenirViewModel.souvenirs) { souvenir in
                        VStack{
                        Text(souvenir.name)
                                .font(.headline)
                            HStack {
                                Text("Preis: \(String(format: "%.2f", souvenir.price)) €")
                                        .font(.subheadline)
                                        .foregroundStyle(.red)
                                    
                                Spacer()
                                
                                    Text("Menge \(souvenirViewModel.sovenirValue)")
                                        .font(.subheadline)
                            } // ende HStack
                        
//                                .swipeActions {
//                                    Button {
//                                        showAlert.toggle()
//                                    } label: {
//                                        Text("Löschen", systemImage: "trash")
//                                    } // ende Button
//                                } // ende swipeActions
//                            
//                            /// Alert um sicherzugehen ob der Artikel wirklich aus dem Warenkorb entfernt werden soll
//                                .alert("Artikel wirklich entfernen?", isPresented: $showAlert) {
//                                    Button("Ja", role: .destructive) {
//                                        souvenirViewModel.removeCart(for: souvenir)
//                                    }
//                                    Button("Nein", role: .cancel) {
//                                    }
//                                } // ende alert
                        } // ende VStack
                    } // ende ForEach
                } // ende List
                .padding()
                .background(.gray.opacity(0.3))
                .clipShape(RoundedRectangle(cornerRadius: 12))
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Warenkorb")
                        .truncationMode(.middle)
                        .font(.title)
                } // ende ToolbarItem
            } // ende Toolbar
            } // ende NavigationStack
        
        
    } // ende body
} // ende struct

//    souvenirViewModel.removeCart(for: souvenir)


