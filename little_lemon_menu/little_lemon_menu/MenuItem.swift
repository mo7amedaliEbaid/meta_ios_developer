//
//  MenuItem.swift
//  little_lemon_menu
//
//  Created by Mohamed Ali on 16/04/2026.
//

import Foundation

/// A concrete menu item that conforms to both `MenuItemProtocol` and `Identifiable`.
class MenuItem: MenuItemProtocol, Identifiable {

    // MARK: - MenuItemProtocol conformance

    let id: UUID
    let title: String
    var price: Double
    let category: MenuCategory
    var ordersCount: Int
    var ingredients: [Ingredient]
    let imageURL: URL?

    // MARK: - Init

    init(
        title: String,
        price: Double,
        category: MenuCategory,
        ordersCount: Int,
        ingredients: [Ingredient],
        imageURL: URL? = nil
    ) {
        self.id          = UUID()
        self.title       = title
        self.price       = price
        self.category    = category
        self.ordersCount = ordersCount
        self.ingredients = ingredients
        self.imageURL    = imageURL
    }
}
