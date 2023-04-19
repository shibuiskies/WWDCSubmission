//
//  PopUp.swift
//  WWDC2023
//
//  Created by Aysha Hafizhatul on 19/04/23.
//

import SwiftUI

struct PopUp: View {
    
    let Affirmations = ["You are worthy of love and support", "You deserve happiness and peace", "Your feelings & thoughts are valid", "Everything is going to be alright", "You are enough", "Be gentle with yourself"]
    
    var body: some View {

            //MARK: Pop Up BG
            ZStack{
                Rectangle()
                    .frame(width: 687, height: 897)
                    .foregroundColor(Color("LightBlue"))
                    .cornerRadius(45)
                    .shadow(radius: 20)
                
                //MARK: Pop Up
                    VStack{
                        Text("Yaay! You did it!")
                            .font(.system(size: 75, weight: .bold))
                            .foregroundColor(Color("Black"))
                            .padding(.top, 160)
                        Spacer()
                        Text("\(Affirmations.randomElement()!)")
                            .font(.system(size: 60))
                            .frame(width: 600)
                            .multilineTextAlignment(.center)
                            .padding(.bottom, 140)
                        
                        //MARK: Navigation Button
                        NavigationLink(destination: HomepageView()
                            .navigationBarBackButtonHidden(true)){
                           Text("Back to Home")
                        }
                        .font(.system(size: 36, weight: .semibold))
                        .foregroundColor(Color("LightBlue"))
                        .frame(maxWidth: 392, maxHeight: 90)
                        .background(Color("DarkBlue"))
                        .cornerRadius(45)
                        .padding(.bottom, 130)
                    }
            }
        
            .frame(width: 687, height: 897)
    }
}
struct PopUp_Previews: PreviewProvider {
    static var previews: some View {
        PopUp()
    }
}
