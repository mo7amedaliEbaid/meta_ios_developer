//
//  MenuItemsOptionView.swift
//  little_lemon_menu
//
//  Created by Mohamed Ali on 16/04/2026.
//

import SwiftUI

// MARK: - Filter & Sort enums

/// Categories that can be toggled in the filter panel.
enum CategoryFilter: String, CaseIterable {
    case food    = "Food"
    case drink   = "Drink"
    case dessert = "Dessert"
}

/// Sort strategies available in the options panel.
enum SortOption: String, CaseIterable {
    case mostPopular = "Most Popular"
    case price       = "Price $-$$$"
    case alphabetical = "A-Z"
}

// MARK: - View

/// A modal sheet that lets the user filter by category and choose a sort order.
struct MenuItemsOptionView: View {

    // Bindings passed in from `MenuItemsView` so changes propagate back.
    @Binding var selectedCategories: Set<CategoryFilter>
    @Binding var selectedSort: SortOption

    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            List {

                // MARK: Selected Categories
                Section(header: Text("SELECTED CATEGORIES")) {
                    ForEach(CategoryFilter.allCases, id: \.self) { category in
                        Button {
                            if selectedCategories.contains(category) {
                                selectedCategories.remove(category)
                            } else {
                                selectedCategories.insert(category)
                            }
                        } label: {
                            HStack {
                                Text(category.rawValue)
                                    .foregroundStyle(.primary)
                                Spacer()
                                if selectedCategories.contains(category) {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.blue)
                                }
                            }
                        }
                    }
                }

                // MARK: Sort By
                Section(header: Text("SORT BY")) {
                    ForEach(SortOption.allCases, id: \.self) { option in
                        Button {
                            selectedSort = option
                        } label: {
                            HStack {
                                Text(option.rawValue)
                                    .foregroundStyle(.primary)
                                Spacer()
                                if selectedSort == option {
                                    Image(systemName: "checkmark")
                                        .foregroundStyle(.blue)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Filter")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") { dismiss() }
                }
            }
        }
    }
}

// MARK: - Preview

#Preview {
    MenuItemsOptionView(
        selectedCategories: .constant([.food, .drink, .dessert]),
        selectedSort: .constant(.mostPopular)
    )
}
