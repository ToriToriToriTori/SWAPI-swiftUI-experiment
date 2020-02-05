//
//  MenuScreen.swift
//  SWAPI-SwiftUI
//
//  Created by Tori George on 1/30/20.
//  Copyright © 2020 Tori George. All rights reserved.
//

import SwiftUI



struct MenuScreen: View {
    
    @EnvironmentObject var selectedCharacter: SelectedCharacter
    @State var results = [Character]()
    
    struct Response: Codable {
        var results: [Character]
    }
    
    func getData(){
        let urlPath = "http://swapi.co/api/people"
        let url = NSURL(string: urlPath)
        let session = URLSession.shared
        let task = session.dataTask(with: url! as URL) { data, response, error in
            if let data = data {
                if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data){
                    DispatchQueue.main.async{
                        self.results = decodedResponse.results
                        print(self.results)
                    }
                }
            }
        }
        task.resume()
    }
    
    func onPressCharacter(character: Character){
        self.selectedCharacter.selectedCharacter = character
        print("character here \(self.selectedCharacter.selectedCharacter)")
    }
    
    var body: some View {
        ZStack{
            VStack{
                Text("StarWars")
                    .font(.custom("Starjedi", size: 48))
                    .foregroundColor(.yellow)
                List(results, id: \.birth_year) { item in
                    VStack(alignment: .leading){
                        Text(item.name)
                            .font(.headline)
                        Text(item.birth_year)
                    }
                }
                .listStyle(GroupedListStyle())
            }
            
        }.onAppear {
            self.getData()
        }
    }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
    }
}
