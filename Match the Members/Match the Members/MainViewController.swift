//
//  MainViewController.swift
//  Match the Members
//
//  Created by Brandon David on 9/8/18.
//  Copyright © 2018 Brandon David. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var memberImageView: UIImageView!
    var statusLabel: UILabel!
    var member1Button: UIButton!
    var member2Button: UIButton!
    var member3Button: UIButton!
    var member4Button: UIButton!
    var correctMember: String!
    var countdown: Timer!
    var delay: Timer!
    var time = 5
    var countdownLabel: UILabel!
    var scoreLabel: UILabel!
    var currentScore = 0
    var answerSelected = false
    var statisticsButton: UIBarButtonItem!
    var myToolbar: UIToolbar!
    var initialRound = true

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initialize toolbar
        myToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.size.width, height: 50.0))
        myToolbar.center = CGPoint.init(x: view.frame.width/2, y: view.frame.height - 25)
        let statisticsButton = UIBarButtonItem.init(image: #imageLiteral(resourceName: "statistics"), style: .plain, target: self, action: #selector(viewStatistics))
        myToolbar.items = [statisticsButton]
        self.view.addSubview(myToolbar)
        
        // initialize score
        scoreLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.width, height: 100))
        scoreLabel.center = CGPoint.init(x: view.frame.width / 2, y: 50)
        scoreLabel.text = String(currentScore)
        scoreLabel.textAlignment = .center
        self.view.addSubview(scoreLabel)
        
        // initialize countdown
        countdownLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.width / 2, height: 100))
        countdownLabel.center = CGPoint.init(x: view.frame.width / 2, y: view.frame.height / 4 + 175)
        countdownLabel.textAlignment = .center
        self.view.addSubview(countdownLabel)
        
        // initialize member imageView
        memberImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: 200, height: 200))
        memberImageView.center = CGPoint.init(x: view.frame.width / 2, y: view.frame.height / 4)
        memberImageView.layer.cornerRadius = 10
        memberImageView.contentMode = UIViewContentMode.scaleAspectFit
        memberImageView.clipsToBounds = true
        self.view.addSubview(memberImageView)
        
        // initialize status label
        statusLabel = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.width, height: 100))
        statusLabel.textAlignment = .center
        statusLabel.center = CGPoint.init(x: view.frame.width / 2, y: view.frame.height / 4 + 125)
        statusLabel.text = "Who is this member?"
        self.view.addSubview(statusLabel)
        
        // initialize member buttons
        member1Button = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 150, height: 40))
        member1Button.center = CGPoint.init(x: 3 * view.frame.width / 10, y: view.frame.height / 2 + 50)
        member1Button.layer.cornerRadius = 10
        member1Button.addTarget(self, action: #selector(member1Selected), for: .touchUpInside)
        member1Button.titleLabel?.adjustsFontSizeToFitWidth = true
        self.view.addSubview(member1Button)
        
        member2Button = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 150, height: 40))
        member2Button.center = CGPoint.init(x: 7 * view.frame.width / 10, y: view.frame.height / 2 + 50)
        member2Button.layer.cornerRadius = 10
        member2Button.addTarget(self, action: #selector(member2Selected), for: .touchUpInside)
        member2Button.titleLabel?.adjustsFontSizeToFitWidth = true
        self.view.addSubview(member2Button)
        
        member3Button = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 150, height: 40))
        member3Button.center = CGPoint.init(x: 3 * view.frame.width / 10, y: view.frame.height / 2 + 100)
        member3Button.layer.cornerRadius = 10
        member3Button.addTarget(self, action: #selector(member3Selected), for: .touchUpInside)
        member3Button.titleLabel?.adjustsFontSizeToFitWidth = true
        self.view.addSubview(member3Button)
        
        member4Button = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 150, height: 40))
        member4Button.center = CGPoint.init(x: 7 * view.frame.width / 10, y: view.frame.height / 2 + 100)
        member4Button.layer.cornerRadius = 10
        member4Button.addTarget(self, action: #selector(member4Selected), for: .touchUpInside)
        member4Button.titleLabel?.adjustsFontSizeToFitWidth = true
        self.view.addSubview(member4Button)
        
        initializeMembers()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        self.navigationController?.isNavigationBarHidden = true
        startCountdown()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // start countdown timer
    func startCountdown() {
        countdown = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateCountdown), userInfo: nil, repeats: true)
    }
    
    // randomize member names and positions
    @objc func initializeMembers() {
        // create memberNames array of 4 members' names
        var indices: Set = [-1]
        var memberNames: [String] = []
        var randomIndex = Int(arc4random_uniform(UInt32(Constants.names.count)))
        indices.insert(randomIndex)
        memberNames.append(Constants.names[randomIndex])
        randomIndex = Int(arc4random_uniform(UInt32(Constants.names.count)))
        while indices.contains(randomIndex) {
            randomIndex = Int(arc4random_uniform(UInt32(Constants.names.count)))
        }
        indices.insert(randomIndex)
        memberNames.append(Constants.names[randomIndex])
        randomIndex = Int(arc4random_uniform(UInt32(Constants.names.count)))
        while indices.contains(randomIndex) {
            randomIndex = Int(arc4random_uniform(UInt32(Constants.names.count)))
        }
        indices.insert(randomIndex)
        memberNames.append(Constants.names[randomIndex])
        randomIndex = Int(arc4random_uniform(UInt32(Constants.names.count)))
        while indices.contains(randomIndex) {
            randomIndex = Int(arc4random_uniform(UInt32(Constants.names.count)))
        }
        indices.insert(randomIndex)
        memberNames.append(Constants.names[randomIndex])
        
        // take random name from memberNames, retrieve image
        randomIndex = Int(arc4random_uniform(UInt32(memberNames.count)))
        correctMember = memberNames[randomIndex]
        let memberImage = Constants.getImageFor(name: correctMember)
        memberImageView.image = memberImage
        
        randomIndex = Int(arc4random_uniform(UInt32(memberNames.count)))
        member1Button.setTitle(memberNames[randomIndex], for: .normal)
        member1Button.backgroundColor = UIColor.blue
        memberNames.remove(at: randomIndex)
        randomIndex = Int(arc4random_uniform(UInt32(memberNames.count)))
        member2Button.setTitle(memberNames[randomIndex], for: .normal)
        member2Button.backgroundColor = UIColor.blue
        memberNames.remove(at: randomIndex)
        randomIndex = Int(arc4random_uniform(UInt32(memberNames.count)))
        member3Button.setTitle(memberNames[randomIndex], for: .normal)
        member3Button.backgroundColor = UIColor.blue
        memberNames.remove(at: randomIndex)
        member4Button.setTitle(memberNames[0], for: .normal)
        member4Button.backgroundColor = UIColor.blue
        
        answerSelected = false
        time = 5
        countdownLabel.text = "5"
        if !initialRound {
            startCountdown()
        } else {
            initialRound = !initialRound
        }
    }
    
    @objc func member1Selected() {
        if !answerSelected {
            answerSelected = !answerSelected
            countdown.invalidate()
            let memberName = member1Button.currentTitle
            if memberName == correctMember {
                statusLabel.text = "Correct!"
                member1Button.backgroundColor = UIColor.green
                Constants.lastThreeMembers.enqueue(element:"Selected correct answer: \(memberName!)")
                reloadView(answerCorrect: true)
            } else {
                statusLabel.text = "Wrong! Correct answer is \(correctMember!)."
                member1Button.backgroundColor = UIColor.red
                Constants.lastThreeMembers.enqueue(element: memberName! + ", correct answer: \(correctMember!)")
                reloadView(answerCorrect: false)
            }
        }
    }
    
    @objc func member2Selected() {
        if !answerSelected {
            answerSelected = !answerSelected
            countdown.invalidate()
            let memberName = member2Button.currentTitle
            if memberName == correctMember {
                statusLabel.text = "Correct!"
                member2Button.backgroundColor = UIColor.green
                Constants.lastThreeMembers.enqueue(element:"Selected correct answer: \(memberName!)")
                reloadView(answerCorrect: true)
            } else {
                statusLabel.text = "Wrong! Correct answer is \(correctMember!)."
                member2Button.backgroundColor = UIColor.red
                Constants.lastThreeMembers.enqueue(element: memberName! + ", correct answer: \(correctMember!)")
                reloadView(answerCorrect: false)
            }
        }
    }
    
    @objc func member3Selected() {
        if !answerSelected {
            answerSelected = !answerSelected
            countdown.invalidate()
            let memberName = member3Button.currentTitle
            if memberName == correctMember {
                statusLabel.text = "Correct!"
                member3Button.backgroundColor = UIColor.green
                Constants.lastThreeMembers.enqueue(element:"Selected correct answer: \(memberName!)")
                reloadView(answerCorrect: true)
            } else {
                statusLabel.text = "Wrong! Correct answer is \(correctMember!)."
                member3Button.backgroundColor = UIColor.red
                Constants.lastThreeMembers.enqueue(element: memberName! + ", correct answer: \(correctMember!)")
                reloadView(answerCorrect: false)
            }
        }
    }
    
    @objc func member4Selected() {
        if !answerSelected {
            answerSelected = !answerSelected
            countdown.invalidate()
            let memberName = member4Button.currentTitle
            if memberName == correctMember {
                statusLabel.text = "Correct!"
                member4Button.backgroundColor = UIColor.green
                Constants.lastThreeMembers.enqueue(element:"Selected correct answer: \(memberName!)")
                reloadView(answerCorrect: true)
            } else {
                statusLabel.text = "Wrong! Correct answer is \(correctMember!)."
                member4Button.backgroundColor = UIColor.red
                Constants.lastThreeMembers.enqueue(element: memberName! + ", correct answer: \(correctMember!)")
                reloadView(answerCorrect: false)
            }
        }
    }
    
    @objc func updateCountdown() {
        time -= 1
        countdownLabel.text = String(time)
        if time == 0 {
            countdownFinished()
        }
    }
    
    @objc func viewStatistics() {
        countdown.invalidate()
        performSegue(withIdentifier: "toStatisticsVC", sender: self)
    }
    
    func countdownFinished() {
        answerSelected = !answerSelected
        countdown.invalidate()
        statusLabel.text = "Out of time! Correct answer is \(correctMember!)."
        Constants.lastThreeMembers.enqueue(element: "Out of time, correct answer: \(correctMember!)")
        reloadView(answerCorrect: false)
    }
    
    // prepare for next round
    func reloadView(answerCorrect: Bool) {
        if Constants.lastThreeMembers.items.count > 3 {
            Constants.lastThreeMembers.dequeue()
        }
        if answerCorrect {
            currentScore += 1
            scoreLabel.text = String(currentScore)
        } else {
            if currentScore > Constants.maxStreak {
                Constants.maxStreak = currentScore
            }
            currentScore = 0
            scoreLabel.text = String(currentScore)
        }
        delay = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(initializeMembers), userInfo: nil, repeats: false)
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
