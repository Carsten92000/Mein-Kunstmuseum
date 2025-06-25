//
//  SovenirShopView.swift
//  Kunstmuseum
//
//  Created by Carsten Jahn on 19.09.24.
//

import SwiftUI

struct SovenirShopView: View {
    
    @StateObject private var souvenirViewModel: SouvenirViewModel = SouvenirViewModel()
    @State private var showSheet = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Button {
                    showSheet.toggle()
                } label: {
                    Text("Warenkorb")
                    Image(systemName: "cart")
                } // ende Button
                
                .sheet(isPresented: $showSheet) {
                    CartView()
                    Button {
                        showSheet.toggle()
                    } label: {
                        Text("Schließen")
                        Image(systemName: "xmark.circle")
                    } // ende Button
                } // ende sheet
                
                List {
                    ForEach(souvenirViewModel.souvenirs) { buySovenirs in
                        VStack {
                            Text(buySovenirs.name)
                                .font(.headline)
                                .fontWeight(.bold)
                                .foregroundStyle(.blue)
                            Text(buySovenirs.description)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundStyle(.blue)
                        HStack{
                            Text("Preis \(String(format: "%.2f", buySovenirs.price)) €")
                                .font(.subheadline)
                                .foregroundStyle(.red)
                            
                            Stepper("Menge", value: $souvenirViewModel.sovenirValue)
                                .font(.subheadline)
                            Text("\(souvenirViewModel.sovenirValue)")
                                .font(.subheadline)
                            
                            Button {
                            //    souvenirViewModel.addCart(cartSouvenirs: Souvenir)
                            } label : {
                                Image(systemName: "cart")
                            } // ende Button
                        } // ende VStack
                        } // ende HStack
                    } // ende ForEach
                } // ende List
                .padding()
                .background(.gray.opacity(0.3))
                .clipShape(.rect(cornerRadius: 12))
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Museums Shop")
                        .truncationMode(.middle)
                        .font(.title)
                } // ende ToolbarItem
            } // ende Toolbar
            } // ende NavigationStack
        } // ende VStack
    } // ende body
} // ende struct


