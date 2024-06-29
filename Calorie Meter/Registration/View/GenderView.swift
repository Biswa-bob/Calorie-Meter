//
//  GenderView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 27/06/24.
//

import SwiftUI


struct GenderView: View {
    @State private var selectedId: String? = nil
    @Environment(\.dismiss) private var dismiss
    
    let gender:[String:String] = [
        "Male" : "male",
        "Female" : "female"
    ]
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Text("What’s your gender?")
                        .font(.title2)
                        .foregroundColor(Color("OnBackground"))
                    Text("Male bodies need more calories")
                        .multilineTextAlignment(.center)
                        .font(.subheadline)
                        .foregroundColor(Color("OnBackgroundVariant"))
                    Spacer()
                    
                    ForEach(gender.keys.sorted(), id: \.self){ label in
                        let identifier = gender[label]!
                        CardView(isSelected: Binding(get: {
                            selectedId == identifier
                        }, set: { newValue in
                            if newValue {
                                selectedId = identifier
                            } else {
                                selectedId = nil
                            }
                        }), lable: label)
                        
                    }
                    Spacer()
                    HStack {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Text("Back")
                                .padding(.leading)
                                .font(.title3)
                                .foregroundColor(Color("OnBackgroundVariant"))
                        })
                        Spacer()
                        Button(action: {}, label: {
                            Image(systemName: "chevron.right")
                                .frame(width: 77, height: 70)
                                .foregroundColor(Color.black)
                                .padding(.vertical,2)
                               
                        })
                        .background(Color("Primary"))
                        .cornerRadius(38.5)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                    }
                }
            }
//            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    GenderView()
}
