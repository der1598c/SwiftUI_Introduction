import UIKit

@propertyWrapper
class UrlEncode {
    
    private(set) var value: String = ""
    
    var wrappedValue: String {
        get { value }
        set {
            if let url = newValue.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                self.value = url
            }
        }
    }
    
}

struct Resource {
    
    @UrlEncode
    var city: String
    
    var url: String {
        "https://samples.?q=\(city)&appid=12345678"
    }
    
}

extension Resource {
    init(city: String) {
        self.city = city
    }
}

var resource = Resource(city: "Los Angelos")
print(resource.city)
print(resource.url)
