//
//  ViewController.swift
//  TestDemo
//
//  Created by Akshay Patil on 26/07/21.
//


import UIKit

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { _ in
            self.dismiss(animated: false, completion: nil)
            self.showSongList()
        })
        
        // Do any additional setup after loading the view.
    }
    
    func showSongList() -> Void {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let songListViewController = storyBoard.instantiateViewController(withIdentifier: "NavigationController")
        SceneDelegate.shared?.window?.rootViewController = songListViewController
    }
   


    
}

struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}


///Loader
class LoadingView {

    let uiView          :   UIView
    let message         :   String
    let messageLabel    =   UILabel()

    let loadingSV       =   UIStackView()
    let loadingView     =   UIView()
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)

    init(uiView: UIView, message: String) {
        self.uiView     =   uiView
        self.message    =   message
        self.setup()
    }

    func setup(){
        let viewWidth   = uiView.bounds.width
        let viewHeight  = uiView.bounds.height

        // Configuring the message label
        messageLabel.text             = message
        messageLabel.textColor        = UIColor.blue
        messageLabel.textAlignment    = .center
        messageLabel.numberOfLines    = 3
        messageLabel.lineBreakMode    = .byWordWrapping

        // Creating stackView to center and align Label and Activity Indicator
        loadingSV.axis          = .vertical
        loadingSV.distribution  = .equalSpacing
        loadingSV.alignment     = .center
        loadingSV.addArrangedSubview(activityIndicator)
        loadingSV.addArrangedSubview(messageLabel)

        // Creating loadingView, this acts as a background for label and activityIndicator
        loadingView.frame           = uiView.frame
        loadingView.center          = uiView.center
        loadingView.backgroundColor = UIColor.darkGray.withAlphaComponent(0.3)
        loadingView.clipsToBounds   = true

        // Disabling auto constraints
        loadingSV.translatesAutoresizingMaskIntoConstraints = false

        // Adding subviews
        loadingView.addSubview(loadingSV)
        uiView.addSubview(loadingView)
        activityIndicator.startAnimating()
        activityIndicator.color = .blue
        // Views dictionary
        let views = [
            "loadingSV": loadingSV
        ]

        // Constraints for loadingSV
        uiView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-[loadingSV(-\(viewWidth ))]-|", options: [], metrics: nil, views: views))
        uiView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-\(viewHeight / 2)-[loadingSV(50)]-|", options: [], metrics: nil, views: views))
    }

    // Call this method to hide loadingView
    func show() {
        loadingView.isHidden = false
    }

    // Call this method to show loadingView
    func hide(){
        loadingView.isHidden = true
    }

    // Call this method to check if loading view already exists
    func isHidden() -> Bool{
        if loadingView.isHidden == false{
            return false
        }
        else{
            return true
        }
    }
}


extension UIViewController {
    
    
    //Method to display Action Alert //@k
    func showAlertWithTitle(title: String, msg: String) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.cancel, handler: { action in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        // show the alert
        self.present(alert, animated: true, completion: nil)
    }
    
}
