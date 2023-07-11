//
//  Rotation3DEffect.swift
//  RickMortyDemo
//
//  Created by Jose E on 11/7/23.
//

import SwiftUI

struct Rotation3DEffect: ViewModifier {
    
    private var rotationTrigger: Bool
    
    init(rotationTrigger: Bool) {
        self.rotationTrigger = rotationTrigger
    }
    
    func body(content: Content) -> some View {
        content
            .rotation3DEffect(rotationTrigger ? Angle(degrees: Constants.UI.rotationAngle) : .zero, axis: (x: 0, y: 1, z: 0))
    }
}

extension View {
    func customRotation3DEffect(rotationTrigger: Bool) -> some View {
        modifier(Rotation3DEffect(rotationTrigger: rotationTrigger))
    }
}
