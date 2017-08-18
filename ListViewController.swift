import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var products : [Products] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "abc"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let macBook = Products(name: "MacBook", launchDate: "April 19, 2016", imageName: "MacBook",  link: "https://en.wikipedia.org/wiki/MacBook_(Retina)")
        products.append(macBook)
        
        let appleWatch = Products(name: "Apple Watch", launchDate: "September 7, 2016", imageName: "AppleWatch", link: "https://en.wikipedia.org/wiki/Apple_Watch")
        products.append(appleWatch)
        
        let ipodTouch = Products(name: "Ipod Touch", launchDate: "July 27, 2017", imageName: "IpodTouch", link: "https://en.wikipedia.org/wiki/IPod_Touch")
        products.append(ipodTouch)
        
        let ipadMini = Products(name: "Ipad Mini", launchDate: "March 21, 2017", imageName: "IpadMini", link: "https://en.wikipedia.org/wiki/IPad_Mini_4")
        products.append(ipadMini)
        
        let iMac = Products(name: "iMac", launchDate: "June 5, 2017", imageName: "iMac", link: "https://en.wikipedia.org/wiki/IMac")
        products.append(iMac)
        
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
   
}

extension ListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath) as? ProductsTableViewCell
            else { return UITableViewCell() }
        //2.setup
        let product = products[indexPath.row]
        
        cell.nameLabel.text = product.name
        cell.detailLabel.text = product.launchDate
        cell.productsImageView.image = product.image
        
        //3.return
        return cell
    }
}
extension ListViewController : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedProduct = products[indexPath.row]
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        
        guard let destination = mainStoryboard.instantiateViewController(withIdentifier: "DetailedViewController") as? DetailedViewController
            else {return}
        
        destination.product = selectedProduct
        destination.delegate = self
        
        navigationController?.pushViewController(destination, animated: true)
    }
}
extension ListViewController : DetailedViewControllerDelegate{
    func changeTitle(name: String) {
        self.title = name
    }
}
