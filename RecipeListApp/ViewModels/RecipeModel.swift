//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Morris Albers on 2/3/21.
//

import Foundation
class RecipeModel: ObservableObject {
    @Published var recipes = [Recipe]()
    init() {
        self.recipes = DataService.getLocalData()
    }
}
