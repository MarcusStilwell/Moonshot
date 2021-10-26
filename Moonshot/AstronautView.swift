//
//  AstronautView.swift
//  Moonshot
//
//  Created by Marcus Stilwell on 10/26/21.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var missions: [Mission]
    
    init(astronaut: Astronaut, missions: [Mission]) {
        let allMissions: [Mission] = Bundle.main.decode("missions.json")
        self.astronaut = astronaut
        
        var matches = [Mission]()
        
        for mission in allMissions {
            if let _ = mission.crew.first(where: {$0.name == astronaut.id}) {
                matches.append(mission)
            }
        }
        self.missions = matches
    }

    
    var body: some View {
        GeometryReader{ geometry in
            ScrollView(.vertical){
                VStack{
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                        .layoutPriority(1)

                    ForEach(self.missions){ mission in
                        HStack{
                            Image(mission.image)
                                .resizable()
                                .frame(width: 86, height: 86)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                        }
                    }
                }
            }
            .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
        }
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let mission: [Mission] = Bundle.main.decode("missions.json")
    
    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: mission)
    }
}
