//
//  SongViewCell.swift
//  TestDemo
//
//  Created by Manish Ingale on 26/07/21.
//

import UIKit

class SongViewCell: UITableViewCell {
    @IBOutlet weak var webImageView: UIImageView!
    @IBOutlet weak var songNameLbl: UILabel!
    @IBOutlet weak var artistNameLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func loadSongData(songDetails: ContentList?) -> Void {
        
//        Display Image or Placeholder Image
        if songDetails?.artworkUrl60 != "" && songDetails?.artworkUrl60 != nil {


            let url = NSURL(string: "\(songDetails?.artworkUrl60 ?? "")")
            if url != nil {
                self.webImageView!.sd_setImage(with: (url! as URL)) { (image, error, cacheType, imageURL) in
                    self.webImageView!.image = image
                }
            }
        }else{
            self.webImageView.image = #imageLiteral(resourceName: "placeholderImage")

        }
        
        self.songNameLbl.text = songDetails?.trackName ?? "No Track Name"
        self.artistNameLbl.text = songDetails?.artistName ?? "Unknown"
        
        let timeIntervel = TimeInterval.init((songDetails?.trackTimeMillis ?? 0) / 1000)
                
        if timeIntervel.hour > 0 {
            self.timeLbl.text = "\(timeIntervel.hour) Hr \(timeIntervel.minute) min"
        }else {
            self.timeLbl.text = "\(timeIntervel.minute) min"
        }
    }
    
    
    
   
    
    
}



extension TimeInterval {
    var hourMinuteSecondMS: String {
        String(format:"%d:%02d:%02d.%03d", hour, minute, second, millisecond)
    }
    var minuteSecondMS: String {
        String(format:"%d:%02d.%03d", minute, second, millisecond)
    }
    var hour: Int {
        Int((self/3600).truncatingRemainder(dividingBy: 3600))
    }
    var minute: Int {
        Int((self/60).truncatingRemainder(dividingBy: 60))
    }
    var second: Int {
        Int(truncatingRemainder(dividingBy: 60))
    }
    var millisecond: Int {
        Int((self*1000).truncatingRemainder(dividingBy: 1000))
    }
}
