import UIKit

class DetailedViewController: UIViewController {
    
    var product : Products = Products(name: "", launchDate : "", imageName : "", link : "")
    var productDetails : String = ""
    
    var delegate : DetailedViewControllerDelegate?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var detailTextField: UITextField!
    @IBOutlet weak var productsImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBAction func btnLinkProduct(_ sender: Any) {
        let mainStoryboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destination = mainStoryboard.instantiateViewController(withIdentifier: "WikiLinkViewController") as? WikiLinkViewController else {return}
        destination.selectedAppleProduct = product
        
        navigationController?.pushViewController(destination, animated: true)
    }
    
    @IBAction func editBtn(_ sender: Any) {
        
        nameLabel.isHidden = true
        detailLabel.isHidden = true
        nameTextField.isHidden = false
        detailTextField.isHidden = false
    }
    
    @IBAction func doneBtn(_ sender: Any) {
        
        if let newProductName = nameTextField.text {
            product.name = newProductName
        }
        if let newProductDetail = detailTextField.text {
            product.launchDate = newProductDetail
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeTitleBtn(_ sender: Any) {
        if let newTitleName = nameTextField.text {
            self.title = newTitleName
            delegate?.changeTitle(name: newTitleName)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = product.name
        nameTextField.isHidden = true
        detailTextField.isHidden = true
        nameLabel.text = product.name
        detailLabel.text = product.launchDate
        productsImageView.image = product.image
    }
  
}
protocol DetailedViewControllerDelegate {
    func changeTitle(name : String)
}
