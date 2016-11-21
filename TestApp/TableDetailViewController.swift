import UIKit
import Alamofire
import SwiftyJSON

class TableDetailViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var yearLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    func getDataFromUrl(url: URL, completion: @escaping (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void) {
        URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            completion(data, response, error)
            }.resume()
    }
    
    func load_image(urlString: String) {
        if let url = URL(string: urlString) {
            getDataFromUrl(url: url) { (data, response, error)  in
                guard let data = data, error == nil else { return }
//                print(response?.suggestedFilename ?? url.lastPathComponent)
                DispatchQueue.main.sync() { () -> Void in
                    self.imageView.image = UIImage(data: data)
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movieTitle = Shared.shared.selectedMovie?["Title"].string {
            titleLabel.text = movieTitle
        }
        
        if let movieYear = Shared.shared.selectedMovie?["Year"].string {
            yearLabel.text = movieYear
        }
        
        if let movieImage = Shared.shared.selectedMovie?["Poster"].string {
            self.load_image(urlString: movieImage)
        }
    }
    
    @IBAction func backToTable (sender: UIButton!) {
        performSegue(withIdentifier: "tableView", sender: self)
    }
}

