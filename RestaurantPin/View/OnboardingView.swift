//
//  OnboardingView.swift
//  RestaurantPin
//
//  Created by Simbarashe Mupfururirwa on 2023/10/04.
//

import SwiftUI

struct OnboardingView: View {
    
    let pageHeadings = ["CREATE YOUR OWN FOOD GUIDE", "SHOW YOU THE LOCATION", "DISCOVER GREAT RESTAURANTS"]
    let pageSubHeadings = ["Pin your favorite restaurants and create your own food guide", "Search and locate your favorite restaurant on Maps", "Find restaurants shared by your friends and other foodies"]
    let pageImages = ["onboarding-1", "onboarding-2", "onboarding-3"]
    
    @State private var currentPage = 0
    @Environment(\.dismiss) var dismiss
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemIndigo
        UIPageControl.appearance().pageIndicatorTintColor = .lightGray
    }
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(pageHeadings.indices, id: \.self) { index in
                    OnboardingPage(image: pageImages[index], heading: pageHeadings[index], subHeading: pageSubHeadings[index])
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
            .animation(.default, value: currentPage)
            
            VStack(spacing: 20) {
                Button(action: {
                    if currentPage < pageHeadings.count - 1 {
                        currentPage += 1
                    }else {
                        dismiss()
                    }
                }){
                    Text(currentPage == pageHeadings.count - 1 ? "GET STARTED" : "NEXT")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 50)
                        .background(Color(.systemIndigo))
                        .cornerRadius(25)
                }
                
                if currentPage < pageHeadings.count - 1 {
                    Button(action: {
                        dismiss()
                    }){
                        Text("Skip")
                            .font(.headline)
                            .foregroundColor(Color(.darkGray))
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

struct OnboardingPage: View {
    
    let image: String
    let heading: String
    let subHeading: String
    
    var body: some View {
        VStack(spacing: 70) {
            Image(image)
                .resizable()
                .scaledToFit()
            
            VStack(spacing: 10) {
                Text(heading)
                    .font(.headline)
                
                Text(subHeading)
                    .font(.body)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal, 40)
            
            Spacer()
        }
        .padding(.top)
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
        
        OnboardingPage(image: "onboarding-1", heading: "CREATE YOUR OWN FOOD GUIDE", subHeading: "Pin your favorite restaurants and create your own food guide")
        .previewLayout(.sizeThatFits)
        .previewDisplayName("TutorialPage")
    }
}