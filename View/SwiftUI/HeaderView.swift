//
//  HeaderView.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 23/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import SwiftUI

struct HeaderView: View {
    var name:String
    var description:String
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            Text(name)
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            Text("Description")
                     .font(.subheadline)
                     .fontWeight(.bold)
            Text(description)
                .font(.body)
            
            
        }
        .padding(.horizontal)
        .frame(height:150)
        .background(Color.white)
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
       CharacterDetails(character: dummyCharacter)
    }
}

