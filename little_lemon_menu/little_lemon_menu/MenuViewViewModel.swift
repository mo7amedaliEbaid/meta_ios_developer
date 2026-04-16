//
//  MenuViewViewModel.swift
//  little_lemon_menu
//
//  Created by Mohamed Ali on 16/04/2026.
//

import Foundation
import Combine

/// Stores and exposes the business logic for `MenuItemsView`.
/// Separates data management from the view layer.
class MenuViewViewModel: ObservableObject {

    // MARK: - Published properties

    /// All food menu items.
    @Published var foodItems: [MenuItem]

    /// All drink menu items.
    @Published var drinkItems: [MenuItem]

    /// All dessert menu items.
    @Published var dessertItems: [MenuItem]

    // MARK: - Init

    init() {
        foodItems    = MockData.foodItems
        drinkItems   = MockData.drinkItems
        dessertItems = MockData.dessertItems
    }
}
