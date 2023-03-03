//
//  MenuItemsView.swift
//  Little Lemon Menu
//
//  Created by José Lucas Souza das Chagas on 01/03/23.
//

import SwiftUI

struct MenuItemsView: View {
    
    @StateObject var viewModel: MenuItemsViewModel = MenuItemsViewModel()
    @State var showFilterPage: Bool = false
    
    let gridColumns:[GridItem] = [GridItem](
        repeating: GridItem(.flexible(), spacing: 10, alignment: .center),
        count: 3
    )
    
    var body: some View {
        MenuItemsNavigationStack {
            ScrollView(.vertical){
                LazyVGrid(columns: gridColumns) {
                    ForEach(viewModel.itemsByCategory,
                            id: \.category,
                            content: { itemsByCategories in
                        
                        MenuItemsByCategoryView(
                            itemsByCategory: itemsByCategories
                        )
                    })
                }
                .padding()
            }
            .navigationTitle("Menu")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showFilterPage.toggle()
                    }, label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                    })
                }
            }
            .sheet(isPresented: $showFilterPage, content: {
                MenuItemsOptionView()
                    .environmentObject(viewModel)
            })
        }
        .onAppear {
            viewModel.loadItems()
        }
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
