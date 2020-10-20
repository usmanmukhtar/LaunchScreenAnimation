//
//  ContentView.swift
//  ChainAnimation
//
//  Created by Usman Mukhtar on 19/10/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var animate: Bool = false
    var body: some View {
        ZStack{
            
            ZStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .offset(y: animate ? -100 : 0)
            }
            
            VStack {
                HStack {
                    Spacer()
                    
                    Image("Circle")
                        .resizable()
                        .frame(width: 300, height: 300)
                        .offset(x: animate ? 300 : 150, y: animate ? -300 : -150)
                }
                
                Spacer()
                
                HStack {
                    
                    Image("Circle")
                        .resizable()
                        .frame(width: 400, height: 400)
                        .offset(x: animate ? -500 : -150, y: animate ? 500 : 150)
                    
                    
                    Spacer()
                }
            }
            
            ZStack(alignment: .bottom){
                
                GeometryReader { g in
                    VStack (alignment: .leading, spacing: 20){
                        Text("Welcome")
                            .font(.title)
                            .fontWeight(.semibold)
                            .padding(.top, 20)
                        
                        Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed interdum volutpat lorem vel mollis. Aliquam erat volutpat. Vivamus gravida imperdiet pharetra.")
                        
                        HStack {
                            Button(action: {}) {
                                Text("Sign In")
                                    .padding(20)
                                    .foregroundColor(.white)
                                    .background(Color.black)
                                    .clipShape(Capsule())
                            }
                            
                            
                            Button(action: {}) {
                                Text("Sign Up")
                                    .padding(20)
                                    .foregroundColor(.black)
                                    .background(Color.white)
                                    .clipShape(Capsule())
                            }
                            
                            Spacer()
                        }
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 20)
                    .background(Color.yellow)
                    .clipShape(CustomShape(leftCorner: .topLeft, rightCorner: .topRight, radii: 16))
                    .offset(y: animate ? g.size.height : UIScreen.main.bounds.height)
                    
                }
                
            }.frame(height: 300)
        }
        .frame(maxWidth: .infinity)
        .edgesIgnoringSafeArea(.all)
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                withAnimation(Animation.easeOut(duration: 0.45)){
                    animate.toggle()
                }
            }
        })
    }
}

struct CustomShape: Shape {
    var leftCorner: UIRectCorner
    var rightCorner: UIRectCorner
    var radii: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [leftCorner, rightCorner], cornerRadii: CGSize(width: radii, height: radii))
        
        return Path(path.cgPath)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
