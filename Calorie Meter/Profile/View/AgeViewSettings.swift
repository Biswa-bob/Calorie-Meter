//
//  AgeViewSettings.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 20/07/24.
//

import SwiftUI

struct AgeViewSettings: View {
    var body: some View {
        VStack{
            Text("Age")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.bottom,30)
            VStack{
                Text("Years")
                TextField("", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .foregroundColor(Color("Primary"))
                Divider()
                 .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/,height: 2)
                 .padding(.horizontal, 30)
                 .background(Color("Primary"))
            }
            Spacer()
                .frame(height: 40)
            
            PrimaryButton(btnLable: "Done",onPressed: {})
            
        }
    }
}

#Preview {
    AgeViewSettings()
}
