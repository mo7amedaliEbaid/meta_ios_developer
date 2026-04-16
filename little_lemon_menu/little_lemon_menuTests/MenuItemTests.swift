//
//  MenuItemTests.swift
//  little_lemon_menuTests
//
//  Created by Mohamed Ali on 16/04/2026.
//

import XCTest
@testable import little_lemon_menu

// @MainActor matches the app module's SWIFT_DEFAULT_ACTOR_ISOLATION = MainActor
// build setting, preventing actor-isolation violations when constructing MenuItem.
@MainActor
final class MenuItemTests: XCTestCase {

    // MARK: - Test: title

    /// When initialising a `MenuItem` with a title,
    /// the `title` property must equal the value passed to the initialiser.
    func testMenuItemTitle() {
        // Arrange
        let expectedTitle = "Test Pasta"

        // Act
        let menuItem = MenuItem(
            title: expectedTitle,
            price: 9.99,
            category: .food,
            ordersCount: 100,
            ingredients: [.spinach]
        )

        // Assert
        XCTAssertEqual(menuItem.title, expectedTitle,
                       "Menu item title should equal the value used during initialisation.")
    }

    // MARK: - Test: ingredients

    /// When initialising a `MenuItem` with a list of ingredients,
    /// the `ingredients` property must equal the list passed to the initialiser.
    ///
    /// Note: we compare `.rawValue` strings rather than the enum cases directly.
    /// Comparing `[Ingredient]` via XCTAssertEqual triggers an ObjC NSArray
    /// bridging path for the failure-message formatter that double-frees the
    /// String backing on this simulator runtime → malloc corruption.
    /// Comparing `[String]` avoids the bridge entirely.
    func testMenuItemIngredients() {
        // Arrange
        let expectedIngredients: [Ingredient] = [.spinach, .broccoli, .carrot]

        // Act
        let menuItem = MenuItem(
            title: "Test Salad",
            price: 7.49,
            category: .food,
            ordersCount: 50,
            ingredients: expectedIngredients
        )

        // Assert – compare raw String values to stay on the pure-Swift path
        XCTAssertEqual(
            menuItem.ingredients.map(\.rawValue),
            expectedIngredients.map(\.rawValue),
            "Menu item ingredients should equal the array used during initialisation."
        )
    }
}
