//
//  ReportsView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 29/06/24.
//

import SwiftUI
import Charts
import Foundation

struct ReportsView: View {

    let weightData = [
        WeightData(year: 2022, month: 1, day: 21, weight: 81.5),
        WeightData(year: 2022, month: 8, day: 31, weight: 82),
        WeightData(year: 2023, month: 1, day: 1, weight: 83.5),
        WeightData(year: 2023, month: 11, day: 16, weight: 89.3),
        WeightData(year: 2024, month: 2, day: 29, weight: 91)
    ]
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .center){
//                    NavigationLink{
//                        ProfileView()
//                    }
//                label:{
//                        HStack(spacing: 15){
//                                 Image("demo")
//                                 Text("Bob")
//                                .font(.title2)
//                                .bold()
//                                .foregroundColor(Color("OnBackground"))
//                            Spacer()
//                        }.padding(.leading,30)
//                    }
                    VStack{
                        HStack{
                            Text("Weight")
                                .font(.subheadline)
                                .foregroundColor(Color("OnBackground"))
                            Spacer()
                        }.padding()
                        ZStack{
                            Rectangle()
                                .cornerRadius(10)
                                .frame(width: 360,height: 207)
                                .foregroundColor(Color("SurfacePrimary"))
                            Chart{
                                ForEach(weightData){ weight in
                                    LineMark(x: .value("Date", weight.date,unit: .year), y: .value("Weight", weight.weight)
                                    )
                                    .foregroundStyle(Color("Primary"))
                                    .interpolationMethod(.cardinal)
                                }
                            }
                           
                            .chartYAxis {
                                AxisMarks(position: .leading){ value in
                                    AxisValueLabel()
                                }
                            }
                            .chartXAxis {
                                AxisMarks(values: .stride(by: .year)) { value in
                                    AxisValueLabel(format: .dateTime.year())
                                }
                            }
                            .padding()
                        }
                        .frame(width: 360,height: 207)
                    }
                    
                    VStack{
                        HStack{
                            Text("Results")
                                .font(.subheadline)
                                .foregroundColor(Color("OnBackground"))
                                .bold()
                                .padding(.bottom,10)
                            Spacer()
                            Button(action: {}, label: {
                                Image(systemName: "plus")
                                    .resizable()
                                    .frame(width: 24,height: 24)
                                    .aspectRatio(contentMode: .fit)
                                    .foregroundColor(Color("OnBackground"))
                            })
                            
                        }
                        .padding()
                        LazyVStack{
                            ForEach(weightData,id:\.self){weight in
                                WeightCard(date: weight.date, weight: weight.weight)
                            }
                        }
                       
                    }
                  
               Spacer()
                }
            }
        }
    }
}

#Preview {
    ReportsView()
}

struct WeightCard: View {
    let date:Date
    let weight:Double
   let date1 = Date()
    let dateFormatter = DateFormatter()
    
    
//    dateFormatter.dateStyle = .medium
//    dateFormatter.locale = Locale(identifier: "en_US")
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .cornerRadius(10)
                .frame(width: 360,height: 50)
                .foregroundColor(Color("SurfacePrimary"))
            HStack{
                Text(date, style: .date)
                Spacer()
                Text("\(String(format: "%.1f", weight)) Kg")
            }
            .padding(.horizontal)
        }
        .frame(width: 360,height: 50)
    }
}
