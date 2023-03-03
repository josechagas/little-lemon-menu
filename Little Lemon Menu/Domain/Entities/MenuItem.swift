//
//  MenuItem.swift
//  Little Lemon Menu
//
//  Created by José Lucas Souza das Chagas on 02/03/23.
//

import Foundation

struct MenuItem: MenuItemProtocol {
    let id: UUID = UUID()
    let imageUrl: String = "https://picsum.photos/200"
    let title: String
    let category: MenuCategory
    let ordersCount: Int
        
    var ingredients: [Ingredient]
    var priceInCents: Int
    
    var price: Double {
        Double(priceInCents)/100.0
    }

    init(title: String, category: MenuCategory, ingredients: [Ingredient], priceInCents: Int, ordersCount: Int) {
        self.title = title
        self.category = category
        self.ingredients = ingredients
        self.priceInCents = priceInCents
        self.ordersCount = ordersCount
    }
}

extension MenuItem: Hashable {}

protocol MenuItemProtocol: Identifiable {
    var id: UUID {get}
    var price: Double {get}
    var title: String {get}
    var category: MenuCategory {get}
    var ordersCount: Int {get}
    var priceInCents: Int {get set}
    var ingredients: [Ingredient] {get set}
}
