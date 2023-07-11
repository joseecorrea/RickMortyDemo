//
//  EpisodeDetailRow.swift
//  RickMortyDemo
//
//  Created by Jose E on 7/7/23.
//

import SwiftUI

struct EpisodeDetailRow: View {
    
    private let episode: Episode
    
    init(episode: Episode) {
        self.episode = episode
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: Constants.UI.cornerRadius)
                .foregroundStyle(.thickMaterial)
            VStack(alignment: .leading, spacing: Constants.UI.Spacing._10) {
                HStack {
                    Text(episode.episode ?? Constants.OptionalUnwrap.notAvailable)
                    Spacer()
                    Text(episode.airDate ?? Constants.OptionalUnwrap.notAvailable)
                }
                .font(.footnote)
                Text(episode.name ?? Constants.OptionalUnwrap.notAvailable)
                    .font(.headline)
            }
            .padding(.vertical, Constants.UI.Padding._5)
            .padding(.horizontal, Constants.UI.Padding._10)
        }
    }
}

struct EpisodeDetailRow_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailRow(episode: Utils.getEpisode())
    }
}
