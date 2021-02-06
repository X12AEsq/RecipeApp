//
//  DataService.swift
//  RecipeListApp
//
//  Created by Morris Albers on 2/3/21.
//

import Foundation
class DataService {
    static func getLocalData() -> [Recipe] {
        // get url path to file
        let pathString = Bundle.main.path(forResource: "recipes", ofType: "json")
        guard pathString != nil else {
            return [Recipe]()
        }
        let url = URL(fileURLWithPath: pathString!)
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                for r in recipeData {
                    r.id = UUID()
                }
                return recipeData
            }
            catch {
                print(error)
            }
        }
        catch {
            print(error)
        }
        return [Recipe]()
    }
}
