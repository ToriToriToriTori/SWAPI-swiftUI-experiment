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
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Text("StarWars")
                    .font(.custom("Starjedi", size: 50))
                    .foregroundColor(.yellow)
                    .shadow(radius: 28)
                List(results, id: \.birth_year) { item in
                    NavigationLink(destination: CharacterScreen()){Text("hello")}
                        .opacity(0.0)
                        .frame(width: 10)
                    HStack{
                        Image(item.name).resizable()
                            .frame(width: 75.0, height: 100.0)
                        VStack(alignment: .leading) {
                                Button(action: {self.onPressCharacter(character: item)}) {
                                Text(item.name)
                                    .font(.headline).bold().italic()
                                    .foregroundColor(Color.black)
                                }
                       }
                   }
                    
            }
        }.onAppear {
            self.getData()
        }
      }
   }
}

struct MenuScreen_Previews: PreviewProvider {
    static var previews: some View {
        MenuScreen()
    }
}
