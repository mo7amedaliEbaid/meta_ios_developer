//
//  MenuItemDetailsView.swift
//  little_lemon_menu
//
//  Created by Mohamed Ali on 16/04/2026.
//

import SwiftUI

struct MenuItemDetailsView: View {

    let item: MenuItem

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {

                // MARK: Hero image
                AsyncImage(url: item.imageURL) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                    case .failure:
                        Image(systemName: "fork.knife")
                            .font(.system(size: 60))
                            .foregroundStyle(.secondary)
                            .frame(maxWidth: .infinity)
                    default:
                        ProgressView()
                            .frame(maxWidth: .infinity)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 280)
                .background(Color(.systemGray6))
                .clipped()

                // MARK: Info section
                VStack(alignment: .center, spacing: 16) {

                    Divider()

                    // Price
                    VStack(spacing: 2) {
                        Text("Price:")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text(String(format: "$%.2f", item.price))
                            .font(.subheadline)
                    }

                    // Orders count
                    VStack(spacing: 2) {
                        Text("Ordered:")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text("\(item.ordersCount.formatted())")
                            .font(.subheadline)
                    }

                    // Ingredients
                    if !item.ingredients.isEmpty {
                        VStack(spacing: 4) {
                            Text("Ingredients:")
                                .font(.subheadline)
                                .fontWeight(.bold)
                            ForEach(item.ingredients, id: \.self) { ingredient in
                                Text(ingredient.rawValue.lowercased())
                                    .font(.subheadline)
                            }
                        }
                    }
                }
                .padding(.vertical, 20)
            }
        }
        .navigationTitle(item.title)
        .navigationBarTitleDisplayMode(.large)
    }
}

// MARK: - Preview

#Preview {
    NavigationStack {
        MenuItemDetailsView(item: MenuItem(
            title: "Pasta Pomodoro",
            price: 10.99,
            category: .food,
            ordersCount: 1_000,
            ingredients: [.spinach, .broccoli, .carrot, .pasta],
            imageURL: URL(string: "https://images.unsplash.com/photo-1555949258-eb67b1ef0ceb?w=400&auto=format&fit=crop")
        ))
    }
}
