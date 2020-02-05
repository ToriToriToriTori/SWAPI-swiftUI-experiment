//
//  CharacterScreen.swift
//  SWAPI-SwiftUI
//
//  Created by Tori George on 2/5/20.
//  Copyright © 2020 Tori George. All rights reserved.
//

import SwiftUI

struct CharacterScreen: View {
       @EnvironmentObject var selectedCharacter: SelectedCharacter
    var body: some View {
        VStack{
            Text("\(self.selectedCharacter.selectedCharacter!.name)")
            Text("\(self.selectedCharacter.selectedCharacter!.birth_year)")
            Text("\(self.selectedCharacter.selectedCharacter!.eye_color)")
            Text("\(self.selectedCharacter.selectedCharacter!.gender)")
            Text("\(self.selectedCharacter.selectedCharacter!.hair_color)")
            Text("\(self.selectedCharacter.selectedCharacter!.height)")            
        }
    }
}

struct CharacterScreen_Previews: PreviewProvider {
    static var previews: some View {
        CharacterScreen()
    }
}
