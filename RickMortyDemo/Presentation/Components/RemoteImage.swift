//
//  RemoteImage.swift
//  RickMortyDemo
//
//  Created by Jose E on 11/7/23.
//

import SwiftUI

struct RemoteImage: View {
    @ObservedObject var imageLoader: ImageLoader

    init(url: String) {
        imageLoader = ImageLoader(url: url)
    }

    var body: some View {
        if let image = imageLoader.image {
            Image(uiImage: image)
                .resizable()
        } else {
            ProgressView()
        }
    }
}

struct RemoteImage_Previews: PreviewProvider {
    static var previews: some View {
        RemoteImage(url: Utils.getCharacter().image ?? Constants.OptionalUnwrap.basic)
    }
}
