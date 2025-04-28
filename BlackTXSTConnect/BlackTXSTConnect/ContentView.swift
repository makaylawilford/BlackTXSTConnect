//
//  ContentView.swift
//  BlackTXSTConnect
//
//  Created by Wilford, Makayla M on 4/16/25.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedCategory: String = "All"
    @State private var orgs: [Org] = []

    let categories = ["All", "Cultural", "Community", "Leadership", "Professional", "Greek"]

    var filteredOrgs: [Org] {
        if selectedCategory == "All" {
            return orgs
        } else {
            return orgs.filter { $0.category == selectedCategory }
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.white
                    .ignoresSafeArea()

                VStack {
                    // 🔽 Dropdown Picker with "All" Filter Button in Black
                    Picker("Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.self) { category in
                            Text(category)
                                .foregroundColor(category == "All" ? .black : .maroon) // "All" button black
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding()
                    .background(Color.white) // Ensure the background is white for the dropdown
                    .cornerRadius(8)
                    .padding(.horizontal)

                    // 📋 Org List
                    List(filteredOrgs) { org in
                        NavigationLink(destination: OrgDetailView(org: org)) {
                            VStack(alignment: .leading) {
                                Text(org.name)
                                    .font(.headline)
                                    .foregroundColor(.maroon) // 🟥 Org Name

                                Text(org.category)
                                    .font(.subheadline)
                                    .foregroundColor(.black) // ⚫️ Org Category
                            }
                        }
                        .listRowBackground(Color.white) // Match background
                    }
                    .listStyle(.plain)
                    .scrollContentBackground(.hidden) // White background under list
                }
                .navigationTitle("Black TXST Connect")
                .foregroundColor(.maroon) // Ensure the navigation title is maroon
            }
        }
        .onAppear(perform: loadOrgs)
    }

    func loadOrgs() {
        if let url = Bundle.main.url(forResource: "black_orgs", withExtension: "json"),
           let data = try? Data(contentsOf: url),
           let decoded = try? JSONDecoder().decode([Org].self, from: data) {
            orgs = decoded
        }
    }
}

// Custom Maroon Color
extension Color {
    static let maroon = Color(red: 80 / 255, green: 0 / 255, blue: 0 / 255)
}

#Preview {
    ContentView()
}
