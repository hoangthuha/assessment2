import UIKit

class WikiLinkViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    var selectedAppleProduct: Products = Products(name: "", launchDate : "", imageName : "", link : "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTheUrl(with: selectedAppleProduct.link)
    }
    
    func loadTheUrl(with String: String) {
        
        guard let url = URL(string : String) else {
            print("Invalid urlString: \(String)")
            return
        }
        
        let request = URLRequest(url: url)
        webView.loadRequest(request)
        
    }
    
    
}
