import SwiftUI
import AVKit

struct ContentView: View {
    
    //MARK: BGM
    @State private var isMuted = false
    @State var audioPlayer: AVAudioPlayer!
    
    //MARK: Animation
    @State var startAnimation: Bool = false

    //MARK: Timer
    @State var time = 1
    
    //MARK: Pop UP
    @State var isOverlay: Bool = false
    
    @State var breathing: String = "Inhale"
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
    
        //MARK: BG
        ZStack{
            Image(uiImage: UIImage(named: "Background")!)
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
                //MARK: Music
                .onAppear {
                    let sound = Bundle.main.path(forResource: "LazyWalk", ofType: "mp3")
                    self.audioPlayer = try! AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
                    self.audioPlayer.play()
                }

            //MARK: Text
            VStack{
                Text("\(breathing)")
                    .font(.system(size: 80, weight: .bold))
                    .padding(.bottom, 50)
                
                //MARK: AnimationView
                    VStack{
                        
                        Image("Livy2")
                            .resizable()
                            .frame(width: 350, height: 288.05)
                    
                    .scaleEffect(startAnimation ? 0.5 : 1)
                    .onReceive(timer){ t in
                        if self.time == 1 {
                            withAnimation(.easeIn(duration: 4)) {
                                startAnimation.toggle()
                                withAnimation(.easeOut(duration: 8).delay(11)) {
                                    startAnimation.toggle()
                                }
                            }
                        }
                    }
                                    }
                .onAppear {
                            Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                                self.time += 1
                                print(self.time)
                                if self.time  == 1{
                                    self.breathing = "Inhale"
                                    print("Inhale")
                                }
                                
                                else if self.time == 6{
                                    self.breathing = "Hold"

                                } else if self.time == 13{
                                    self.breathing = "Exhale"
                                } else if self.time == 20 {
                                    self.time = 1
                                }
                            }
                        }
        }
                                    .font(.system(size: 50, weight: .light))
                                    .padding(.top, 100)

            //MARK: PopUp Button
            Button {
                isOverlay.toggle()
            } label: {
                Text(
                    "Finish Breathe")
                    .font(.system(size: 36, weight: .semibold))
                    .frame(width: 392, height: 90)
            }
            
            .background(Color("DarkBlue"))
            .foregroundColor(Color("LightBlue"))
            .cornerRadius(45)
            .padding(.top, 800)
                            }
        .overlay {
            if isOverlay {
                PopUp()
            }
        }
        }
    }
        struct ContentView_Previews: PreviewProvider {
            static var previews: some View {
                ContentView()
            }
        }

