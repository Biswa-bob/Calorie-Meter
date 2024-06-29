//
//  CardView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 27/06/24.
//

import SwiftUI

struct CardView: View {
    @Binding var isSelected: Bool
    let lable:String
    var body: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(.clear)
            .stroke(isSelected ? Color("Primary") : .clear, lineWidth: 2)
            .frame(width: 312,height: 60)
            .overlay{
                Text(lable)
                    .foregroundColor(Color("OnBackground"))
            }
            .onTapGesture {
                isSelected.toggle()
            }
        
    }
}

#Preview {
    CardView(isSelected: .constant(false), lable: "Sample Card")
}
