//
//  FirstScreen.swift
//  ProgramaticUI_UIkit
//
//  Created by Abhishek Bagela on 24/07/25.
//

import UIKit

class FirstScreen: UIViewController {

    let nextButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "ProgramaticUI_UIkit"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupButton()
    }

    func setupButton() {
        view.addSubview(nextButton)
        
        nextButton.configuration = .filled()
        nextButton.configuration?.baseBackgroundColor = .systemPink
        nextButton.configuration?.title = "Table View"
        nextButton.translatesAutoresizingMaskIntoConstraints = false

        nextButton.addTarget(self, action: #selector(sentToNextScreen), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 200),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc func sentToNextScreen() {
        let videoListVC = VideoListVC()
        navigationController?.pushViewController(videoListVC, animated: true)
    }
    
}

