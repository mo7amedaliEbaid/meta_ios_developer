//
//  MockData.swift
//  little_lemon_menu
//
//  Created by Mohamed Ali on 16/04/2026.
//

import Foundation

/// Static mock data used to populate the menu in development and previews.
enum MockData {

    // MARK: - Convenience

    private static func url(_ string: String) -> URL? { URL(string: string) }

    // MARK: - Food (12 items)

    static let foodItems: [MenuItem] = [
        MenuItem(
            title: "Greek Salad", price: 8.99, category: .food, ordersCount: 820,
            ingredients: [.spinach, .broccoli],
            imageURL: url("https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Pasta Pomodoro", price: 10.99, category: .food, ordersCount: 1_000,
            ingredients: [.spinach, .broccoli, .carrot, .pasta],
            imageURL: url("https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Margherita Pizza", price: 12.49, category: .food, ordersCount: 560,
            ingredients: [.pasta, .tomatoSauce],
            imageURL: url("https://images.unsplash.com/photo-1565299624596-7c1967ef4b3b?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Classic Burger", price: 9.50, category: .food, ordersCount: 430,
            ingredients: [.carrot, .broccoli],
            imageURL: url("https://images.unsplash.com/photo-1568901346375-23c9450c58cd?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Club Sandwich", price: 14.00, category: .food, ordersCount: 1_200,
            ingredients: [.spinach, .broccoli, .carrot, .pasta],
            imageURL: url("https://images.unsplash.com/photo-1554433607-66b5efe9d304?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Grilled Chicken", price: 11.25, category: .food, ordersCount: 750,
            ingredients: [.tomatoSauce, .pasta],
            imageURL: url("https://images.unsplash.com/photo-1598103442097-8b74394b95c3?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Tomato Soup", price: 7.75, category: .food, ordersCount: 300,
            ingredients: [.broccoli, .carrot],
            imageURL: url("https://images.unsplash.com/photo-1547592166-23ac45744acd?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Ribeye Steak", price: 13.00, category: .food, ordersCount: 980,
            ingredients: [.spinach, .tomatoSauce],
            imageURL: url("https://images.unsplash.com/photo-1600891964092-4316c288032e?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Salmon Sushi", price: 15.50, category: .food, ordersCount: 1_500,
            ingredients: [.pasta, .broccoli, .spinach],
            imageURL: url("https://images.unsplash.com/photo-1579871494447-9811cf80d66c?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Street Tacos", price: 6.99, category: .food, ordersCount: 210,
            ingredients: [.carrot],
            imageURL: url("https://images.unsplash.com/photo-1565299585323-38d6b0865b47?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Mushroom Risotto", price: 9.99, category: .food, ordersCount: 640,
            ingredients: [.spinach, .pasta],
            imageURL: url("https://images.unsplash.com/photo-1476124369491-e7addf5db371?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Sea Bass Fillet", price: 11.75, category: .food, ordersCount: 870,
            ingredients: [.tomatoSauce, .broccoli, .carrot],
            imageURL: url("https://images.unsplash.com/photo-1519708227418-c8fd9a32b7a2?w=400&auto=format&fit=crop")
        ),
    ]

    // MARK: - Drinks (8 items)

    static let drinkItems: [MenuItem] = [
        MenuItem(
            title: "Espresso", price: 3.50, category: .drink, ordersCount: 2_200,
            ingredients: [],
            imageURL: url("https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Fresh OJ", price: 4.00, category: .drink, ordersCount: 1_800,
            ingredients: [],
            imageURL: url("https://images.unsplash.com/photo-1622597467836-f3e4b68b5538?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Mojito", price: 2.75, category: .drink, ordersCount: 950,
            ingredients: [],
            imageURL: url("https://images.unsplash.com/photo-1514362545857-3bc16c4c7d1b?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Herbal Tea", price: 5.00, category: .drink, ordersCount: 730,
            ingredients: [],
            imageURL: url("https://images.unsplash.com/photo-1556679343-c7306c1976bc?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Berry Smoothie", price: 3.25, category: .drink, ordersCount: 1_100,
            ingredients: [],
            imageURL: url("https://images.unsplash.com/photo-1502741338009-cac2772e18bc?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Red Wine", price: 4.50, category: .drink, ordersCount: 620,
            ingredients: [],
            imageURL: url("https://images.unsplash.com/photo-1510812431401-41d2bd2722f3?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Craft Beer", price: 6.00, category: .drink, ordersCount: 400,
            ingredients: [],
            imageURL: url("https://images.unsplash.com/photo-1608270586620-248524c67de9?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Lemonade", price: 2.50, category: .drink, ordersCount: 3_000,
            ingredients: [],
            imageURL: url("https://images.unsplash.com/photo-1621263764928-df1444c5e859?w=400&auto=format&fit=crop")
        ),
    ]

    // MARK: - Desserts (4 items)

    static let dessertItems: [MenuItem] = [
        MenuItem(
            title: "Chocolate Cake", price: 5.99, category: .dessert, ordersCount: 880,
            ingredients: [],
            imageURL: url("https://images.unsplash.com/photo-1565958011703-44f9829ba187?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Ice Cream", price: 7.25, category: .dessert, ordersCount: 640,
            ingredients: [],
            imageURL: url("https://images.unsplash.com/photo-1497034825429-c343d7c6a68f?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Glazed Donut", price: 6.50, category: .dessert, ordersCount: 1_050,
            ingredients: [],
            imageURL: url("https://images.unsplash.com/photo-1551024601-bec78aea704b?w=400&auto=format&fit=crop")
        ),
        MenuItem(
            title: "Tiramisu", price: 4.75, category: .dessert, ordersCount: 310,
            ingredients: [],
            imageURL: url("https://images.unsplash.com/photo-1571877227200-a0d98ea607e9?w=400&auto=format&fit=crop")
        ),
    ]
}
