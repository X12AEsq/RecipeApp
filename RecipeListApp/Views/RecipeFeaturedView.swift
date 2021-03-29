//
//  RecipeFeaturedView.swift
//  RecipeListApp
//
//  Created by Morris Albers on 3/28/21.
//

import SwiftUI

struct RecipeFeaturedView: View {
    @EnvironmentObject var model:RecipeModel

    var body: some View {
        VStack(alignment: .leading) {
            Text("Featured Recipes")
                .bold()
                .padding(.leading)
                .font(.largeTitle)
            GeometryReader { geo in
            
            TabView {
                ForEach(0..<model.recipes.count) { index in
                    if model.recipes[index].featured == true {
                        ZStack {
                            Rectangle()
                                .foregroundColor(.white).frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment:/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/).cornerRadius(15)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                            VStack(spacing: 0) {
                                Image(model.recipes[index].image)
                                    .resizable()
                                    .aspectRatio(contentMode:   .fill)
                                    .clipped()
                                Text(model.recipes[index].name).padding(5)
                        }
                    }.frame(width: geo.size.width - 40, height: geo.size.height - 100, alignment:/*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .cornerRadius(15)
                        .shadow(color: .black, radius: 10, x: -5, y: 5)

                    }
                }
                
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic)).indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))

            
        }
            VStack(alignment: .leading, spacing: 10) {
                Text("Preparation time").font(.headline)
                Text("1 Hour")
                Text("Highlights").font(.headline)
                Text("Healthy, Hearty")
            }.padding(.leading)
        }
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
    }
}
