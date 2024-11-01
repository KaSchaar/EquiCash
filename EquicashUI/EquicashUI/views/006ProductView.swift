//
//  Product.swift
//  EquicashUI
//
//  Created by katy schaarschmidt on 30.10.24.
//
import SwiftUI

// Datenmodell für ein Produkt
struct Product: Identifiable {
    let id = UUID()
    let name: String
    let imageName: String
    let backgroundColor: Color
}

// Hauptansicht
struct ProductSelectionView: View {
    let products: [Product] = [
        Product(name: "Solarium", imageName: "solarium", backgroundColor: Color(hex: "D4A776")),
        Product(name: "Föhn", imageName: "hairdryer", backgroundColor: Color(hex: "296372")),
        Product(name: "Deckentrockner", imageName: "ceilingdryer", backgroundColor: Color(hex: "788c8c"))
    ]
    
    @State private var selectedTab:Tab = .home

    var body: some View {
        NavigationStack {
            VStack {
                Spacer().frame(height: 50)
                
                // Suchfeld
                HStack {
                    TextField("Search", text: .constant(""))
                        .padding(10)
                        .background(Color(hex: "E3E0D8"))
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image(systemName: "magnifyingglass")
                                Spacer()
                                Image(systemName: "mic")
                            }
                            .padding(.horizontal, 10)
                            .foregroundColor(.gray)
                        )
                        .padding(.horizontal, 20)
                }

                // ScrollView mit Produktkarten
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(products) { product in
                            ProductCardView(product: product)
                                .padding(.horizontal, 20)
                                .onTapGesture {
                                    // Hier kann die Aktion beim Anklicken des Produkts definiert werden
                                    print("Produkt ausgewählt: \(product.name)")
                                }
                        }
                    }
                }

                Spacer()

                // TabBar am unteren Bildschirmrand
                HStack {
                    Spacer()
                    TabBarItem(icon: "house", label: "Home", selectedTab: $selectedTab, tab: .home)
                    Spacer()
                    TabBarItem(icon: "cart", label: "Warenkorb", selectedTab: $selectedTab, tab: .cart)
                    Spacer()
                    TabBarItem(icon: "calendar", label: "Kalender", selectedTab: $selectedTab, tab: .calendar)
                    Spacer()
                    TabBarItem(icon: "envelope", label: "Postfach", selectedTab: $selectedTab, tab: .mail)
                    Spacer()
                }
                .padding(.vertical, 10)
                .background(Color(hex: "E3E0D8"))
            }
            .background(Color(hex: "E3E0D8"))
            .edgesIgnoringSafeArea(.all)
        }
    }
}

// Enum für die Tabs
enum Tab {
    case home, cart, calendar, mail
}

// Einfache View für eine TabBar-Schaltfläche
struct TabBarItem: View {
    let icon: String
    let label: String
    @Binding var selectedTab: Tab
    let tab: Tab

    var body: some View {
        VStack {
            Image(systemName: icon)
            Text(label)
                .font(.caption)
        }
        .foregroundColor(selectedTab == tab ? Color(hex: "D4A776") : Color(hex: "296372")) // Farbwechsel
        .onTapGesture {
            selectedTab = tab // Ändert die Farbe des ausgewählten Tabs
        }
    }
}

// Ansicht für eine Produktkarte
struct ProductCardView: View {
    let product: Product

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(product.backgroundColor)
                .frame(height: 150)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 5)

            VStack {
                Image(product.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 60, height: 60)
                    .padding(.bottom, 10)
                
                Text(product.name)
                    .font(.headline)
                    .foregroundColor(.black)
            }
        }
    }
}

// Preview für die gesamte Ansicht
struct ProductSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        ProductSelectionView()
    }
}
