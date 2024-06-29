//
//  PrimaryButtonUI.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 26/06/24.
//

import SwiftUI

struct PrimaryButtonUI: View {
    @State var btnLable:String
    var onPressed: (()->())?
    var body: some View {
        Button(action: {
            onPressed?()
        }, label: {
            Text(btnLable)
                .frame(maxWidth: 312,maxHeight: 52)
                .foregroundColor(.black)
                .font(.title3)
                
        })
        .background(Color("Primary"))
        .cornerRadius(12)
        

    }
}

#Preview {
    PrimaryButtonUI(btnLable: "")
}
