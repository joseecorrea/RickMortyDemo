//
//  HomeView.swift
//  RickMortyDemo
//
//  Created by Jose E on 10/7/23.
//

import SwiftUI

struct HomeView: View {
    
    private var data: HomeData? = nil
    @State private var isDetailView = false
    
    init() {
        guard let json = Utils.readLocalJSONFile(forName: Constants.FileName.homeData) else {
            return
        }
        data = Utils.parseJSON(jsonData: json)
    }
    
    private func getImageCover() -> some View {
        Image(data?.image ?? Constants.OptionalUnwrap.basic)
             .resizable()
             .scaledToFit()
    }
    
    var body: some View {
        VStack {
            if !isDetailView {
                ZStack {
                    getImageCover()
                }
                .clipShape(RoundedRectangle(cornerRadius: Constants.UI.cornerRadius))
            } else {
                ZStack {
                    getImageCover()
                        .blur(radius: Constants.UI.standardBlurEffect)
                    VStack(spacing: Constants.UI.Spacing._20) {
                        Text(data?.title ?? Constants.OptionalUnwrap.notAvailable)
                            .font(.largeTitle)
                        HStack(spacing: Constants.UI.Spacing._5) {
                            Text(Constants.Strings.creators)
                                .font(.caption)
                            ForEach(data?.creators ?? [], id: \.self) { creator in
                                Text(creator)
                            }
                        }
                        .font(.footnote)
                        .fontWeight(.bold)
                        HStack {
                            ForEach(data?.categories ?? [], id: \.self) { category in
                                Text(category)
                                    .simpleCardEffect()
                            }
                        }
                        .font(.footnote)
                        Text(data?.description ?? Constants.OptionalUnwrap.notAvailable)
                            .font(.caption)
                            .fontWeight(.semibold)
                        if let url = URL(string: data?.imdbURL ?? Constants.OptionalUnwrap.basic) {
                            Link(destination: url) {
                                HStack(spacing: Constants.UI.Spacing._5) {
                                    Image(Constants.Assets.imdbLogo)
                                        .cornerRadius(Constants.UI.cornerRadius)
                                        .scaleEffect(Constants.UI.standardScaleEffect)
                                    Text("\(data?.imdbRating ?? Constants.OptionalUnwrap.notAvailable) / 10")
                                        .underline(true)
                                }
                                .foregroundColor(.primary)
                            }
                        }
                    }
                }
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: Constants.UI.cornerRadius))
                .customRotation3DEffect(rotationTrigger: isDetailView)
            }
            HStack(alignment: .bottom) {
                Label(Constants.Strings.tapDetails, systemImage: Constants.Symbols.info)
                    .simpleCardEffect()
                    .opacity(isDetailView ? 0 : 1)
            }
            .customRotation3DEffect(rotationTrigger: isDetailView)
        }
        .padding()
        .customRotation3DEffect(rotationTrigger: isDetailView)
        .animation(.easeOut(duration: Constants.UI.standardAnimationDuration), value: isDetailView)
        .onTapGesture {
            let impactMed = UIImpactFeedbackGenerator(style: .medium)
            impactMed.impactOccurred()
            isDetailView.toggle()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
