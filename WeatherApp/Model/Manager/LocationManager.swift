import CoreLocation
import CoreLocationUI

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isError: Bool = false
    var errorCode: String = ""
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation() {
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let firstLocation = locations.first?.coordinate else {
            return
        }
        location = firstLocation
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        errorCode = error.localizedDescription.description
        isError = true
    }
    
    func resetError() {
        isError = false
        errorCode = ""
    }
    
}
