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
                //MARK: - CENTER
                ZStack {
                    
                    ZStack{
                        
                        Circle()
                            .stroke(.white.opacity(0.2), lineWidth: 40)
                            .frame(width: 260.0, height: 260.0, alignment: .center)
                        Circle()
                            .stroke(.white.opacity(0.2),lineWidth: 80)
                            .frame(width: 260.0, height: 260.0, alignment: .center)
                        
                        
                    }//: ZSTACK
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                }//: CENTER
                
                Spacer()
                
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
                            .frame(width: 80.0)
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
                        .onTapGesture {
                            isOnboardingViewActive = false
                        }
                        Spacer()
                    }
                    
                }//: FOOTER
                .frame(height: 80.0, alignment: .center)
                .padding()
                //MARK: - FOOTER
                
            }//: VSTACK
        }//: ZStack
        
    }
}

#Preview {
    OnboardingView()
}
