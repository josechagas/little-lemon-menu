//
//  MenuItemTests.swift
//  Little Lemon MenuTests
//
//  Created by José Lucas Souza das Chagas on 03/03/23.
//

import XCTest
@testable import Little_Lemon_Menu

final class MenuItemTests: XCTestCase {
    func test_title_equalToTheInitValue() {
        let title = "Test title"
        let menuItem = MenuItem(title: title,
                                category: .dessert,
                                ingredients: Ingredient.allCases,
                                priceInCents: 999,
                                ordersCount: 1023
        )
        XCTAssertEqual(menuItem.title, title)
    }
    
    func test_ingredients_equalToTheInitValue() {
        let ingredients = [Ingredient.tomatoSauce, Ingredient.pasta]
        let menuItem = MenuItem(
            title: "Some title",
            category: .dessert,
            ingredients: ingredients,
            priceInCents: 999,
            ordersCount: 1023
        )

        XCTAssertEqual(menuItem.ingredients, ingredients)
    }
}
