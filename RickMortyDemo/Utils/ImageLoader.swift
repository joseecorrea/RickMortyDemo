//
//  ImageLoader.swift
//  RickMortyDemo
//
//  Created by Jose E on 11/7/23.
//

import UIKit

@MainActor
class ImageLoader: ObservableObject {
    @Published var image: UIImage?

    private var sharedSession: URLSession = URLSession.shared
    private var baseUrl = Constants.Strings.empty

    init(url: String) {
        self.baseUrl = url
        Task {
            await loadImage()
        }
    }

    private func loadImage() async {
        if let cachedImage = ImageCache.shared.get(forKey: baseUrl) {
            self.image = cachedImage
            return
        }
        guard let url = URL(string: baseUrl) else {
            self.image = nil
            return
        }
        do {
            let (data, response) = try await sharedSession.data(from: url)
            if (response as? HTTPURLResponse)?.statusCode == 200 {
                let image = UIImage(data: data)
                self.image = image
                ImageCache.shared.set(image!, forKey: self.baseUrl)
            }
        } catch {
            self.image = nil
        }
    }
}
