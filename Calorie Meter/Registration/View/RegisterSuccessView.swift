//
//  RegisterSuccessView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 04/07/24.
//

import SwiftUI

struct RegisterSuccessView: View {
    @State private var isLogin = false
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Text("You have successfully registered.")
                Spacer()
                
                NavigationLink{
                    GenderView()
                } label:{
                    PrimaryButtonUI( btnLable: "Go to Login")
                }
                
            }
           
        }
    }
}

#Preview {
    RegisterSuccessView()
}
