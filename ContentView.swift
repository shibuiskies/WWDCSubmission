import SwiftUI
//import UIKit

struct ContentView: View {
        var body: some View {

            //App Background
            ZStack{
//                Rectangle()
//                    .frame(width: .infinity, height: .infinity)
//                    .foregroundColor(.black)
//                    .opacity(0.4)
                
                Image("Background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .foregroundColor(.black)
                    .opacity(1)
                    .ignoresSafeArea()
                
                Image("ChatBubble")
                    .resizable()
                    .frame(width: 489, height: 236)
                
 //Text
//            VStack{
//                    Text("Hello!")
//                    .font(.system(size: 150))
////                                        .fontWeight(.black)
//                        .multilineTextAlignment(.center)
//                }

            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
