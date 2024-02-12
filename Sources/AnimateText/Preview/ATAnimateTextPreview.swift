//
//  ATAnimateTextPreview.swift
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

/// Use to test the effect with PreviewProvider.
public struct ATAnimateTextPreview<E: ATTextAnimateEffect>: View {
    
    @State private var text: String = "Animate"
    
    let words = "Labyrinth,Ineffable,Incendiary,Ephemeral,Cynosure,Propinquity,Infatuation,Incandescent,Eudaemonia,Raconteur,Petrichor,Sumptuous,Aesthete,Nadir,Miraculous,Lassitude,Gossamer,Bungalow,Aurora,Inure,Mellifluous,Euphoria,Cherish,Demure,Elixir,Eternity,Felicity,Languor,Love,Solitude,Epiphany,Quintessential,Plethora,Nemesis,Lithe,Tranquility,Elegance,Renaissance,Eloquence,Sequoia,Peace,Lullaby,Paradox,Pristine,Effervescent,Opulence,Ethereal,Sanguine,Panacea,Bodacious,Axiom,Silhouette,Surreptitious,Ingenue,Dulcet,Tryst,Ebullience".components(separatedBy: ",")
    let sentence = "Don’t dwell on the past.,Believe in yourself.,Follow your heart.,Seize the day.,You only live once.,Past is just past.,Love yourself.,Don’t beat yourself up.,Life is a journey.,No Pain,No gain,No sweat,The die is cast.,When they go low,A friend is a second myself.,Appearances are deceptive.,Be brave.,Every cloud has a silver lining.,Don’t judge a book by its cover.,Hang in there.,This is how life is.,Live positive.,Seeing is believing.,He can do, She can do,Why not me,If not now,then when?,Respect individual.,Habit is a second nature.,Time is gold.,You deserve to be loved.,Love what you do.,Time waits for no one.,Don’t waste your youth.,Pain past is pleasure.,United we stand.,Envy and wrath shorten life.,Life is all about timing.".components(separatedBy: ",")
    
    @State private var type: ATUnitType = .letters
    
    public init() {}
    public var body: some View {
        GeometryReader { proxy in
            VStack(alignment: .leading) {
                Spacer()
                AnimateText<E>($text, type: type)
                    .font(.largeTitle) // remember that if you change the font, you should change the size of wordWidth in struct "AnimateText"
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue.opacity(0.1))
                            .frame(height: 300) // modify this if you need
                    )
                    .padding(.leading)
                    .padding(.trailing)
                Spacer()
                Divider().padding()
                HStack {
                    Spacer()
                    Button {
                        type = .letters
                        text = self.words[Int.random(in: (0..<self.words.count))]
                    } label: {
                        Text("Letters")
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    
                    Button {
                        type = .words
                        text = self.sentence[Int.random(in: (0..<self.sentence.count))]
                    } label: {
                        Text("Words")
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(8)
                    }
                    
                    Spacer()
                }
                .buttonStyle(PlainButtonStyle())
                Spacer()
            }
        }
        .onAppear {
            self.text = "Animate Text"
        }
    }
}

struct ATPreviewAnimateText_Previews: PreviewProvider {
    @State static var text = "Preview AnimateText"
    static var previews: some View {
        ATAnimateTextPreview<ATOpacityEffect>()
    }
}
