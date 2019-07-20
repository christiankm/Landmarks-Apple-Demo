import SwiftUI
import Combine

final class UserData: BindableObject {

    let willChange = PassthroughSubject<UserData, Never>()
    
    var showFavoritesOnly = false {
        willSet {
            willChange.send(self)
        }
    }
    
    var landmarks = landmarkData {
        willSet {
            willChange.send(self)
        }
    }
}
