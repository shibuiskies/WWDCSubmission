//
//  HomepageView.swift
//  WWDC2023
//
//  Created by Aysha Hafizhatul on 12/04/23.
//

import SwiftUI
import AVKit

struct HomepageView: View {

    //MARK: BGM
    @State private var isMuted = false
    @State var audioPlayer: AVAudioPlayer!

    var body: some View {
        NavigationView{

            //MARK: BG
            ZStack{
                Image(uiImage: UIImage(named: "Background")!)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)

//MARK: Sound Button
                    VStack{
                        HStack{
                            Spacer()
                            Button (action: {
                                if self.isMuted {
                                    self.audioPlayer.setVolume(1, fadeDuration: 0.5)
                                } else {
                                    self.audioPlayer.setVolume(0, fadeDuration: 0.5)
                                }
                                self.isMuted.toggle()
                            }){
                                Image(systemName: self.isMuted ?
                                      "speaker.slash.fill" : "speaker.3.fill")
                                .font(.system(size: 55))
                                .foregroundColor(Color("Black"))
                                .padding(.bottom, 100)
                            }
                        }
                        .padding(.trailing, 40)

//MARK: Introducing
                        ZStack{
                            Image("ChatBubble")
                                .resizable()
                                .frame(width: 571, height: 409)

                            VStack{
                                Text("Hi! I'm Livy. Maybe you've been through hard times and feel bad sometimes. So, I'm here to help you with the breathing exercise^^")
                                    .font(.system(size: 40))
                                    .padding(.horizontal, 20)
                                    .padding(.bottom, 50)
                                    .multilineTextAlignment(.center)
                                    .foregroundColor(Color("Black"))
                                    .frame(width: 571, height: 409)
                            }
                        }
                        .padding(.trailing, 120)
                        
//MARK: Character
                        Image("Livy2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 370, height: 370)
                            .padding(.leading, 200)
                            .offset(y: -35)
                            .padding(.bottom)
                            .padding(.leading, 40)

                        Text("Ready to get started?")
                            .font(.system(size: 40, weight: .semibold))
                            .foregroundColor(Color("Black"))
                        
//MARK: Navigation Button
            NavigationLink(destination: ContentView()
                .navigationBarBackButtonHidden(true))
                        {
            Text("I'M READY")
                                }
            .font(.system(size: 36, weight: .semibold))
            .foregroundColor(Color("LightBlue"))
            .frame(maxWidth: 392, maxHeight: 90)
            .background(Color("DarkBlue"))
            .cornerRadius(45)
            .padding(.bottom, 80)
                        
//MARK: Music
                        .onAppear {
                            let sound = Bundle.main.path(forResource: "LazyWalk", ofType: "mp3")
                            self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                            self.audioPlayer.play()
                        }
                        }
                    .padding(.bottom, 60)
                    }

                }
        .tint(Color(.black))
        .navigationViewStyle(.stack)

            }
        }
        struct HomepageView_Previews: PreviewProvider {
            static var previews: some View {
                HomepageView()
            }
        }
