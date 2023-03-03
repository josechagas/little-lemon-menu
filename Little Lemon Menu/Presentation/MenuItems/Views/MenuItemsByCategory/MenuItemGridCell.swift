//
//  MenuItemGridCell.swift
//  Little Lemon Menu
//
//  Created by José Lucas Souza das Chagas on 01/03/23.
//

import SwiftUI

struct MenuItemGridCell: View {
    
    let item: MenuItem
    
    var body: some View {
        VStack {
            Color.gray.opacity(0.1).overlay(content: {
                AsyncImage(url: URL(string: item.imageUrl)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                } placeholder: {
                    ProgressView()
                        .progressViewStyle(.circular)
                        
                }
            })
            .aspectRatio(CGSize(width: 200, height: 140), contentMode: .fill)
            .clipShape(
                RoundedRectangle(cornerSize: CGSize(width: 8, height: 8))
            )
            
            Text(
                item.title
            )
            .lineLimit(1)
        }
    }
}

struct MenuItemGridCell_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemGridCell(
            item: MenuItem(
                title: "Food 5",
                category: .dessert,
                ingredients: Ingredient.allCases,
                priceInCents: 6999,
                ordersCount: 1233
            )
        )
        .frame(width: 250, height: 250)
    }
}
