//
//  FloatingNavButtonUI.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 05/07/24.
//

import SwiftUI

struct FloatingNavButtonUI: View {
    var body: some View {
        ZStack{
            Circle()
                .foregroundColor(Color("Primary"))
                .padding()
                .shadow(color: Color.black.opacity(0.3),
                        radius: 3,
                        x: 3,
                        y: 3)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 100)
            Image(systemName: "chevron.right")
                .frame(width: 77, height: 70)
                .foregroundColor(Color.black)
                .padding(.vertical,2)
            
        }
    }
}

#Preview {
    FloatingNavButtonUI()
}
