//
//  PrimaryButton.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 16/07/24.
//

import SwiftUI

struct PrimaryButton: View {
    var btnLable:String
    var onPressed: (()->())?
    var body: some View {
                Button(action: {
                    onPressed?()
                }, label: {
                    Text(btnLable)
                        .foregroundColor(.black)
                        .font(.title3)
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                        .padding(.vertical,20)
                        
        
                })
                .padding(.horizontal,100)
                .background(Color("Primary"))
                .cornerRadius(40)
                .frame(maxWidth: 312,maxHeight: 52)
    }
}

#Preview {
    PrimaryButton(btnLable: "temp")
}
