//
//  TitleDetailView.swift
//  Little Lemon Menu
//
//  Created by José Lucas Souza das Chagas on 02/03/23.
//

import SwiftUI

struct TitleDetailView<Content: View>: View {
    private let title: String
    private let details: Content
    
    init(title: String, @ViewBuilder details: ()-> Content) {
        self.title = title
        self.details = details()
    }
    
    var body: some View {
        VStack {
            Text(
                title
            )
            .fontWeight(.bold)
            details
        }
    }
}

struct TitleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TitleDetailView(
            title: "Price:",
            details: {
                Text("10.99")
            }
        )
    }
}
