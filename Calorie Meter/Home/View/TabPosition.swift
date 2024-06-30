//
//  TabPosition.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 30/06/24.
//

import SwiftUI

struct PositionKey: PreferenceKey{
    static var defaultValue: CGRect = .zero
    
    static func reduce(value: inout CGRect, nextValue: () -> Value) {
        value = nextValue()
    }
}

extension View{
    @ViewBuilder
    func viewPosition(completion: @escaping(CGRect) -> ()) -> some View {
        self
            .overlay {
                GeometryReader {
                    let rect = $0.frame(in: .global)
                    
                    Color.clear
                        .preference(key: PositionKey.self, value: rect)
                        .onPreferenceChange(PositionKey.self,perform: completion)
                }
            }
    }
}
