//
//  ContentView.swift
//  Pinch
//
//  Created by Dhruv Patel on 18/06/26.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    // MARK: - PROPERTY
    
    // MARK: - FUNCTION
    
    
    // MARK: - CONTENT
    var body: some View {
        Text("Hello, World!")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13")
    }
}
