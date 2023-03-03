//
//  SortBy+LocalizedName.swift
//  Little Lemon Menu
//
//  Created by José Lucas Souza das Chagas on 02/03/23.
//

import Foundation


extension SortOption {
    func localizedName() -> String {
        switch(self) {
        case .alphabetically:
            return "A-Z"
        case .mostPopular:
            return "Most Popular"
        case .priceAscending:
            return "Price $-$$$"
        }
    }
}
