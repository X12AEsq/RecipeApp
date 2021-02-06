//
//  RecipeDetailView.swift
//  RecipeListApp
//
//  Created by Morris Albers on 2/5/21.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe:Recipe
    var body: some View {
        ScrollView {
            VStack(alignment:.leading) {
                Image(recipe.image)
                    .resizable()
                    .scaledToFill()
                VStack(alignment: .leading) {
                    Text("Ingredients")
                        .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                        .padding(/*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                    ForEach (recipe.ingredients, id:\.self) { item in
                        Text("- " + item)
                    }
                    .padding(/*@START_MENU_TOKEN@*/.bottom/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/1.0/*@END_MENU_TOKEN@*/)
                }
                Divider()
                VStack(alignment: .leading) {
                    Text("Directions")
                        .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                        .padding(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)
                    ForEach (0..<recipe.directions.count, id:\.self) { index in
                        Text(String(index + 1) + ". " + recipe.directions[index])
                    }
                    .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom]/*@END_MENU_TOKEN@*/, /*@START_MENU_TOKEN@*/5.0/*@END_MENU_TOKEN@*/)

                }
            }
        }
        .navigationBarTitle(recipe.name)
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // pass in dummy for previewing (just whatever the first recipe is)
        let model = RecipeModel()
        RecipeDetailView(recipe: model.recipes[0])
    }
}
