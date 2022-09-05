//  Stanford CS193p Assignment 1 (Extra Work included)
//  ContentView.swift
//  Memorize
//
//  Created by Lukas Hering on 02.08.22.
//

import SwiftUI

// list of all the possilble emojis, that can appear on the Memorycards
struct ContentView: View {
    @State var emojis = ["🚲", "🚂", "🚁", "🚜", "🚕","🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    var vehicles = ["🚲", "🚂", "🚁", "🚜", "🚕","🏎", "🚑", "🚓", "🚒", "✈️", "🚀", "⛵️", "🛸", "🛶", "🚌", "🏍", "🛺", "🚠", "🛵", "🚗", "🚚", "🚇", "🛻", "🚝"]
    var flags = ["🇺🇸" ,"🇩🇪" ,"🇬🇧" ,"🇦🇺" ,"🇯🇵" ,"🇹🇭" ,"🇵🇸" ,"🇧🇷" ,"🇦🇫" ,"🇨🇳" ,"🇫🇷" ,"🇮🇷" ,"🇳🇬" ,"🇹🇷" ,"🇵🇹" ,"🇨🇷" ,"🇪🇹" ,"🇪🇪"]
    var animals = ["🐆" ,"🐗" ,"🦓" ,"🐫" ,"🦌" ,"🦥" ,"🦏" ,"🦒" ,"🐺" ,"🦘" ,"🐘" ,"🦬" ,"🐅" ,"🦛"]
    
    @State var emojiCount = 24
    @State var Minimumitemsize = 55
    

    

// Design of the Memorygame
    var body: some View {

        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView{LazyVGrid(columns: [GridItem(.adaptive(minimum:CGFloat(Minimumitemsize), maximum:200))]){
                ForEach(emojis[0..<emojiCount], id: \.self) { emoji in CardView(content: emoji)
                        .aspectRatio(2/3, contentMode: .fit)
                        }
                    }
                }.foregroundColor(.red)
            Spacer()
            HStack{
                Spacer()
                vehicleMemory
                Spacer()
                flagMemory
                Spacer()
                animalMemory
                Spacer()
            }
        }
        .padding(.horizontal)
    }
   
// Theme changing buttons
    var vehicleMemory: some View {
        Button{
            emojiCount = Int.random(in: 4...vehicles.count)
            emojis = vehicles.shuffled()
            switch emojiCount {
            case 4: Minimumitemsize = 110
            case 5..<6: Minimumitemsize = 100
            case 6..<9: Minimumitemsize = 95
            case 9..<10: Minimumitemsize = 85
            case 10..<16: Minimumitemsize = 75
            default: Minimumitemsize = 55
            }
        } label: {
            VStack{
                Image(systemName: "car.circle") .font(.largeTitle)
                Text("Vehicles") .font(.caption)
            }
        }
    }
    var flagMemory: some View {
        Button {
            emojiCount = Int.random(in: 4...flags.count)
            emojis = flags.shuffled()
            switch emojiCount {
            case 4: Minimumitemsize = 110
            case 5..<6: Minimumitemsize = 100
            case 6..<9: Minimumitemsize = 95
            case 9..<10: Minimumitemsize = 85
            case 10..<16: Minimumitemsize = 75
            default: Minimumitemsize = 55
            }
        } label: {
            VStack{
                Image(systemName: "globe.europe.africa") .font(.largeTitle)
                Text("Countries") .font(.caption)
            }
            }
        }
    var animalMemory: some View {
        Button{
            emojiCount = Int.random(in: 4...animals.count)
            emojis = animals.shuffled()
            switch emojiCount {
            case 4: Minimumitemsize = 110
            case 5..<6: Minimumitemsize = 100
            case 6..<9: Minimumitemsize = 95
            case 9..<10: Minimumitemsize = 85
            case 10..<16: Minimumitemsize = 75
            default: Minimumitemsize = 55
            }
        } label: {
            VStack{
                Image(systemName: "pawprint.circle") .font(.largeTitle)
                Text("Animals") .font(.caption)
            }
        }
    }


// single Carddesign
struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp{
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
    






struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
}
