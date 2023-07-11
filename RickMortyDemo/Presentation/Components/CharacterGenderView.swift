//
//  CharacterGenderView.swift
//  RickMortyDemo
//
//  Created by Jose E on 5/7/23.
//

import SwiftUI

struct CharacterGenderView: View {
    
    private let gender: Gender
    private let scale: CGFloat
    private let accentColor: Color
    
    init(gender: Gender, scale: CGFloat = Constants.UI.standardScaleEffect) {
        self.gender = gender
        self.scale = scale
        self.accentColor = {
            switch gender {
            case .male:
                return Color.blue
            case .female:
                return Color.pink
            default:
                return Color.gray
            }
        }()
    }
    
    var body: some View {
        if gender != .unknown {
            Image(gender.rawValue)
                .foregroundColor(accentColor)
                .scaleEffect(scale)
        } else {
            EmptyView()
        }
    }
}

struct CharacterGenderView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterGenderView(gender: .male)
    }
}
