//
//  ChipView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 15/07/24.
//

import SwiftUI

struct ChipView: View {
    @Binding var isSelected: Bool
    let lable:String
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 30)
                .fill(isSelected ? Color("Primary"): .clear)
                .stroke( Color("Primary"), lineWidth: 2)
                
                .frame(width: 180,height: 60)
//                .frame(minWidth: 0 ,maxWidth: .infinity, height: 60)
            Text(lable)
                .foregroundColor(isSelected ? Color.white : Color("Primary"))
                .onTapGesture {
                    isSelected.toggle()
                }
            
                
        }
    }
}

#Preview {
    ChipView(isSelected: .constant(false), lable: "Sample Card")
}
