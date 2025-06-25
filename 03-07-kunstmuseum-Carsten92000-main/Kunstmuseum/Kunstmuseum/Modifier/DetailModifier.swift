//
//  DetailModifier.swift
//  Kunstmuseum
//
//  Created by Carsten Jahn on 17.09.24.
//

import SwiftUI

struct DetailModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontDesign(.serif)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.blue)
            .padding(.bottom, 5)
    }
}
