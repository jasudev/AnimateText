//
//  TapAnimateTextView.swift
//  AnimateTextExample
//
//  Created by jasu on 2022/02/06.
//  Copyright (c) 2022 jasu All rights reserved.
//

import SwiftUI
import AnimateText

struct TapAnimateTextView<E: ATTextAnimateEffect>: View {
    
    let type: ATUnitType
    let elements: [String]
    var userInfo: Any? = nil
    
    @State private var text: String = ""
    
    var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                Spacer()
                ZStack(alignment: .leading) {
                    AnimateText<E>($text, type: type, userInfo: userInfo)
                        .font(.custom("Helvetica SemiBold", size: 30))
                        .padding(.vertical)
                    if text.isEmpty {
                        VStack(alignment: .leading) {
                            Text(String(describing: E.self))
                                .foregroundColor(Color.accentColor)
                                .font(.custom("Helvetica SemiBold", size: 30))
                                .transition(.opacity)
                            Text("Touch the screen.")
                                .font(.callout)
                                .opacity(0.3)
                                .disabled(true)
                        }
                    }
                }
                .padding()
                .padding(.bottom, 50)
                Spacer()
            }
        }
        .clipped()
        .contentShape(Rectangle())
        .onTapGesture {
            changeText()
        }
        .onAppear {
            text = ""
        }
    }
    
    private func changeText() {
        let newText = self.elements[Int.random(in: (0..<self.elements.count))]
        if Bool.random() == true {
            text = newText
        }else {
            text = newText.uppercased()
        }
    }
}

struct TapAnimateTextView_Previews: PreviewProvider {
    static var previews: some View {
        TapAnimateTextView<ATTwistEffect>(type: .letters, elements: ["AnimateText"])
    }
}
