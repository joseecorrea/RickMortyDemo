//
//  SimpleCardEffect.swift
//  RickMortyDemo
//
//  Created by Jose E on 11/7/23.
//

import SwiftUI

struct SimpleCardEffect: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(Constants.UI.Padding._4)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: Constants.UI.cornerRadius))
    }
}

extension View {
    func simpleCardEffect() -> some View {
        modifier(SimpleCardEffect())
    }
}
