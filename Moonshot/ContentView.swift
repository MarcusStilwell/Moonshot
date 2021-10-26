//
//  ContentView.swift
//  Moonshot
//
//  Created by Marcus Stilwell on 10/25/21.
//

import SwiftUI



struct ContentView: View {
    var body: some View {
        let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
        let missions: [Mission] = Bundle.main.decode("missions.json")
        Text("\(astronauts.count)")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
