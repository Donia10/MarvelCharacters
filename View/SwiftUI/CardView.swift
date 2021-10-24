//
//  CardView.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 23/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import SwiftUI

struct CardView: View {
    @ObservedObject var viewModel = DetailsViewModel()
    var item: Item

    init(item:Item) {
        self.item = item

        viewModel.getComicImages(resourceURI: item.resourceURI ?? "")
        print("----\(self.item.name)")
    }
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            
            Image(uiImage:"\(viewModel.thumbnail?.path ?? "")/standard_small.\(viewModel.thumbnail?.thumExtension ?? "")".load())
            
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 120, height: 180)
                .cornerRadius(10)
            Text( item.name ?? "jbhvgfc")
                .font(.subheadline)
                .lineLimit(3)
                .multilineTextAlignment(.center)
                .frame(width:100,alignment: .center)
            Spacer()
            
        })
            .frame(maxWidth:.infinity,alignment: .leading)
            .padding(.leading)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetails(character: dummyCharacter)
    }
}
