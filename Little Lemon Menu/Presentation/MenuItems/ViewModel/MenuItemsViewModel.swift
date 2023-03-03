//
//  MenuItemsViewModel.swift
//  Little Lemon Menu
//
//  Created by José Lucas Souza das Chagas on 02/03/23.
//

import Foundation


class MenuItemsViewModel: ObservableObject {
    @Published var itemsByCategory: [MenuItemsByCategory] = []
    
    ///These variables were created to follow the assessment but the corresponding View is using itemsByCategory to build the MENU
    @Published var foodMenuItems: [MenuItem] = []
    @Published var dessertMenuItems: [MenuItem] = []
    @Published var drinkMenuItems: [MenuItem] = []
    
    var filterBy: MenuCategory?
    var sortBy: Set<SortOption> = Set<SortOption>()
    
    private let menuItemsUseCase: ViewMenuItemsUseCase = ViewMenuItemsUseCase()
    
    func loadItems() {
        itemsByCategory = menuItemsUseCase.loadMenuItems(filterBy: filterBy, sortBy: sortBy)
        
        foodMenuItems = itemsByCategory.first(where: {$0.category == .food})?.items ?? []
        drinkMenuItems = itemsByCategory.first(where: {$0.category == .drink})?.items ?? []
        dessertMenuItems = itemsByCategory.first(where: {$0.category == .dessert})?.items ?? []
    }
    
    func applyNewFilters(filterBy: MenuCategory?, sortBy: Set<SortOption>) {
        self.filterBy = filterBy
        self.sortBy = sortBy
        loadItems()
    }
    
}
