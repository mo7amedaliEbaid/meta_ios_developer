//
//  MenuItemProtocol.swift
//  little_lemon_menu
//
//  Created by Mohamed Ali on 16/04/2026.
//

import Foundation

/// Defines the contract every menu item must satisfy.
protocol MenuItemProtocol {
    /// Unique identifier.
    var id: UUID { get }

    /// Display name of the menu item.
    var title: String { get }

    /// Retail price in USD.
    var price: Double { get set }

    /// The category this item belongs to (food, drink or dessert).
    var category: MenuCategory { get }

    /// Number of times this item has been ordered.
    var ordersCount: Int { get set }

    /// List of ingredients used in this item.
    var ingredients: [Ingredient] { get set }

    /// Remote image URL for this item.
    var imageURL: URL? { get }
}
