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
        NavigationView {
            ZStack {
             // MARK: - PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color:.black.opacity(0.2),radius: 12,x:2,y:2)
            }//: ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
        }//: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewDevice("iPhone 13")
    }
}
