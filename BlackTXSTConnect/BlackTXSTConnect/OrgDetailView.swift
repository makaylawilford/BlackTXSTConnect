//
//  OrgDetailView.swift
//  BlackTXSTConnect
//
//  Created by Wilford, Makayla M on 4/16/25.
//

import Foundation

import SwiftUI

struct OrgDetailView: View {
    let org: Org

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text(org.name)
                    .font(.title)
                    .bold()
                    .foregroundColor(.maroon)

                Text("Category: \(org.category)")
                    .font(.subheadline)
                    .foregroundColor(.black)

                Text(org.description)
                    .font(.body)

                Divider()

                Text("Contact: \(org.contact)")
                    .font(.footnote)
                    .foregroundColor(.black)
            }
            .padding()
        }
        .navigationTitle(org.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
