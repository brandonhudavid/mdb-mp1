//
//  StatisticsViewController.swift
//  Match the Members
//
//  Created by Brandon David on 9/8/18.
//  Copyright © 2018 Brandon David. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {

    var maxStreakLabel: UILabel!
    var lastThreeLabel: UILabel!
    var member1Label: UILabel!
    var member2Label: UILabel!
    var member3Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        maxStreakLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.width, height: 100))
        maxStreakLabel.center = CGPoint.init(x: view.frame.width / 2, y: 200)
        maxStreakLabel.textAlignment = .center
        self.view.addSubview(maxStreakLabel)
        
        lastThreeLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.width, height: 100))
        lastThreeLabel.center = CGPoint.init(x: view.frame.width / 2, y: 250)
        lastThreeLabel.textAlignment = .center
        self.view.addSubview(lastThreeLabel)
        
        member1Label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.width, height: 100))
        member1Label.center = CGPoint.init(x: view.frame.width / 2, y: 275)
        member1Label.textAlignment = .center
        self.view.addSubview(member1Label)
        
        member2Label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.width, height: 100))
        member2Label.center = CGPoint.init(x: view.frame.width / 2, y: 300)
        member2Label.textAlignment = .center
        self.view.addSubview(member2Label)
        
        member3Label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.width, height: 100))
        member3Label.center = CGPoint.init(x: view.frame.width / 2, y: 325)
        member3Label.textAlignment = .center
        self.view.addSubview(member3Label)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = false
        maxStreakLabel.text = "Max score: \(String(Constants.maxStreak))"
        self.lastThreeLabel.text = "Last three results:"
        var memberCount = 0
        for member in (Constants.lastThreeMembers.items) {
            memberCount += 1
            switch(memberCount) {
            case 1:
                member3Label.text = member
                break
            case 2:
                member2Label.text = member
                break
            case 3:
                member1Label.text = member
                break
            default:
                break
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
