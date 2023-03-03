//
//  SortOptions.swift
//  Little Lemon Menu
//
//  Created by José Lucas Souza das Chagas on 02/03/23.
//

import Foundation


enum SortOption: CaseIterable {
    case mostPopular
    case priceAscending
    case alphabetically
}

extension SortOption: Identifiable {
    var id: Self {
        return self
    }
}
