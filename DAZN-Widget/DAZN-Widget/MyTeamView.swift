//
//  ContentView.swift
//  DAZN-Widget
//
//  Created by Mariano Piscitelli on 21/03/22.
//

import SwiftUI

struct MyTeamView: View {
    
    @State private var showWebView = false
    @State private var selectedURL: URL?
    
    func countDownString(from date: Date) -> String {
        let calendar = Calendar(identifier: .gregorian)
        let components = calendar
            .dateComponents([.day, .hour, .minute, .second],
                            from: nowDate,
                            to: referenceDate)
        return String(format: "%02d:%02d:%02d",
                      //                       components.day ?? 00,
                      components.hour ?? 00,
                      components.minute ?? 00,
                      components.second ?? 00)
    }
    
    @State var nowDate: Date = Date()
    let referenceDate: Date = Date() + 10000
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    
    let lightGreyColor = Color(red: 8.0/255.0, green: 23.0/255.0, blue: 29.0/255.0, opacity: 1.0)
    
    var body: some View {
        VStack{
            ZStack{
                Rectangle()
                    .frame(width: .infinity, height: UIScreen.main.bounds.height*0.112)
                    .foregroundColor(lightGreyColor)
                
                HStack(alignment: .center){
                    
                    Button {
                        selectedURL = URL(string: "https://www.dazn.com/it-IT/home")
                        showWebView.toggle()
                    } label: {
                        Image("logo")
                            .resizable()
                            .frame(width: 45, height: 45)
                            .scaledToFill()
                            .background(Color(red: 8.0/255.0, green: 23.0/255.0, blue: 29.0/255.0, opacity: 1.0))
                    }
        .sheet(isPresented: $showWebView) {
                    if let url = selectedURL {
//                        Rectangle()
//                            .frame(width: .infinity, height: 20)
//                            .foregroundColor(.yellow)
//                            .padding(.top, 10)
//                                .position(x: 208, y: 809)
                        WebView(url: url)
            }
                }
                   
                    
                    
                    Spacer()
                    
                    Text("MILAN")
                        .font(.system(size: 23.0, weight: .regular, design: .rounded))
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Image(systemName: "airplayvideo")
                        .foregroundColor(.white)
                        .font(.system(size:25))
                }
                .padding(.trailing, 10)
                .padding(.leading, 10)
                .padding(.top, 47)
                
            }
            
            ZStack{
                
                Image("partita3")
                    .resizable()
                    .scaledToFit()
                
                Text(countDownString(from: referenceDate))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .font(.system(size:24))
                    .padding(.bottom, 30)
                    .onAppear(perform: {
                        _ = self.timer
                    })
                
                Text("20:45")
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .font(.system(size: 12, weight: .regular, design: .rounded))
                    .padding(.top, 20)
                
                Text("ATALANTA - MILAN")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .font(.system(size: 15, weight: .regular, design: .rounded))
                    .padding(.top, 85)
                    .padding(.trailing, 225)
                
                Text("Serie A")
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .font(.system(size: 13, weight: .regular, design: .rounded))
                    .padding(.top, 120)
                    .padding(.trailing, 321)
                
            }
            
            VStack{
                
                Rectangle()
                    .frame(width: UIScreen.main.bounds.width*0.112, height: UIScreen.main.bounds.height*0.001)
                    .opacity(0)
                
                HStack{
                    Text("NEXT MATCHES")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .regular, design: .rounded))
                        .fontWeight(.medium)
                        .padding(.trailing, 210)
                }
                
                ScrollView(.vertical){
                    
                    VStack{
                        
                        Rectangle()
                            .frame(width: 10, height: 2)
                            .opacity(0)
                        
                        Text("31° Match Day")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular, design: .rounded))
                            .fontWeight(.medium)
                        HStack{
                            
                            Rectangle()
                                .frame(width: 0.1, height: 10)
                            
                            VStack{
                                Text("02/04/2022")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .font(.system(size:13))
                                
                                Text("15:00")
                                    .foregroundColor(.white)
                                    .padding(.trailing, 42.5)
                                    .font(.system(size:13))
                            }
                            .padding(.top, 15)
                            
                            Text("MILAN")
                                .foregroundColor(.white)
                            
                            Image("milan")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            
                            Text("-")
                                .foregroundColor(.white)
                            
                            Image("fiorentina")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            
                            Text("FIORENTINA")
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                        }
                        
                        Rectangle()
                            .frame(width: 200, height: 2)
                            .opacity(0)
                        
                        Rectangle()
                            .frame(width: 180, height: 1)
                            .foregroundColor(.white)
                    }
                    VStack{
                        
                        Rectangle()
                            .frame(width: 10, height: 2)
                            .opacity(0)
                        
                        Text("32° Match Day")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular, design: .rounded))
                            .fontWeight(.medium)
                        HStack{
                            
                            Rectangle()
                                .frame(width: 0.1, height: 10)
                            
                            VStack{
                                Text("09/04/2022")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .font(.system(size:13))
                                
                                Text("20:45")
                                    .foregroundColor(.white)
                                    .padding(.trailing, 42.5)
                                    .font(.system(size:13))
                            }
                            .padding(.top, 15)
                            
                            Text("LAZIO")
                                .foregroundColor(.white)
                            
                            Image("lazio")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            
                            Text("-")
                                .foregroundColor(.white)
                            
                            Image("milan")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            
                            Text("MILAN")
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                        }
                        
                        Rectangle()
                            .frame(width: 200, height: 2)
                            .opacity(0)
                        
                        Rectangle()
                            .frame(width: 180, height: 1)
                            .foregroundColor(.white)
                    }
                    VStack{
                        
                        Rectangle()
                            .frame(width: 10, height: 2)
                            .opacity(0)
                        
                        Text("33° Match Day")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular, design: .rounded))
                            .fontWeight(.medium)
                        HStack{
                            
                            Rectangle()
                                .frame(width: 0.1, height: 10)
                            
                            VStack{
                                Text("16/04/2022")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .font(.system(size:13))
                                
                                Text("20:45")
                                    .foregroundColor(.white)
                                    .padding(.trailing, 42.5)
                                    .font(.system(size:13))
                            }
                            .padding(.top, 15)
                            
                            Text("INTER")
                                .foregroundColor(.white)
                            
                            Image("inter")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            
                            Text("-")
                                .foregroundColor(.white)
                            
                            Image("milan")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            
                            Text("MILAN")
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                        }
                        
                        Rectangle()
                            .frame(width: 200, height: 2)
                            .opacity(0)
                        
                        Rectangle()
                            .frame(width: 180, height: 1)
                            .foregroundColor(.white)
                    }
                    VStack{
                        
                        Rectangle()
                            .frame(width: 10, height: 2)
                            .opacity(0)
                        
                        Text("34° Match Day")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular, design: .rounded))
                            .fontWeight(.medium)
                        HStack{
                            
                            Rectangle()
                                .frame(width: 0.1, height: 10)
                            
                            VStack{
                                Text("20/04/2022")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .font(.system(size:13))
                                
                                Text("18:00")
                                    .foregroundColor(.white)
                                    .padding(.trailing, 42.5)
                                    .font(.system(size:13))
                            }
                            .padding(.top, 15)
                            
                            Text("MILAN")
                                .foregroundColor(.white)
                            
                            Image("milan")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            
                            Text("-")
                                .foregroundColor(.white)
                            
                            Image("empoli")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            
                            Text("EMPOLI")
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                        }
                        
                        Rectangle()
                            .frame(width: 200, height: 2)
                            .opacity(0)
                        
                        Rectangle()
                            .frame(width: 180, height: 1)
                            .foregroundColor(.white)
                    }
                    VStack{
                        
                        Rectangle()
                            .frame(width: 10, height: 2)
                            .opacity(0)
                        
                        Text("35° Match Day")
                            .foregroundColor(.white)
                            .font(.system(size: 18, weight: .regular, design: .rounded))
                            .fontWeight(.medium)
                        HStack{
                            
                            Rectangle()
                                .frame(width: 0.1, height: 10)
                            
                            VStack{
                                Text("28/04/2022")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .font(.system(size:13))
                                
                                Text("20:00")
                                    .foregroundColor(.white)
                                    .padding(.trailing, 42.5)
                                    .font(.system(size:13))
                            }
                            .padding(.top, 15)
                            
                            Text("NAPOLI")
                                .foregroundColor(.white)
                            
                            Image("napoli")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            
                            Text("-")
                                .foregroundColor(.white)
                            
                            Image("milan")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                            
                            Text("MILAN")
                                .foregroundColor(.white)
                            
                            Spacer()
                            
                        }
                        
                        Rectangle()
                            .frame(width: 200, height: 2)
                            .opacity(0)
                        
//                        Rectangle()
//                            .frame(width: 180, height: 1)
//                            .foregroundColor(.white)
                    }
                    
                }
                
            }
            
            Spacer()
            
        }
        .ignoresSafeArea()
        .backgroundImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyTeamView()
    }
}
