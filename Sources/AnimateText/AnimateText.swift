//
//  AnimateText.swift
//  AnimateText
//
//  Created by jasu on 2022/02/05.
//  Copyright (c) 2022 jasu All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is furnished
//  to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
//  INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
//  PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
//  CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
//  OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

import SwiftUI

/// A view that animates binding text. Passing the effect type as a generic.
public struct AnimateText<E: ATTextAnimateEffect>: View {
    
    /// Binding the text to be expressed.
    @Binding private var text: String
    
    /// The type used to split text.
    var type: ATUnitType = .letters
    
    /// Custom user info for the effect.
    var userInfo: Any? = nil
    
    /// Split text into individual elements.
    @State private var elements: Array<String> = []
    
    /// A value used for animation processing. A value between 0 and 1.
    @State private var value: Double = 0
    
    /// Used to re-create the view.
    @State private var toggle: Bool = false
    
    /// The size of the Text view.
    @State private var size: CGSize = .zero
    
    /// initialize `AnimateText`
    ///
    /// - Parameters:
    ///   - text: Bind the text you want to express.
    ///   - type: The type used to split text. `ATUnitType`
    ///   - userInfo: Custom user info for the effect.
    ///
    public init(_ text: Binding<String>, type: ATUnitType = .letters, userInfo: Any? = nil) {
        _text = text
        self.type = type
        self.userInfo = userInfo
    }
    
    public var body: some View {
        ZStack {
            ZStack(alignment: .leading) {
                if size.width == 0 {
                    Text(text)
                        .lineLimit(1)
                        .takeSize($size)
                }
                HStack(spacing: 0) {
                    ForEach(Array(elements.enumerated()), id: \.offset) { index, element in
                        let data = ATElementData(element: element,
                                                 type: self.type,
                                                 index: index,
                                                 count: elements.count,
                                                 value: value,
                                                 size: size)
                        if toggle {
                            Text(element).modifier(E(data, userInfo))
                        }else {
                            Text(element).modifier(E(data, userInfo))
                        }
                    }
                }
                .fixedSize(horizontal: true, vertical: false)
            }
        }
        .onChange(of: text) { _ in
            withAnimation {
                value = 0
                getText(text)
                toggle.toggle()
            }
            DispatchQueue.main.async {
                value = 1
            }
        }
        .onAppear{
            let text = self.text
            self.text = ""
            DispatchQueue.main.async {
                self.text = text
            }
        }
    }
    
    private func getText(_ text: String) {
        switch type {
        case .letters:
            self.elements = text.map { String($0) }
        case .words:
            var elements = [String]()
            text.components(separatedBy: " ").forEach{
                elements.append($0)
                elements.append(" ")
            }
            elements.removeLast()
            self.elements = elements
        }
    }
}

struct AnimateText_Previews: PreviewProvider {
    static var previews: some View {
        ATAnimateTextPreview<ATRandomTypoEffect>()
    }
}
