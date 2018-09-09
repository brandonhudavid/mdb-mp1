//
//  ViewController.swift
//  Match the Members
//
//  Created by Brandon David on 9/7/18.
//  Copyright © 2018 Brandon David. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    
    var appNameLabel: UILabel!
    var centerImageView: UIImageView!
    var startButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        appNameLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 200))
        appNameLabel.center = CGPoint.init(x: view.frame.width/2, y: view.frame.height/2 - 150)
        appNameLabel.text = "MDB for Dummies"
        appNameLabel.textAlignment = .center
        self.view.addSubview(appNameLabel)
        
        centerImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 200))
        centerImageView.center = CGPoint.init(x: view.frame.width/2, y: view.frame.height/2)
        centerImageView.image = #imageLiteral(resourceName: "mdb-logo")
        centerImageView.layer.cornerRadius = 10
        centerImageView.contentMode = UIViewContentMode.scaleAspectFit
        centerImageView.clipsToBounds = true
        self.view.addSubview(centerImageView)
        // start button
        startButton = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.width / 3, height: view.frame.height / 20))
        startButton.center = CGPoint.init(x: view.frame.width / 2, y: 3 * view.frame.height / 4)
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = UIColor.init(red: 67/255, green: 131/255, blue: 232/255, alpha: 1)
        startButton.layer.cornerRadius = 10
        startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
        self.view.addSubview(startButton)
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    @objc func startButtonClicked() {
        performSegue(withIdentifier: "toMainVC", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

