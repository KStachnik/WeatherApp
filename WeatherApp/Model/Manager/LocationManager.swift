import CoreLocation

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
        DispatchQueue.main.async {
            self.location = firstLocation
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        DispatchQueue.main.async {
            self.errorCode = error.localizedDescription.description
            self.isError = true
        }
    }
    
    func resetError() {
        DispatchQueue.main.async {
            self.isError = false
            self.errorCode = ""
        }
    }
    
}
