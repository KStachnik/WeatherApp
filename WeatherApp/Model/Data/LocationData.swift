import Foundation
import _CoreLocationUI_SwiftUI

struct LocationData {
    private let locationManager: LocationManager
        
    var latitude: Double {
        return locationManager.location?.latitude ?? 48.8567
    }
    
    var longitude: Double {
        return locationManager.location?.longitude ?? 2.3508
    }
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        locationManager.requestLocation()
    }
}
