//
//  AgeView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 28/06/24.
//

import SwiftUI

struct AgeView: View {
    @State private var age:String = "5"
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Text("What’s your age?")
                        .font(.title2)
                        .foregroundColor(Color("OnBackground"))
                    Text("Required number of calories varies with age")
                        .multilineTextAlignment(.center)
                        .font(.subheadline)
                        .foregroundColor(Color("OnBackgroundVariant"))
                        .padding(.horizontal,50)
                        .padding(.top,5)
                    Spacer()
                    HStack(alignment: .center){
                        VStack{
                            TextField("", text: $age)
                                .frame(width: 40)
                                .onChange(of: age) { newValue in
                                     if newValue.count > 2 {
                                       age = String(newValue.prefix(2)) // Truncate to limit
                                     }
                                   }
                         
                            Rectangle()
                                .frame(width:60, height: 1)
                                .foregroundColor(Color("Primary"))
                        }
                     Text("Years")
                            .font(.title2)
                            .foregroundColor(Color("Primary"))
                    }
                    
                    Spacer()
                    HStack {
                        Button(action: {}, label: {
                            Text("Back")
                                .padding(.leading)
                                .font(.title3)
                                .foregroundColor(Color("OnBackgroundVariant"))
                        })
                        Spacer()
                        NavigationLink{
                            RecommendView()
                        } label:{
                            FloatingNavButtonUI()
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    AgeView()
}
