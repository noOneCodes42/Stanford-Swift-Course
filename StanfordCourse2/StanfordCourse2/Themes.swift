//
//  Themes.swift
//  StanfordCourse2
//
//  Created by Neel Arora on 11/2/24.
//

import Foundation
struct Theme: CustomDebugStringConvertible{
    var debugDescription: String{
        return "name: \(name), emojis: \(emojis), numberOfPairs: \(numberOfPairs), color: \(color)"
    }
    let name: String
    let emojis: [String]
    let numberOfPairs: Int
    let color: String
    var randomized: Bool = false
}

let themes1: [Theme] = [
    Theme(name: "Christmas Theme", emojis: ["🎅","❄️","☃️","🎄"], numberOfPairs: 4, color: "green"),
    Theme(name: "Halloween Theme", emojis: ["👻","🎃","😈","🕷️","💀","🕸️","🧙","🙀","👹","😱","☠️","🍭"], numberOfPairs: 9, color: "red"),
    Theme(name: "Water Theme", emojis: ["🌊","🎣","🦈", "🏄", "🐬","🐋", "🛁"], numberOfPairs: 7, color: "blue"),
    Theme(name: "Objects Theme", emojis: ["🚗","🚛","🚜","🚝","🚞","🚟","🚠","🚡","🚢","🚣","🚤","🚥","🚦","🚧","🚨","🚩","🚪","🚫","🚬","🚭","🚮"], numberOfPairs: 9, color: "cyan"),
    Theme(name: "Symbols Theme", emojis: ["⌘", "⛏", "⛓", "⛕", "⛖", "⛗", "⛘", "⛙", "⛚", "⛛", "⛜", "⛝", "⛞", "⛟", "⛠", "⛡", "⛢", "⛣", "⛤", "⛥", "⛦",], numberOfPairs: 12, color: "yellow", randomized: true),
    Theme(name: "Emojis Theme", emojis: ["🙃","😂","😃","😄","😅","😆","😉","😊","😋","😎","😍","😘","🥰","👦","👧","👨‍👩‍�"], numberOfPairs: 6, color: "brown"),
    Theme(name: "Flags Theme", emojis: ["🇮🇳","🇺🇸","🇦🇺","🇬🇧","🇨🇦","🇮🇹","🇷🇺","🇦🇪","🇸🇦","🇦🇷","🇧🇸","🇧🇩","🇧🇿","🇨🇻","🇰🇷","🇲🇲","🇲🇳","🇳🇱","🇵🇰","🇸🇬","🇿🇦","🇹🇷","🇺🇬","🇻🇳","🇼🇸","🇾🇪","🇿🇼"], numberOfPairs: 10, color: "orange"),
    Theme(name: "Animal Theme", emojis: ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐽","🐸","🐵","🙈","🙉","🙊","🐔","🐑","🐚","🐛","🐞","🐜","🐟","🐠","🐡","🐢"], numberOfPairs: 15, color: "pink")
    ]

