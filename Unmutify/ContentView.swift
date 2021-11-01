//
//  ContentView.swift
//  Unmutify
//
//  Created by Dhanraj Chavan on 31/10/21.
//

import SwiftUI
import AVFoundation


struct ContentView: View {
    
    
    var body: some View {
        NavigationView {
            
            GeometryReader { geo in
                VStack(alignment: .center) {
                    
                    LottieView(name: "translator", loopMode: .loop)
                        .frame(width: geo.size.width * 0.7, height: geo.size.width * 0.7)
                        .padding()
                    
                    Text("Unmutify")
                        .font(.largeTitle)
                        .bold()
                        .padding([.top, .horizontal])
                    
                    Text("Helping mute people to talk")
                        .font(.headline)
                        .bold()
                        .padding(.top, 3)
                    
                    HStack {
                        Spacer()
                        VStack{
                            NavigationLink(destination: view3(geo:geo)) {
                                buttonView(text: "Emoji to Audio", geo: geo)
                            }
                            NavigationLink(destination: view2(geo:geo)) {
                                buttonView(text: "Text to Audio", geo: geo)
                                    .padding(.top, 3)
                            }
                        }.padding().padding(.bottom)
                        Spacer()
                    }
                    Spacer()
                }.frame(height: geo.size.height * 0.9)
            }
            
            .navigationTitle("")
        }
        
    }
}

struct buttonView: View {
    var text: String
    var geo: GeometryProxy
    var body: some View {
        HStack{
            Spacer()
            Text(text)
                .font(.headline)
                .bold()
                .padding()
            Spacer()
        }.frame(width: geo.size.width * 0.7, height: geo.size.height * 0.07, alignment: .center)
            .modifier(darkModeModifier())
    }
}


struct darkModeModifier: ViewModifier {
    var useDeviceS = false //tale useP.useDeviceSetting
    var viewMode = 0 //take selectedViewModeP.selctedViewMode
    
    @Environment(\.colorScheme) var colorScheme
    func body(content: Content) -> some View {
        return content
            .background(colorScheme == .dark ? Color(red: 0.13, green: 0.13, blue: 0.13, opacity: 1.0): Color(red: 0.949, green: 0.949, blue: 0.968, opacity: 1.0))
            .cornerRadius(8)
    }
}
