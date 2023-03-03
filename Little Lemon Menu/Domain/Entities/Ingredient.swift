//
//  Ingredient.swift
//  Little Lemon Menu
//
//  Created by José Lucas Souza das Chagas on 03/03/23.
//

import Foundation

enum Ingredient: String {
    case spinach
    case broccoli
    case carrot
    case pasta
    case tomatoSauce
}

extension Ingredient: CaseIterable {}

extension Ingredient: Identifiable {
    var id: Self {
        return self
    }
}
