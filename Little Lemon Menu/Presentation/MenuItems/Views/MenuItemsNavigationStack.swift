//
//  MenuItemsNavigationStack.swift
//  Little Lemon Menu
//
//  Created by José Lucas Souza das Chagas on 02/03/23.
//

import SwiftUI

struct MenuItemsNavigationStack<Content: View>: View {
    
    let content: ()-> Content
    @State private var navigationPath: NavigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            content()
                .navigationDestination(for: MenuItem.self) { menuItem in
                    MenuItemDetailsView(item: menuItem)
                }
        }
    }
}

struct MenuItemsNavigationStack_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsNavigationStack {
            Text("Some example")
        }
    }
}
