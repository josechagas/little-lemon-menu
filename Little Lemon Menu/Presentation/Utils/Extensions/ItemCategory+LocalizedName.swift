//
//  ItemCategory+LocalizedName.swift
//  Little Lemon Menu
//
//  Created by José Lucas Souza das Chagas on 02/03/23.
//

import Foundation

extension MenuCategory {
    func localizedName()-> String {
        switch(self) {
        case .food:
            return "Food"
        case .drink:
            return "Drinks"
        case .dessert:
            return "Dessert"
        }
    }
}
