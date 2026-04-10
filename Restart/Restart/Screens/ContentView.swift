//
//  ContentView.swift
//  Restart
//
//  Created by Ajeet Sharma on 02/04/26.
//

import SwiftUI

struct ContentView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        ZStack {
            if isOnboardingViewActive {
                OnboardingView()
            }
            else {
                HomeView()
            }
        }
    }
}

#Preview {
    ContentView()
}
