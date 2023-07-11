//
//  CharacterDetailView.swift
//  RickMortyDemo
//
//  Created by Jose E on 5/7/23.
//

import SwiftUI

struct CharacterDetailView: View {
    
    private var character: Character
    @StateObject private var viewModel = CharacterDetailViewModel()
    
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            CharacterAsyncImageView(urlString: character.image ?? Constants.OptionalUnwrap.basic, size: UIScreen.main.bounds.width * 0.8)
            Text(character.name ?? Constants.OptionalUnwrap.notAvailable)
                .font(.title)
                .fontWeight(.bold)
            VStack (alignment: .leading, spacing: Constants.UI.Spacing._20) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(character.species ?? Constants.OptionalUnwrap.notAvailable)
                            .font(.headline)
                        if let type = character.type, !type.isEmpty {
                            Text(type)
                                .font(.footnote)
                        }
                    }
                    CharacterGenderView(gender: character.gender ?? .unknown)
                    Spacer()
                    CharacterStatusView(status: character.status?.rawValue ?? Constants.OptionalUnwrap.notAvailable, dotSize: 15, font: .headline)
                }
                HStack {
                    Text(Constants.Strings.origin)
                        .font(.headline)
                    Text(character.origin?.name ?? Constants.OptionalUnwrap.notAvailable)
                }
                if character.location?.name != character.origin?.name {
                    HStack {
                        Text(Constants.Strings.location)
                            .font(.headline)
                        Text(character.location?.name ?? Constants.OptionalUnwrap.notAvailable)
                    }
                }
                DisclosureGroup() {
                    ForEach(viewModel.episodesDetail) { episode in
                        EpisodeDetailRow(episode: episode)
                        .padding(.vertical, Constants.UI.Padding._2)
                    }
                } label: {
                    VStack(alignment: .leading) {
                        Text(Constants.Strings.episodes)
                            .font(.headline)
                        Text("\(Constants.Strings.count) \(viewModel.episodesDetail.count)")
                            .font(.caption)
                    }
                }
                .padding(.bottom, Constants.UI.Padding._10)
                .onAppear {
                    viewModel.getEpisodesDetail(forCharacter: character)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, Constants.UI.Padding._20)
        }
        .customErrorAlert(isPresented: $viewModel.errorHappend) {
            viewModel.getEpisodesDetail(forCharacter: character)
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CharacterDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetailView(character: Utils.getCharacter())
    }
}
