import Foundation
import _CoreLocationUI_SwiftUI

struct LocationData {
    
    private let locationManager: LocationManager
        
    var latitude: Double {
        return locationManager.location?.latitude ?? 0.0
    }
    
    var longitude: Double {
        return locationManager.location?.longitude ?? 0.0
    }
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        locationManager.requestLocation()
    }
    
}
