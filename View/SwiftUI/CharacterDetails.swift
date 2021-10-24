//
//  CharacterDetails.swift
//  MarvelCharacters
//
//  Created by Donia Ashraf on 23/10/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import SwiftUI

struct CharacterDetails: View {
    var character:Character
    var body: some View {
        ScrollView(.vertical){
            VStack{
                //Stetchy Header
                GeometryReader{ g in
                    Image(uiImage:"\(self.character.thumbnail?.path ?? "")/standard_large.\(self.character.thumbnail?.thumExtension ?? "")".load())
                    .resizable()
                    // fixing the view to the top will give strechy
                    // increasing height by drag amount
                    .offset(y: g.frame(in: .global).minY > 0 ? -g.frame(in: .global).minY : 0)
                    .frame(height: g.frame(in: .global).minY > 0 ? UIScreen.main.bounds.height / 2.2 + g.frame(in: .global).minY : UIScreen.main.bounds.height / 2.2 )
                }
                // fixing default height
                .frame(height: UIScreen.main.bounds.height / 2.2)
             }
            
            VStack(alignment: .leading, spacing: 15,content: {

                // section
                Section(header: HeaderView(name: character.name ?? "", description: character.description ?? "")){
                    //Tabs with content
                //    ForEach(tabs, id: \.self){ tab in
                    Spacer()
                        VStack(alignment: .leading, spacing: 10, content: {
                            Text("Comics")
                                .font(.subheadline)
                                .fontWeight(.bold)
                                .padding(.leading)
                                .padding(.bottom)
                            ScrollView(.horizontal){
                                HStack(spacing:8){
                                    ForEach(character.comics?.items ?? (dummyCharacter.comics?.items)!, id: \.name)
                                    {item in
                                        CardView(item: item)
                                    }
                                }
                            }
                        })
                    VStack(alignment: .leading, spacing: 15, content: {
                                             Text("Events")
                                                 .font(.subheadline)
                                                 .fontWeight(.bold)
                                                 .padding(.leading)
                                                 .padding(.bottom)
                                             ScrollView(.horizontal){
                                                 HStack(spacing:8){
                                                     ForEach(character.events?.items ?? (dummyCharacter.events?.items)!, id: \.name)
                                                     {item in
                                                         CardView(item: item)
                                                     }
                                                 }
                                             }
                                         })
                    VStack(alignment: .leading, spacing: 15, content: {
                                                                  Text("Series")
                                                                      .font(.subheadline)
                                                                      .fontWeight(.bold)
                                                                      .padding(.leading)
                                                                      .padding(.bottom)
                                                                  ScrollView(.horizontal){
                                                                      HStack(spacing:8){
                                                                          ForEach(character.series?.items ?? (dummyCharacter.series?.items)!, id: \.name)
                                                                          {item in
                                                                              CardView(item: item)
                                                                          }
                                                                      }
                                                                  }
                                                              })
                    VStack(alignment: .leading, spacing: 15, content: {
                                                                                       Text("Stories")
                                                                                           .font(.subheadline)
                                                                                           .fontWeight(.bold)
                                                                                           .padding(.leading)
                                                                                           .padding(.bottom)
                                                                                       ScrollView(.horizontal){
                                                                                           HStack(spacing:8){
                                                                                               ForEach(character.stories?.items ?? (dummyCharacter.comics?.items)!, id: \.name)
                                                                                               {item in
                                                                                                   CardView(item: item)
                                                                                               }
                                                                                           }
                                                                                       }
                                                                                   })
                 //   }
                }
            })
        }//.frame(maxWidth:.infinity)
        .edgesIgnoringSafeArea(.top)
        
    }
}

struct CharacterDetails_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetails(character: dummyCharacter)
    }
}

extension String {
    func load()->UIImage {
        do {
            guard let url = URL(string: self)else {
                return UIImage()
            }
            let data:Data = try Data(contentsOf: url)
            return UIImage(data:data) ?? UIImage()
        }catch{
            
        }
        return UIImage()
    }
}
