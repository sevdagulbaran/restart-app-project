//
//  HomeView.swift
//  RestartApp
//
//  Created by Sevda Gul Baran on 21.01.2023.
//

import SwiftUI

struct HomeView: View {
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = false
    @State private var isAnimating: Bool = false
    var body: some View {
        ZStack {
            Color.white.ignoresSafeArea(.all)
            
            VStack(spacing: 20.0) {
                //MARK: - header
                Spacer()
                
                ZStack {
                    CustomCircle(shapeColor: .gray, shapeOpacity: 0.1)
                    
                    Image("character-2")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .offset(y: isAnimating ? 35 : -35)
                        .animation(
                            Animation
                                .easeInOut(duration: 4)
                                .repeatForever()
                            ,value: isAnimating
                        )
                }
                //MARK: - section
                Text("The time that leads to mastery is dependent on the intensity of our focus.")
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.secondary)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                //MARK: - footer
                Button {
                    withAnimation {
                        isOnboardingViewActive = true
                    }
                } label: {
                    Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        .imageScale(.large)
                    Text("Restart")
                        .font(.system(.title3,design: .rounded))
                        .fontWeight(.bold)
                }
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)
                .controlSize(.large)
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                    isAnimating = true
                })
            }
            
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
