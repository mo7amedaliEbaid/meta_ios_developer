//
//  MenuItemsView.swift
//  little_lemon_menu
//
//  Created by Mohamed Ali on 16/04/2026.
//

import SwiftUI

struct MenuItemsView: View {

    // MARK: - State

    @StateObject private var viewModel = MenuViewViewModel()

    /// Controls whether the filter/sort sheet is visible.
    @State private var showOptions = false

    /// Which categories are currently shown.
    @State private var selectedCategories: Set<CategoryFilter> = [.food, .drink, .dessert]

    /// Active sort order.
    @State private var selectedSort: SortOption = .mostPopular

    // MARK: - Layout

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    // MARK: - Computed filtered/sorted lists

    private var displayedFood: [MenuItem] {
        guard selectedCategories.contains(.food) else { return [] }
        return sorted(viewModel.foodItems)
    }

    private var displayedDrinks: [MenuItem] {
        guard selectedCategories.contains(.drink) else { return [] }
        return sorted(viewModel.drinkItems)
    }

    private var displayedDesserts: [MenuItem] {
        guard selectedCategories.contains(.dessert) else { return [] }
        return sorted(viewModel.dessertItems)
    }

    private func sorted(_ items: [MenuItem]) -> [MenuItem] {
        switch selectedSort {
        case .mostPopular:
            return items.sorted { $0.ordersCount > $1.ordersCount }
        case .price:
            return items.sorted { $0.price < $1.price }
        case .alphabetical:
            return items.sorted { $0.title < $1.title }
        }
    }

    // MARK: - Body

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {

                    // Food section
                    if !displayedFood.isEmpty {
                        menuSection(title: "Food", items: displayedFood)
                    }

                    // Drinks section
                    if !displayedDrinks.isEmpty {
                        menuSection(title: "Drinks", items: displayedDrinks)
                    }

                    // Dessert section
                    if !displayedDesserts.isEmpty {
                        menuSection(title: "Dessert", items: displayedDesserts)
                    }
                }
                .padding()
            }
            .navigationTitle("Menu")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showOptions = true
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease")
                            .imageScale(.large)
                    }
                }
            }
            .sheet(isPresented: $showOptions) {
                MenuItemsOptionView(
                    selectedCategories: $selectedCategories,
                    selectedSort: $selectedSort
                )
            }
        }
    }

    // MARK: - Helpers

    @ViewBuilder
    private func menuSection(title: String, items: [MenuItem]) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)

            LazyVGrid(columns: columns, spacing: 16) {
                ForEach(items) { item in
                    NavigationLink {
                        MenuItemDetailsView(item: item)
                    } label: {
                        MenuItemCell(item: item)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

// MARK: - Grid Cell

/// A single card in the 3-column grid.
private struct MenuItemCell: View {
    let item: MenuItem

    var body: some View {
        VStack(spacing: 6) {
            // Use Color.clear as the sized base so the frame is always
            // established before AsyncImage tries to expand.
            Color.clear
                .aspectRatio(1, contentMode: .fit)
                .overlay {
                    AsyncImage(url: item.imageURL) { phase in
                        switch phase {
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFill()
                        case .failure:
                            Image(systemName: "fork.knife")
                                .font(.largeTitle)
                                .foregroundStyle(.secondary)
                        default:
                            ProgressView()
                        }
                    }
                }
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10))

            Text(item.title)
                .font(.caption)
                .foregroundStyle(.primary)
                .lineLimit(1)
        }
    }
}

// MARK: - Preview

#Preview {
    MenuItemsView()
}
