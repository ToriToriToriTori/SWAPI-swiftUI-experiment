//
//  CharacterData.swift
//  SWAPI-SwiftUI
//
//  Created by Tori George on 2/4/20.
//  Copyright © 2020 Tori George. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

final class SelectedCharacter: ObservableObject {
    @Published var selectedCharacter: Character?
}
