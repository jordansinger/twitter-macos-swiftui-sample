//
//  ContentView.swift
//  Twitter
//
//  Created by Jordan Singer on 7/5/20.
//

import SwiftUI

struct ContentView: View {
    @State var selection: Set<Int> = [0]
    
    var body: some View {
        NavigationView {
            List(selection: self.$selection) {
                Label("Home", systemImage: "house.fill")
                    .tag(0)
                Label("Explore", systemImage: "magnifyingglass")
                Label("Notifications", systemImage: "bell")
                Label("Messages", systemImage: "envelope")
                
                Divider()
                
                Label("Profile", systemImage: "person")
            }
            .listStyle(SidebarListStyle())
            .frame(minWidth: 100, idealWidth: 150, maxWidth: 200, maxHeight: .infinity)
            
            Home()
        }
    }
}

struct Home: View {
    @State var showComposeWindow = false
    var body: some View {
        Feed()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Home")
        .background(Color.white)
        .toolbar {
            ToolbarItem(placement: .status) {
                Button(action: { self.showComposeWindow = true }) {
                    Image(systemName: "square.and.pencil")
                }
                .popover(isPresented: $showComposeWindow) {
                    Compose(showComposeWindow: $showComposeWindow)
                }
            }
            
        }
    }
}

struct Feed: View {
    @State var tweets = [
        "Here’s to the crazy ones",
        "the misfits, the rebels, the troublemakers",
        "the round pegs in the square holes…",
        "the ones who see things differently — they’re not fond of rules…",
        "You can quote them, disagree with them, glorify or vilify them",
        "but the only thing you can’t do is ignore them because they change things…",
        "they push the human race forward",
        "and while some may see them as the crazy ones",
        "we see genius",
        "because the ones who are crazy enough to think that they can change the world",
        "are the ones who do."
    ]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ForEach(tweets, id: \.self) { tweet in
                    Tweet(text: tweet)
                        .padding()
                    Divider()
                }
            }
        }
    }
}

struct Tweet: View {
    @State var text: String
    var names = [
        "Jordan Singer",
        "Leo Gill",
        "June Cha",
        "Britney Cooper",
        "Andrew Kumar"
    ]
    var colors = [
        Color.red,
        Color.orange,
        Color.yellow,
        Color.green,
        Color.blue,
        Color.purple
    ]
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "person.crop.circle.fill")
                .foregroundColor(colors.randomElement())
                .opacity(0.7)
                .font(.system(size: 40))
            
            VStack(alignment: .leading, spacing: 2) {
                HStack(alignment: .firstTextBaseline) {
                    Text(names.randomElement()!)
                        .font(.title3)
                        .fontWeight(.semibold)
                    
                    Text("@username")
                        .font(.title3)
                        .foregroundColor(.secondary)
                    
                    Text("· 9:41 AM")
                        .font(.body)
                        .foregroundColor(.secondary)
                }
                
                Text(text)
                    .font(.title3)
                    .foregroundColor(.primary)
                
                HStack(spacing: 32) {
                    Image(systemName: "bubble.right")
                    Image(systemName: "arrow.2.squarepath")
                    Image(systemName: "heart")
                    Image(systemName: "square.and.arrow.up")
                }
                .padding(.top, 12)
                .font(.title3)
                .foregroundColor(.secondary)
            }
            
            Spacer()
        }
    }
}

struct Compose: View {
    @Binding var showComposeWindow: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Image(systemName: "person.crop.circle.fill")
                    .foregroundColor(Color("AccentColor"))
                    .opacity(0.7)
                    .font(.system(size: 40))
                Text("What's happening?")
                    .font(.title3)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding()
            
            Spacer()
            
            Divider()
            HStack {
                Image(systemName: "camera")
                Spacer()
                Image(systemName: "photo")
                Spacer()
                Image(systemName: "chart.bar.xaxis")
                Spacer()
                Image(systemName: "mappin.and.ellipse")
            }
            .font(.title3)
            .foregroundColor(.secondary)
            .padding()
        }
        .frame(width: 256, height: 192)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
