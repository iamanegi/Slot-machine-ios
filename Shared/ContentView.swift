//
//  ContentView.swift
//  Shared
//
//  Created by Aman Negi on 05/09/22.
//

import SwiftUI

struct ContentView: View {
    
    let allowedAttempts = 3
    @State public var symbols = ["eating","happy","love","scary","sleeping"]
    @State public var numbers = [0, 1, 2, 3, 4]
    @State public var counter = 0
    @State private var showingAlert : Choice?
    
    var body: some View {
        ZStack{
            Image("sunshine").resizable().ignoresSafeArea()
            
            VStack(alignment: .center, spacing: 80){
                VStack(alignment: .center, spacing: 25) {
                    HStack{
                        Image("fire").resizable().scaledToFit()
                            .shadow(color: .orange, radius: 1, y: 3)
                        Text("Slot Machine").font(.system(size: 30))
                            .fontWeight(.black)
                            .shadow(color: .orange, radius: 1, y: 3)
                        Image("fire").resizable().scaledToFit()
                            .shadow(color: .orange, radius: 1, y: 3)
                    }.frame(width: .infinity, height: 50, alignment: .center)
                    
                    Text("Attempts left : \(allowedAttempts - counter)").fontWeight(.black).font(.title3)
                }
                
                
                VStack(spacing: 15){
                    
                    HStack(spacing: 35){
                        Hexagon().fill(Color.white.opacity(0.8))
                            .frame(width: 100, height: 120, alignment: .center)
                            .overlay(
                                Image(symbols[numbers[0]]).resizable().scaledToFit()
                                .frame(width: 80, height: 70, alignment: .center)
                                .shadow(color: .gray, radius: 4, x: 4, y: 5)
                            )
                        Hexagon().fill(Color.white.opacity(0.8))
                            .frame(width: 100, height: 120, alignment: .center)
                            .overlay(
                                Image(symbols[numbers[1]]).resizable().scaledToFit()
                                .frame(width: 80, height: 70, alignment: .center)
                                .shadow(color: .gray, radius: 4, x: 4, y: 5)
                            )
                    }
                   
                    Hexagon().fill(Color.white.opacity(0.8))
                        .frame(width: 100, height: 120, alignment: .center)
                        .overlay(
                            Image(symbols[numbers[2]]).resizable().scaledToFit()
                            .frame(width: 80, height: 70, alignment: .center)
                            .shadow(color: .gray, radius: 4, x: 4, y: 5)
                        )
                    
                    HStack(spacing: 35){
                        Hexagon().fill(Color.white.opacity(0.8))
                            .frame(width: 100, height: 120, alignment: .center)
                            .overlay(
                                Image(symbols[numbers[3]]).resizable().scaledToFit()
                                .frame(width: 80, height: 70, alignment: .center)
                                .shadow(color: .gray, radius: 4, x: 4, y: 5)
                            )
                        Hexagon().fill(Color.white.opacity(0.8))
                            .frame(width: 100, height: 120, alignment: .center)
                            .overlay(
                                Image(symbols[numbers[4]]).resizable().scaledToFit()
                                .frame(width: 80, height: 70, alignment: .center)
                                .shadow(color: .gray, radius: 4, x: 4, y: 5)
                            )
                    }
                    
                    Button {
                        self.numbers[0] = Int.random(in: 0..<self.symbols.count)
                        self.numbers[1] = Int.random(in: 0..<self.symbols.count)
                        self.numbers[2] = Int.random(in: 0..<self.symbols.count)
                        self.numbers[3] = Int.random(in: 0..<self.symbols.count)
                        self.numbers[4] = Int.random(in: 0..<self.symbols.count)
                        
                        counter += 1
                        
                        let tempSet = Set(numbers)
                        if tempSet.count == 1 {
                            self.showingAlert = .success
                            counter = 0
                        }
                        
                        if counter >= allowedAttempts {
                            self.showingAlert = .failure
                            counter = 0
                        }
                        
                    } label: {
                        RoundedRectangle(cornerRadius : 10).fill(Color("color_yellow"))
                            .overlay(Text("Spin").fontWeight(.black).font(.title2))
                            .foregroundColor(.black)
                            .frame(width: 200, height: 40, alignment: .center)
                            .shadow(color: .gray, radius: 1, y: 4)
                    }.padding()

                }
            }.alert(item: $showingAlert) { alert -> Alert in
                switch alert{
                case .success:
                    return Alert(title: Text("Yeah! You Won."), message: Text("Born with charm."), dismissButton: .cancel())
                case .failure:
                    return Alert(title: Text("You Lost!"), message: Text("Better luck next time."), dismissButton: .cancel())
                }
            }
        }
    }
}

enum Choice: Int, Identifiable {
    var id: Int {
        rawValue
    }
    case success, failure
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
