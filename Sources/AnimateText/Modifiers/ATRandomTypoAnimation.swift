//
//  ATRandomTypoAnimation.swift
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

/// A modifier that randomly expresses text through animation.
public struct ATRandomTypoAnimation: ATTextAnimatable {

    private var length: Int
    private var base: String
    
    public var data: ATElementData
    public var animatableData: Double {
        get { data.value }
        set {
            data.value = newValue
        }
    }

    /// initialize `ATRandomTypoAnimation`
    ///
    /// - Parameters:
    ///   - data: Informational data required for each element animation.
    ///   - length: Maximum number of characters to be displayed at random.
    ///   - base: Characters to be displayed at random.
    ///
    public init(_ data: ATElementData, length: Int = 2, base: String? = nil) {
        self.data = data
        self.length = data.element.count + length
        self.base = base ?? "!\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~" + "--------------------------------------------------------------------------------------------------------"
    }
    
    public func body(content: Content) -> some View {
        narrowerText(data.value)
            .fixedSize()
    }
    
    /// A method of randomly processing text with animation.
    ///
    /// - Parameters:
    ///   - value: A value used in animation, between 0 and 1.
    ///
    private func narrowerText(_ value: Double) -> some View {
        let firstText = value >= 0.5 ? Text(data.element) : Text("")
        let random = randomText(Int((1.0 - value) * Double(length)))
        return firstText + Text(random)
    }

    /// A method that randomly returns text.
    ///
    /// - Parameters:
    ///   - length: The number of letters to be returned randomly. The default value is 2
    ///
    private func randomText(_ length: Int = 2) -> String {
        var newValue: String = ""
        for _ in 0..<length {
            let random = arc4random_uniform(UInt32(base.count))
            newValue += "\(base[base.index(base.startIndex, offsetBy: Int(random))])"
        }
        return newValue
    }
}
