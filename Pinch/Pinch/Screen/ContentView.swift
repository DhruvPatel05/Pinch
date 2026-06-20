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
    @State private var isAnimating: Bool = false
    
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
                    .opacity(isAnimating ? 1:0)
            }//: ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform:{
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            })
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
