//
//  ContentView.swift
//  AnimateTextExample
//
//  Created by jasu on 2022/02/05.
//  Copyright (c) 2022 jasu All rights reserved.
//

import SwiftUI
import AnimateText

struct ContentView: View {
    
    @State private var unitType: ATUnitType = .letters
    
    let words = "Labyrinth,Ineffable,Incendiary,Ephemeral,Cynosure,Propinquity,Infatuation,Incandescent,Eudaemonia,Raconteur,Petrichor,Sumptuous,Aesthete,Nadir,Miraculous,Lassitude,Gossamer,Bungalow,Aurora,Inure,Mellifluous,Euphoria,Cherish,Demure,Elixir,Eternity,Felicity,Languor,Love,Solitude,Epiphany,Quintessential,Plethora,Nemesis,Lithe,Tranquility,Elegance,Renaissance,Eloquence,Sequoia,Peace,Lullaby,Paradox,Pristine,Effervescent,Opulence,Ethereal,Sanguine,Panacea,Bodacious,Axiom,Silhouette,Surreptitious,Ingenue,Dulcet,Tryst,Ebullience".components(separatedBy: ",")
    let sentence = "Don’t dwell on the past.,Believe in yourself.,Follow your heart.,Seize the day.,You only live once.,Past is just past.,Love yourself.,Don’t beat yourself up.,Life is a journey.,No Pain,No gain,No sweat,The die is cast.,When they go low,A friend is a second myself.,Appearances are deceptive.,Be brave.,Every cloud has a silver lining.,Don’t judge a book by its cover.,Hang in there.,This is how life is.,Live positive.,Seeing is believing.,He can do, She can do,Why not me,If not now,then when?,Respect individual.,Habit is a second nature.,Time is gold.,You deserve to be loved.,Love what you do.,Time waits for no one.,Don’t waste your youth.,Pain past is pleasure.,United we stand.,Envy and wrath shorten life.,Life is all about timing.".components(separatedBy: ",")
    
    let customUserInfo: [String : Any] = ["color": Color.accentColor]
    let typeUserInfo: [String : Any] = ["base": "-"]
    
    var content: some View {
        Group {
            Group {
                TapAnimateTextView<CustomEffect>(type: unitType, elements: getElements(), userInfo: customUserInfo)
            }
            Group {
                TapAnimateTextView<ATRandomTypoEffect>(type: unitType, elements: getElements())
                TapAnimateTextView<ATTypoEffect>(type: unitType, elements: getElements(), userInfo: typeUserInfo)
                TapAnimateTextView<ATPaperEffect>(type: unitType, elements: getElements())
                TapAnimateTextView<ATChainEffect>(type: unitType, elements: getElements())
                TapAnimateTextView<ATChimeBellEffect>(type: unitType, elements: getElements())
                TapAnimateTextView<ATCurtainEffect>(type: unitType, elements: getElements())
                TapAnimateTextView<ATDropEffect>(type: unitType, elements: getElements())
                TapAnimateTextView<ATHangEffect>(type: unitType, elements: getElements())
                TapAnimateTextView<ATSpringEffect>(type: unitType, elements: getElements())
                TapAnimateTextView<ATTwistEffect>(type: unitType, elements: getElements())
            }
            Group {
                TapAnimateTextView<ATOpacityEffect>(type: unitType, elements: getElements())
                TapAnimateTextView<ATRotateEffect>(type: unitType, elements: getElements())
                TapAnimateTextView<ATBlurEffect>(type: unitType, elements: getElements())
                TapAnimateTextView<ATBottomTopEffect>(type: unitType, elements: getElements())
                TapAnimateTextView<ATTopBottomEffect>(type: unitType, elements: getElements())
                TapAnimateTextView<ATOffsetEffect>(type: unitType, elements: getElements())
                TapAnimateTextView<ATScaleEffect>(type: unitType, elements: getElements())
                TapAnimateTextView<ATSlideEffect>(type: unitType, elements: getElements())
            }
        }
    }
    
    var body: some View {
#if os(iOS)
        NavigationView {
            VStack {
                Picker(selection: $unitType, content: {
                    Text("Letters").tag(ATUnitType.letters)
                    Text("Words").tag(ATUnitType.words)
                }, label: {
                    EmptyView()
                })
                    .pickerStyle(.segmented)
                    .padding()
                TabView {
                    content
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
            .navigationTitle(Text("AnimateText"))
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
#else
        VStack {
            Picker(selection: $unitType, content: {
                Text("Letters").tag(ATUnitType.letters)
                Text("Words").tag(ATUnitType.words)
            }, label: {
                EmptyView()
            })
                .pickerStyle(.segmented)
                .padding()
            List {
                content
                    .frame(height: 260)
            }
        }
        .navigationTitle(Text("AnimateText"))
        .frame(minWidth: 900, minHeight: 800)
#endif
    }
    
    private func getElements() -> [String] {
        return self.unitType == .letters ? self.words : self.sentence
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
