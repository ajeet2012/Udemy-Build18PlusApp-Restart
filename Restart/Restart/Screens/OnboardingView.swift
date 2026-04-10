//
//  OnboardingView.swift
//  Restart
//
//  Created by Ajeet Sharma on 10/04/26.
//

import SwiftUI

struct OnboardingView: View {
    
    //MARK: - Properties
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    
    //MARK: - Body
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                //MARK: - HEADER
                Spacer()
                VStack (spacing: 0){
                    Text("Share.")
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundStyle(.white)
                    Text("""
                     It's not how much we give but 
                     how much love we put into giving.
                     """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                }//: HEADER
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1.0), value: isAnimating)
                
                //MARK: - CENTER
                ZStack {
                    
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.7), value: isAnimating)
                }//: CENTER
                
                Spacer()
                
                
                //MARK: - FOOTER
                
                ZStack {
                    
                    //PARTS OF THE CUSTOM BUTTON
                    
                    //1: BACKGROUND (STATIC)
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8.0)
                    
                    
                    //2: CALL TO ACTION (STATIC)
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .offset(x: 20)
                    
                    //3: CAPSULE (DYNAMIC WIDTH)
                    
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80.0)
                        Spacer()
                    }
                    
                    
                    //4: CIRCLE (DRAGGABLE)
                    
                    HStack {
                        ZStack {
                            
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24.0, weight: .bold))
                            
                        }
                        .foregroundStyle(.white)
                        .frame(width: 80.0, height: 80.0, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80.0 {
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded{ _ in
                                    withAnimation(Animation.easeOut(duration: 0.4)){
                                        if buttonOffset > buttonWidth / 2.0 {
                                            buttonOffset = buttonWidth - 80.0
                                            isOnboardingViewActive = false
                                        }
                                        else {
                                            buttonOffset = 0
                                        }
                                    }
                                }
                        )//: Gesture
                        Spacer()
                    }//: HSTACK
                    
                }//: FOOTER
                .frame(width: buttonWidth, height: 80.0, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40.0)
                .animation(.easeInOut(duration: 1.0), value: isAnimating)
            }//: VSTACK
        }//: ZStack
        .onAppear {
            isAnimating = true
        }
        
    }
}

#Preview {
    OnboardingView()
}
