//
//  FavouritesList.swift
//  NavigationControllers
//
//  Created by Sergey Kozak on 29/11/2017.
//  Copyright © 2017 Centennial. All rights reserved.
//

import Foundation
import UIKit

class FavouritesList {
    static let sharedFavouritesList = FavouritesList()
    private(set) var favourites: [String]
    
    // Constructor
    
    init() {
        let defaults = UserDefaults.standard
        let storedFavourites = defaults.object(forKey: "favourites") as? [String]
        favourites = storedFavourites != nil ? storedFavourites! : []
    }
    
    func addFavourite (fontName: String) {
        if !favourites.contains(fontName) {
            favourites.append(fontName)
            saveFavourites()
        }
    }
    
    // removes favourite
    func removeFavourite (fontName: String) {
        if let index = favourites.index(of: fontName) {
            favourites.remove(at: index)
            saveFavourites()
        }
    }
    
    // save favourites
    private func saveFavourites () {
        let defaults = UserDefaults.standard
        defaults.set(favourites, forKey: "favourites")
        defaults.synchronize()
    }
    
    // move item
    
    func moveItem (fromIndex from: Int, toIndex to: Int) {
        let item = favourites[from]
        favourites.remove(at: from)
        favourites.insert(item, at: to)
        saveFavourites()
    }
    
    
}
