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
    @State private var imageScale:CGFloat = 1
    @State private var  imageOffset:CGSize = CGSize(width: 0, height: 0)
    @State private var isDrawerOpen:Bool = false
    
    // MARK: - FUNCTION
    func resetImageState() {
        return withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    // MARK: - CONTENT
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                
             // MARK: - PAGE IMAGE
                Image("magazine-front-cover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .padding()
                    .shadow(color:.black.opacity(0.2),radius: 12,x:2,y:2)
                    .opacity(isAnimating ? 1:0)
                    .offset(x:imageOffset.width,y:imageOffset.height)
                    .scaleEffect(imageScale)
                // MARK: - Tap Gesture
                    .onTapGesture(count:2,perform: {
                        if imageScale == 1 {
                            withAnimation(.spring()) {
                                imageScale = 5
                            }
                        } else {
                            resetImageState()
                        }
                    })
                // MARK: - Drag Gesture
                    .gesture(
                        DragGesture()
                            .onChanged {
                                value in
                                withAnimation(.linear(duration: 1)) {
                                    imageOffset = value.translation
                                    
                                }
                            }
                            .onEnded { _ in
                                if imageScale <= 1  {
                                    resetImageState()
                                }
                            }
                    )
                
            }//: ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform:{
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            })
            // MARK: - Info Panel
            .overlay(
                InfoPanelView(scale: imageScale,offset:imageOffset)
                    .padding(.horizontal)
                    .padding(.top,30)
                ,alignment: .top)
            // MARK: - CONTROL
            .overlay(
                Group {
                    HStack {
                        // SCALE DOWN
                        Button {
                            //Some Action
                            withAnimation(.spring()) {
                                if imageScale > 1 {
                                    imageScale -= 1
                                }
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                        } label : {
                            ControlImageView(icon: "minus.magnifyingglass")
                        }
                        // RESET
                        Button {
                            //Some Action
                            resetImageState()
                            
                        } label : {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        // SCALE UP
                        Button {
                            //Some Action
                            withAnimation(.spring()) {
                                if imageScale < 5  {
                                    imageScale += 1
                                    
                                    if imageScale > 5  {
                                        imageScale = 5
                                    }
                                }
                            }
                            
                        } label : {
                            ControlImageView(icon: "plus.magnifyingglass")
                        }
                    }//: CONTROLS
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    
                }
                    .padding(.bottom,30)
                ,alignment:.bottom)
           // MARK: - Drawer
            .overlay(
                HStack(spacing:12) {
                    // MARK: - DRAWER HANDLE
                    Image(systemName: "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height:40)
                        .padding(8)
                        .foregroundStyle(.secondary)
                        .onTapGesture(perform: {
                            withAnimation(.easeOut) {
                                isDrawerOpen.toggle()
                            }
                        })
                    // MARK: - THUMBNAILS
                    Spacer()
                }//: DRAWER
                    .padding(EdgeInsets(top:16,leading:8,bottom:16,trailing:8))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    .frame(width : 260)
                    .padding(.top,UIScreen.main.bounds.height/12)
                    .offset(x: isDrawerOpen ? 20 : 215)
                , alignment: .topTrailing
            )
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
