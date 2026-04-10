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
        VStack(spacing: 20) {
            Text("Onboarding")
                .font(.largeTitle)
            
            Button {
                isOnboardingViewActive = false
            } label: {
                Text("Start")
            }

        }//:VSTACK
        
    }
}

#Preview {
    OnboardingView()
}
