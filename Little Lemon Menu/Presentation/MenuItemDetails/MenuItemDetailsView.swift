//
//  MenuItemDetailsView.swift
//  Little Lemon Menu
//
//  Created by José Lucas Souza das Chagas on 02/03/23.
//

import SwiftUI

struct MenuItemDetailsView: View {
    let item: MenuItem
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 10){
                Image("Little Lemon logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxHeight: 300)
                    .clipped()
                
                TitleDetailView(title: "Price:", details: {
                    Text(formattedPrice())
                })
                
                TitleDetailView(title: "Ordered:", details: {
                    Text("\(item.ordersCount)")
                })
                
                TitleDetailView(title: "Ingredients:", details: {
                    ForEach(item.ingredients) { ingredient in
                        Text(ingredient.localizedName())
                    }
                })
            }
        }
        .navigationTitle(item.title)
    }
    
    private func formattedPrice() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter.string(for: item.price) ?? String.init(format: "%.2d", item.price)
    }
}

struct MenuItemDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemDetailsView(
            item: MenuItem(
                title: "Food 5",
                category: .dessert,
                ingredients: Ingredient.allCases,
                priceInCents: 6999,
                ordersCount: 1233
            )
        )
    }
}
