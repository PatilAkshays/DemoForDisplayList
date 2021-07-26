//
//  DetailsViewController.swift
//  TestDemo
//
//  Created by Manish Ingale on 26/07/21.
//

import UIKit
import SDWebImage

class DetailsViewController: UIViewController {
    
    
    @IBOutlet weak var webImageView: UIImageView!
    @IBOutlet weak var songNameLbl: UILabel!
    @IBOutlet weak var artistNameLbl: UILabel!
    @IBOutlet weak var totalTimeLbl: UILabel!
    @IBOutlet weak var remainingTimeLbl: UILabel!
    @IBOutlet weak var backwordButton: UIButton!
    @IBOutlet weak var forwordButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var favButton: UIButton!

    var songDetails: ContentList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Details"
        loadAllData()
        loadSongImage()
        
        // Do any additional setup after loading the view.
    }
    
    
    //Load All Content
    func loadAllData() -> Void {
        let timeIntervel = TimeInterval.init((songDetails?.trackTimeMillis ?? 0) / 1000)
                
        if timeIntervel.hour > 0 {
            self.totalTimeLbl.text = "\(timeIntervel.hour):\(timeIntervel.minute)"
        }else {
            self.totalTimeLbl.text = "\(timeIntervel.minute):00"
        }
        
        self.remainingTimeLbl.text = "00:00"
        
        self.songNameLbl.text = songDetails?.trackName ?? "No Track Name"
        self.artistNameLbl.text = songDetails?.artistName ?? "Unknown"
        
        
    }
    
    func loadSongImage() -> Void {
        if songDetails?.artworkUrl100 != "" && songDetails?.artworkUrl100 != nil {


            let url = NSURL(string: "\(songDetails?.artworkUrl100 ?? "")")
            if url != nil {
                self.webImageView!.sd_setImage(with: (url! as URL)) { (image, error, cacheType, imageURL) in
                    self.webImageView!.image = image
                }
            }
        }else{
            self.webImageView.image = #imageLiteral(resourceName: "placeholderImage")

        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
