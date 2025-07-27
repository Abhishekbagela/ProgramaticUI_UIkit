//
//  VideoListVC.swift
//  ProgramaticUI_UIkit
//
//  Created by Abhishek Bagela on 24/07/25.
//

import UIKit

class VideoListVC: UIViewController {

    var tableView = UITableView()
    var videos = [Video]()
    
    struct Cells {
        static let videoCell = "VideoCell"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemMint
        title = "Video List"
        
        videos = fetchData()
        configureTableView()
    }
        
    func configureTableView() {
        view.addSubview(tableView)
        
        setTableViewDelegate()
        tableView.rowHeight = 104
        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
        tableView.pin(to: view)
    }
    
    func setTableViewDelegate() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
}

extension VideoListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as! VideoCell
        let video = videos[indexPath.row]
        cell.set(video: video)
        
        return cell
    }
}

extension VideoListVC {
    
    func fetchData() -> [Video] {
        return [
            Video(image: UIImage(systemName: "photo.tv"), title: "Heoolo"),
            Video(image: UIImage(systemName: "eraser.fill"), title: "My name is M"),
            Video(image: UIImage(systemName: "paperplane.fill"), title: "Whou are u..."),
            Video(image: UIImage(systemName: "document.badge.arrow.up.fill"), title: "Heloo UIkit "),
            Video(image: UIImage(systemName: "chart.bar.horizontal.page"), title: "Learning UIkit")
        ]
    }
    
}

struct Video {
    var image: UIImage?
    var title: String
}
