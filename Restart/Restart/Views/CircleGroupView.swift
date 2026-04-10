//
//  CircleGroupView.swift
//  Restart
//
//  Created by Ajeet Sharma on 10/04/26.
//

import SwiftUI

struct CircleGroupView: View {
    
    //MARK: - PROPERTY
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    
    
    
    //MARK: - BODY
    
    var body: some View {
        ZStack{
            
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260.0, height: 260.0, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity),lineWidth: 80)
                .frame(width: 260.0, height: 260.0, alignment: .center)
            
            
        }//: ZSTACK
    }
}

#Preview {
    ZStack {
        Color("ColorBlue")
            .ignoresSafeArea()
        CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
    }
}
