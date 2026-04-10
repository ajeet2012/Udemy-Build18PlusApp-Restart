//
//  HomeView.swift
//  Restart
//
//  Created by Ajeet Sharma on 10/04/26.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    var body: some View {
        VStack {
            Text("Home View")
                .font(.largeTitle)
            Button {
                isOnboardingViewActive = true
            } label: {
                Text("Restart")
            }

        }//:VSTACK
       
    }
}

#Preview {
    HomeView()
}
