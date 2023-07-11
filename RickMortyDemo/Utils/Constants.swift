//
//  Constants.swift
//  RickMortyDemo
//
//  Created by Jose E on 7/7/23.
//

import Foundation

struct Constants {
    struct Urls {
        private static let base = "https://rickandmortyapi.com/api"
        static let character = "\(base)/character"
        static let episodes = "\(base)/episode"
    }
    struct Strings {
        static let empty = ""
        static let emptySpace = " "
        static let home = "Home"
        static let characters = "Characters"
        static let alive = "Alive"
        static let dead = "Dead"
        static let error = "Error"
        static let retry = "Retry"
        static let ok = "Ok"
        static let sWentWrong = "Something went wrong fetching the data"
        static let origin = "Origin:"
        static let location = "Location:"
        static let episodes = "Episodes"
        static let count = "Count:"
        static let name = "name"
        static let trailer = "See trailer"
        static let creators = "Created by:"
        static let tapDetails = "Tap to see the details"
    }
    struct UI {
        static let cornerRadius: CGFloat = 6
        static let rotationAngle: Double = 180
        static let standardAnimationDuration: Double = 0.4
        static let quickAnimationDuration: Double = 0.1
        static let standardBlurEffect: CGFloat = 100
        static let standardScaleEffect: CGFloat = 0.7
        struct Padding {
            static let _2: CGFloat = 2
            static let _4: CGFloat = 4
            static let _5: CGFloat = 5
            static let _10: CGFloat = 10
            static let _20: CGFloat = 20
        }
        struct Spacing {
            static let _5: CGFloat = 5
            static let _10: CGFloat = 10
            static let _20: CGFloat = 20
        }
    }
    struct OptionalUnwrap {
        static let basic = Constants.Strings.empty
        static let notAvailable = "NA"
    }
    struct FileName {
        static let homeData = "HomeData"
    }
    struct Symbols {
        static let info = "info.circle"
        static let home = "house.fill"
        static let person = "person.fill"
    }
    struct Assets {
        static let imdbLogo = "IMDbLogo"
    }
}
