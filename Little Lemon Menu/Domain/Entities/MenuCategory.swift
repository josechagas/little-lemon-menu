//
//  MenuCategory.swift
//  Little Lemon Menu
//
//  Created by José Lucas Souza das Chagas on 02/03/23.
//

import Foundation

enum MenuCategory: String {
    case food
    case drink
    case dessert
}

extension MenuCategory: CaseIterable {}

extension MenuCategory: Identifiable {
    var id: Self {
        return self
    }
}
