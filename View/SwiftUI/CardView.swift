//
//  CardView.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 23/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import SwiftUI

struct CardView: View {
    var item: Item
    var body: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            
            
            Image("image-placeholder")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 100, height: 200)
                .cornerRadius(10)
            Text( item.name ?? "")
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
