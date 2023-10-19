import Foundation

struct LocationData {
    
    private let locationManager: LocationManager
    
    init(locationManager: LocationManager) {
        self.locationManager = locationManager
        locationManager.requestLocation()
    }
        
    var latitude: Double {
        return locationManager.location?.latitude ?? 48.8566
    }
    
    var longitude: Double {
        return locationManager.location?.longitude ?? 2.3522
    }
    
    
    
}
