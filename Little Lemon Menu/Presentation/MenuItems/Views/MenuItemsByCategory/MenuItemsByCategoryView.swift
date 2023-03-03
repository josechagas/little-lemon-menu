//
//  MenuItemsGridSection.swift
//  Little Lemon Menu
//
//  Created by José Lucas Souza das Chagas on 02/03/23.
//

import SwiftUI

struct MenuItemsByCategoryView: View {
    let itemsByCategory: MenuItemsByCategory
        
    var body: some View {
        Section(content: {
            ForEach(itemsByCategory.items, content: { item in
                NavigationLink(value: item, label: {
                    MenuItemGridCell(
                        item: item
                    )
                })
                .buttonStyle(.plain)
            })
        }, header: {
            HStack {
                Text(
                    itemsByCategory.category.localizedName()
                )
                Spacer()
            }
            .font(.title)
            .padding([.top])
        })
    }
    
}

struct MenuItemsByCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            Grid(horizontalSpacing: 10, verticalSpacing: 10){
                MenuItemsByCategoryView(
                    itemsByCategory: MenuItemsByCategory(
                        category: .food, items: [
                            MenuItem(
                                title: "Rice",
                                category: .food,
                                ingredients: Ingredient.allCases,
                                priceInCents: 1999,
                                ordersCount: 1233
                            ),
                            MenuItem(
                                title: "Black eyed peas",
                                category: .food,
                                ingredients: Ingredient.allCases,
                                priceInCents: 6999,
                                ordersCount: 12
                            ),
                            MenuItem(
                                title: "Feijoada",
                                category: .food,
                                ingredients: Ingredient.allCases,
                                priceInCents: 9999,
                                ordersCount: 999
                            )
                        ]
                    )
                )
            }
            .padding()
        }
    }
}
