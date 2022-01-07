//
//  ContentView.swift
//  Omnitrix2 WatchKit Extension
//
//  Created by Amol Kumar on 2022-01-07.
//

import SwiftUI

enum Aliens: Int {
    case none
    case Diamondhead
    case Cannonbolt
    case XLR8
    case Fireblast
    case Fourarms
    case GrayMatter
    case Ripjaws
    case Upgrade
    case Wildmutt
    case Stinkfly
}

struct ContentView: View {
    @State var scrollAmount = 0.0
    
    var body: some View {
        ZStack {
            Image("Watchface")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .rotationEffect(.degrees(scrollAmount*90))
            
            Rectangle()
                .frame(width: 110, height: 110)
                .foregroundColor(Color.init(red: 0.73, green: 0.93, blue: 0.33, opacity: scrollAmount==0 ? 0 : 1))
                .rotationEffect(.degrees(45))
                .scaleEffect(x: 0.6, y: 1)
                .mask(Circle())
                .animation(.easeInOut.delay(0.2))
            
            Image("\(Aliens(rawValue: Int(scrollAmount))!)")
                .resizable()
                .padding(.all, 40)
                .aspectRatio(contentMode: .fit)
            
            Rectangle()
                .frame(width: 115, height: 115)
                .foregroundColor(Color.init(red: 0.73, green: 0.93, blue: 0.33, opacity: scrollAmount==0 ? 1 : 0))
                .border(Color.black, width: 5)
                .rotationEffect(.degrees(45))
                .scaleEffect(y: 1.5)
                .offset(x: scrollAmount==0 ? 90 : 30)
                .mask(Circle())
                .animation(.easeInOut)


            Rectangle()
                .frame(width: 115, height: 115)
                .foregroundColor(Color.init(red: 0.73, green: 0.93, blue: 0.33, opacity: scrollAmount==0 ? 1 : 0))
                .border(Color.black, width: 5)
                .rotationEffect(.degrees(45))
                .scaleEffect(y: 1.5)
                .offset(x: scrollAmount==0 ? -90 : -30)
                .mask(Circle())
                .animation(.easeInOut)
        }
        .offset(y: 15)
        .focusable(true)
        .digitalCrownRotation($scrollAmount, from: 0, through: 10, by: 1, sensitivity: .low, isContinuous: false, isHapticFeedbackEnabled: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
