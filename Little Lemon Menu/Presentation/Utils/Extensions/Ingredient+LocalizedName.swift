//
//  Ingredient+LocalizedName.swift
//  Little Lemon Menu
//
//  Created by José Lucas Souza das Chagas on 03/03/23.
//

import Foundation

extension Ingredient {
    func localizedName() -> String {
        switch(self) {
        case .broccoli:
            return "Broccoli"
        case .carrot:
            return "Carrot"
        case .pasta:
            return "Pasta"
        case .spinach:
            return "Spinach"
        case .tomatoSauce:
            return "Tomato Sauce"
        }
    }
}
