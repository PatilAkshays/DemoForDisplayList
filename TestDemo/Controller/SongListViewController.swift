//
//  SongListViewController.swift
//  TestDemo
//
//  Created by Manish Ingale on 26/07/21.
//

import UIKit
import SDWebImage

class SongListViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var viewModel: ViewModel!

    var loadingView : LoadingView!

    //Refresh Loader Method
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(self.handleRefresh(_:)),
                                 for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()
    
    //Refresh Control Event/Action
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        
        self.fetchListData()
        self.tableView.reloadData()
        refreshControl.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.addSubview(self.refreshControl)

        loadingView = LoadingView(uiView: view, message: "Please Wait")

        self.title = "SONGS"
        
        //Confirm the Protocol
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.fetchListData()
        
        // Do any additional setup after loading the view.
    }
    
    
    
    //Fetch Data from Cloud
    func fetchListData() -> Void {
        
        if Connectivity.isConnectedToInternet(){
            self.showLoadingView()
            self.viewModel.getContentListData(completion: { (response) in
                //Success
                self.hideLoadingView()
                if response.isSuccess ?? false {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
                
            })
        }else{
            //No Internet Connection
            self.showAlertWithTitle(title: "Internet Connection Alert!", msg: "Please conect with Internet and try again latter.")
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.apiContentResponse?.contentListArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongViewCell", for: indexPath) as! SongViewCell
        
        let songDetails = viewModel.apiContentResponse?.contentListArray[indexPath.row]
        cell.loadSongData(songDetails: songDetails)
        
        return cell;
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let songDetails = viewModel.apiContentResponse?.contentListArray[indexPath.row]
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let songDetailsVC = storyBoard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        songDetailsVC.songDetails = songDetails
        self.navigationController?.pushViewController(songDetailsVC, animated: true)
//
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
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

extension SongListViewController {

    func showLoadingView() {
        if let loaderView = loadingView{ // If loadingView already exists
            if loaderView.isHidden() {
                loaderView.show()  // To show activity indicator
            }
        }
        else{
            loadingView = LoadingView(uiView: view, message: "Loading")
        }
    }
    
    func hideLoadingView() {
        if let loaderView = loadingView{ // If loadingView already exists
            self.loadingView.hide()
        }
    }
}
