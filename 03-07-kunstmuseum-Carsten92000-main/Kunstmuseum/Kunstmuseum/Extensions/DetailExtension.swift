//
//  DetailExtension.swift
//  Kunstmuseum
//
//  Created by Carsten Jahn on 17.09.24.
//
import SwiftUI

extension View {
    func detailExtension() -> some View {
        modifier(DetailModifier())
    }
}
