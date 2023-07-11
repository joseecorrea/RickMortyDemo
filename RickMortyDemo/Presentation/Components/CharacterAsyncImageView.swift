//
//  CharacterAsyncImageView.swift
//  RickMortyDemo
//
//  Created by Jose E on 5/7/23.
//

import SwiftUI

struct CharacterAsyncImageView: View {
    
    private let urlString: String
    private let size: CGFloat
    
    init(urlString: String, size: CGFloat) {
        self.urlString = urlString
        self.size = size
    }
    
    var body: some View {
        // Caching mannualy using NSCache
//        RemoteImage(url: urlString)
//            .scaledToFit()
//            .frame(width: size)
//            .cornerRadius(Constants.UI.cornerRadius)
        
        // Using swiftUI native async image loader
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: size)
                .cornerRadius(Constants.UI.cornerRadius)
                
        } placeholder: {
            ProgressView()
                .frame(width: size, height: size)
        }
    }
}

struct CustomAsyncImageView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterAsyncImageView(urlString: Utils.getCharacter().image ?? Constants.OptionalUnwrap.basic, size: 300)
    }
}
