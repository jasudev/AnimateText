//
//  CustomEffect.swift
//  AnimateTextExample
//
//  Created by jasu on 2022/02/07.
//  Copyright (c) 2022 jasu All rights reserved.
//

import SwiftUI
import AnimateText

struct CustomEffect: ATTextAnimateEffect {
    
    var data: ATElementData
    var userInfo: Any?
    
    var color: Color = .red
    
    public init(_ data: ATElementData, _ userInfo: Any?) {
        self.data = data
        self.userInfo = userInfo
        if let info = userInfo as? [String: Any] {
            color = info["color"] as! Color
        }
    }
    
    func body(content: Content) -> some View {
        ZStack {
            content
                .opacity(data.value)
            content
                .foregroundColor(color)
                .opacity(data.invValue)
        }
        .animation(.spring(response: 1.2, dampingFraction: 0.6, blendDuration: 0.9).delay(Double(data.index) * 0.10), value: data.value)
        .scaleEffect(data.scale, anchor: .bottom)
        .animation(.spring(response: 0.3, dampingFraction: 0.6, blendDuration: 0.9).delay(Double(data.index) * 0.10), value: data.value)
    }
}

struct CustomEffect_Previews: PreviewProvider {
    static var previews: some View {
        ATAnimateTextPreview<CustomEffect>()
    }
}
