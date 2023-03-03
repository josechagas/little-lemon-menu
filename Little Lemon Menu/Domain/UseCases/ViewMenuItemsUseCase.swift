//
//  ViewMenuItemsUseCase.swift
//  Little Lemon Menu
//
//  Created by José Lucas Souza das Chagas on 02/03/23.
//

import Foundation


class ViewMenuItemsUseCase {
    func loadMenuItems(filterBy: MenuCategory?, sortBy: Set<SortOption>)-> [MenuItemsByCategory] {
        var foodItems = generateRandomItems(count: 12, category: .food)
        var drinkItems = generateRandomItems(count: 8, category: .drink)
        var dessertItems = generateRandomItems(count: 4, category: .dessert)
        
        
        if !sortBy.isEmpty {
            foodItems = sortListBy(list: foodItems, sortOptions: sortBy)
            drinkItems = sortListBy(list: drinkItems, sortOptions: sortBy)
            dessertItems = sortListBy(list: dessertItems, sortOptions: sortBy)
        }
        
        let allMenuItems = [
            MenuItemsByCategory(
                category: MenuCategory.food, items: foodItems
            ),
            MenuItemsByCategory(
                category: MenuCategory.drink, items: drinkItems
            ),
            MenuItemsByCategory(
                category: .dessert, items: dessertItems
            )
        ]
        
        guard let filterBy = filterBy else {
            return allMenuItems
        }
       
        return allMenuItems.filter({$0.category == filterBy})

    }
    
    private func generateRandomItems(count: Int, category: MenuCategory)->[MenuItem] {
        return (0..<count).map { index in
            let price = Int.random(in: 1000...19899)
            let ordersCount = Int.random(in: 10...999999)

            return MenuItem(
                title: "Item \(index)",
                category: category,
                ingredients: Ingredient.allCases,
                priceInCents: price,
                ordersCount: ordersCount
            )
        }
    }
    
    private func sortListBy(list: [MenuItem], sortOptions: Set<SortOption>) -> [MenuItem] {
        return list.sorted(by: { itemOne, itemTwo in
            let order =  sortOptions.reduce([Bool]()) { partialResult, option in
                switch option {
                case SortOption.alphabetically:
                    return partialResult + [itemOne.title < itemTwo.title]
                case SortOption.mostPopular:
                    return partialResult + [itemOne.ordersCount > itemTwo.ordersCount]
                case SortOption.priceAscending:
                    return partialResult + [itemOne.priceInCents < itemTwo.priceInCents]
                }
            }
            let numberOfTrues = order.filter({$0}).count
            let numberOfFalses = order.count - numberOfTrues
            return numberOfTrues > numberOfFalses
        })
    }
}
