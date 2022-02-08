//
//  ATHangEffect.swift
//  AnimateText
//
//  Created by jasu on 2022/02/06.
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

/// Hang animation effect.
public struct ATHangEffect: ATTextAnimateEffect {

    public var data: ATElementData
    public var userInfo: Any?
    
    public init(_ data: ATElementData, _ userInfo: Any?) {
        self.data = data
        self.userInfo = userInfo
    }
    
    public func body(content: Content) -> some View {
        content
            .opacity(data.value)
            .animation(.easeIn.delay(Double(data.index) * 0.1), value: data.value)
            .rotation3DEffect(Angle(degrees: 180 * data.invValue), axis: (x: 0, y: 1, z: 1), anchor: .top)
            .animation(.spring(response: 0.5, dampingFraction: 0.4, blendDuration: 0.9).delay(Double(data.index) * 0.08), value: data.value)
    }
}

struct ATHangEffect_Previews: PreviewProvider {
    static var previews: some View {
        ATAnimateTextPreview<ATHangEffect>()
    }
}
