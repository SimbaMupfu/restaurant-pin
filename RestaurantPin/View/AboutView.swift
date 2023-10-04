//
//  AboutView.swift
//  RestaurantPin
//
//  Created by Simbarashe Mupfururirwa on 2023/10/04.
//

import SwiftUI

struct AboutView: View {
    
    @State private var link: WebLink?
    
    var body: some View {
        NavigationStack {
            List {
                Image("about")
                    .resizable()
                    .scaledToFit()
                
                Section {
                    Link(destination: URL(string: WebLink.rateUs.rawValue)!, label: {
                        Label("Rate us on App Store", image: "store")
                            .foregroundColor(.primary)
                    })
                }
                
                Section {
                    Label("X", image: "twitter")
                        .onTapGesture {
                            link = .twitter
                        }
                    
                    Label("Instagram", image: "instagram")
                        .onTapGesture {
                            link = .instagram
                        }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.automatic)
            .sheet(item: $link) { item in
                if let url = URL(string: item.rawValue) {
                    SafariView(url: url)
                }
            }
        }
    }
    
    enum WebLink: String, Identifiable {
        case rateUs = "https://www.apple.com/ios/app-store"
        case twitter = "https://www.x.com"
        case instagram = "https://www.instagram.com"
        
        var id: UUID {
            UUID()
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
