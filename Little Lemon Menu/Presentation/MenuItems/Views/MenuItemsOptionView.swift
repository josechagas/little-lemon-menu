//
//  MenuItemsOptionView.swift
//  Little Lemon Menu
//
//  Created by José Lucas Souza das Chagas on 02/03/23.
//

import SwiftUI

struct MenuItemsOptionView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var viewModel: MenuItemsViewModel
    
    @State private var selectedCategory: MenuCategory?
    @State private var selectedSortOption: Set<SortOption> = Set<SortOption>()
        
    var body: some View {
        NavigationView {
            List {
                Section(content: {
                    ForEach(MenuCategory.allCases) { category in
                        FilterOptionView(
                            title: category.localizedName(),
                            isSelected: selectedCategory == category
                        )
                        .onTapGesture {
                            onCategoryTap(category: category)
                        }
                    }
                    
                }, header: {
                    Text(
                        "Selected Categories"
                    )
                })
                
                Section(content: {
                    ForEach(SortOption.allCases) { option in
                        FilterOptionView(
                            title: option.localizedName(),
                            isSelected: selectedSortOption.contains(option)
                        )
                        .onTapGesture {
                            onSortByTap(option: option)
                        }
                    }

                }, header: {
                    Text(
                        "Sort by"
                    )
                })
            }
            .navigationTitle("Filter")
            .toolbar {
                ToolbarItem(content: {
                    Button(action: doneButtonAction, label: {
                        Text("Done")
                    })
                })
            }
            .onAppear {
                loadCurrentAppliedFilters()
            }
        }
    }
    
    private func onCategoryTap(category: MenuCategory) {
        withAnimation {
            if selectedCategory?.id == category.id {
                selectedCategory = nil
            } else {
                selectedCategory = category
            }
        }
    }
    
    private func onSortByTap(option: SortOption) {
        withAnimation {
            if selectedSortOption.contains(option) {
                selectedSortOption.remove(option)
            } else {
                selectedSortOption.insert(option)
            }
        }
    }
    
    private func doneButtonAction() {
        confirmFilters()
        presentationMode.wrappedValue.dismiss()
    }
    
    private func confirmFilters() {
        viewModel.applyNewFilters(filterBy: selectedCategory, sortBy: selectedSortOption)
    }
    
    private func loadCurrentAppliedFilters() {
        selectedCategory = viewModel.filterBy
        selectedSortOption = viewModel.sortBy
    }
}

struct MenuItemsOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsOptionView()
            .environmentObject(MenuItemsViewModel())
    }
}


fileprivate struct FilterOptionView: View {
    let title: String
    let isSelected: Bool
    var body: some View {
        HStack {
            Text(
                title
            )
            Spacer()
            Image(systemName: "checkmark.circle")
                .foregroundColor(.accentColor)
                .opacity(isSelected ? 1 : 0.0)
        }
        .contentShape(Rectangle())

    }
}
