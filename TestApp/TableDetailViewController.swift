//
//  ViewController.swift
//  ios_tableView
//
//  Created by Profit, Holden on 11/16/16.
//  Copyright © 2016 Profit, Holden. All rights reserved.
//

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
//        let imgURL: NSURL = NSURL(string: urlString)!
//        let request: NSURLRequest = NSURLRequest(url: imgURL as URL)
//        
//        
////        /Users/holden_profit/Workspaces/hprofit/iOS_Class/testApp/TestApp/TestApp/TableDetailViewController.swift:23:25: 'sendAsynchronousRequest(_:queue:completionHandler:)' was deprecated in iOS 9.0: Use [NSURLSession dataTaskWithRequest:completionHandler:] (see NSURLSession.h
//    
//        NSURLConnection.sendAsynchronousRequest(
//            request as URLRequest, queue: OperationQueue.main,
//            completionHandler: {(response: URLResponse!, data: Data?, error: Error?) -> Void in
//                if error == nil, let imageData = data {
//                    self.imageView.image = UIImage(data: imageData)
//                }
//            } as! (URLResponse?, Data?, Error?) -> Void
//        )
        
        
//        var url:NSURL = NSURL.URLWithString("http://myURL/ios8.png")
//        var data:NSData = NSData.dataWithContentsOfURL(url, options: nil, error: nil)
//        
//        imageView.image = UIImage.imageWithData(data)// Error here
        
//        if let url:NSURL = NSURL.fileURL(withPath: urlString) as NSURL?, let data:NSData = NSData.dataWithContentsOfURL(url, options: nil, error: nil) {
//        
//            imageView.image = UIImage.withData(data as Data)// Error here
//        }
        
        if let url = URL(string: urlString) {
            print("Download Started")
            getDataFromUrl(url: url) { (data, response, error)  in
                guard let data = data, error == nil else { return }
                print(response?.suggestedFilename ?? url.lastPathComponent)
                print("Download Finished")
                DispatchQueue.main.async() { () -> Void in
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
        //imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:url_Img_FULL]]];
        }
//        let imageURL = "http:\/\/ia.media-imdb.com\/images\/M\/MV5BNDg5NjI5NDUxN15BMl5BanBnXkFtZTcwNDIwODczNw@@._V1_SX300.jpg"
    }
}

