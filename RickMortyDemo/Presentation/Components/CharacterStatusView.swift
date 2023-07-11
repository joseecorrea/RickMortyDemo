//
//  CharacterStatusView.swift
//  RickMortyDemo
//
//  Created by Jose E on 5/7/23.
//

import SwiftUI

struct CharacterStatusView: View {
    
    private let status: String
    private let dotSize: CGFloat
    private let font: Font
    
    init(status: String, dotSize: CGFloat, font: Font) {
        self.status = status
        self.dotSize = dotSize
        self.font = font
    }
    
    var body: some View {
        HStack() {
            switch status {
            case Constants.Strings.alive:
                Circle().fill(Color.green)
                    .frame(width: dotSize)
            case Constants.Strings.dead:
                Circle().fill(Color.red)
                    .frame(width: dotSize)
            default:
                Circle().fill(Color.gray)
                    .frame(width: dotSize)
            }
            Text(status)
                .font(font)
        }
    }
}

struct CharacterStatusView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterStatusView(status: Utils.getCharacter().status?.rawValue ?? Constants.OptionalUnwrap.notAvailable, dotSize: 10, font: .footnote)
    }
}
