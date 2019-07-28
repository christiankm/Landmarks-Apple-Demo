/*
See LICENSE folder for this sample’s licensing information.

Abstract:
A model object that stores app data.
*/

import Combine
import SwiftUI

final class UserData: BindableObject {
    let willChange = PassthroughSubject<Void, Never>()
    
    var showFavoritesOnly = false {
        willSet {
            willChange.send()
        }
    }

    var landmarks = landmarkData {
        willSet {
            willChange.send()
        }
    }
}
