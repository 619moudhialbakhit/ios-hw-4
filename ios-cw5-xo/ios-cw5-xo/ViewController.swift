//
//  ViewControll#imageLiteral(resourceName: "DCdXVvLXcAELB8M.jpg")er.swift
//  ios-cw5-xo
//
//  Created by modhi on 6/29/20.
//  Copyright © 2020 modhialb. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    @IBOutlet weak var backaGround: UIImageView!
    
    @IBOutlet weak var oScore: UILabel!
    @IBOutlet weak var xScore: UILabel!
    
    var turn = 0
    
    var backGroundMusic: AVAudioPlayer?
    var buttonsSoundsPlayer: AVAudioPlayer?
    var soundsNames: [String] = []
    var XScore = 0
    var OScore = 0
    
    // This is the first function that will get called in this view controller
    override func viewDidLoad() {
        super.viewDidLoad()
        playbackGroundMusic()
        
        for i in 1...9{
            soundsNames.append("\(i).mp3")
        }
        // Do any additional setup after loading the view.
    }
    
    func playbackGroundMusic(){
        let path = Bundle.main.path(forResource: "bg.MP4", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        
        do {
            backGroundMusic = try AVAudioPlayer(contentsOf: url)
            backGroundMusic?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    @IBAction func muteAction(_ sender: UIButton) {
        if backGroundMusic!.isPlaying {
            backGroundMusic?.stop()
        } else {
            playbackGroundMusic()
        }
    }
    
    func playrandomSound(){
        let randomSound = soundsNames.randomElement()!
        print(randomSound)
        let path = Bundle.main.path(forResource: randomSound, ofType: nil)
        let url = URL(fileURLWithPath: path!)
        
        do {
            buttonsSoundsPlayer = try AVAudioPlayer(contentsOf: url)
            buttonsSoundsPlayer?.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    
    @IBAction func tap(_ sender: UIButton) {
        if turn % 2 == 0{
            sender.setTitle("X", for: .normal)
            turnLabel.text = ("O Turn")
            sender.setTitleColor(.green, for: .normal)
            
        }
        else{
            sender.setTitle("O", for: .normal)
            turnLabel.text = ("X Turn")
            sender.setTitleColor(.blue, for: .normal)
        }
        print(turn)
        sender.isUserInteractionEnabled = false
        turn += 1
        
        if checkWinner(p: "X"){
            XScore += 1
            xScore.text = "\(XScore)"
            okAlert(title: " X wins 🎉", message: "Congratulations, now reset the game!!")
            
        }
        else if checkWinner(p: "O"){
            OScore += 1
            oScore.text = "\(OScore)"
            okAlert(title: " O wins 🎉", message: "Congratulations, now reset the game!!")
        }
        else if turn == 9{
            okAlert(title: "No one wins", message: "now reset the game!!")
            
        }
       if XScore == 3{
        resetGame()
            XScore = 0
            OScore = 0
            xScore.text = "\(XScore)"
          oScore.text = "\(OScore)"
            okAlert(title: "Ultimate winner is X", message: "now reset the game!!")
            
        } else if OScore == 3{
                  resetGame()
                      XScore = 0
                      OScore = 0
            oScore.text = "\(OScore)"
          xScore.text = "\(XScore)"
        okAlert(title: "Ultimate winner is X", message: "now reset the game!!")
        }
          playrandomSound()
    }
    
    func checkWinner(p: String) -> Bool{
        let f1 = b1.titleLabel?.text
        let f2 = b2.titleLabel?.text
        let f3 = b3.titleLabel?.text
        let f4 = b4.titleLabel?.text
        let f5 = b5.titleLabel?.text
        let f6 = b6.titleLabel?.text
        let f7 = b7.titleLabel?.text
        let f8 = b8.titleLabel?.text
        let f9 = b9.titleLabel?.text
        
        let r1 = (f1, f2, f3) == (p, p ,p)
        let r2 = (f4, f5, f6) == (p, p ,p)
        let r3 = (f7, f8, f9) == (p, p ,p)
        let c1 = (f1, f4, f7) == (p, p ,p)
        let c2 = (f2, f5, f8) == (p, p ,p)
        let c3 = (f4, f6, f9) == (p, p ,p)
        let d1 = (f1, f5, f9) == (p, p ,p)
        let d2 = (f3, f5, f7) == (p, p ,p)
        
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2{
            print("😍👏🏻👏🏻 \(p) Wins")
            return true
        }
        else{
            return false
             
        }
    }
    
    
    
    @IBAction func reset(_ sender: Any) {
        resetGame()
        
    }
    func resetGame(){
        b1.titleLabel?.text = ""
        b2.titleLabel?.text = ""
        b3.titleLabel?.text = ""
        b4.titleLabel?.text = ""
        b5.titleLabel?.text = ""
        b6.titleLabel?.text = ""
        b7.titleLabel?.text = ""
        b8.titleLabel?.text = ""
        b9.titleLabel?.text = ""
        
        b1.setTitle("", for: .normal)
        b2.setTitle("", for: .normal)
        b3.setTitle("", for: .normal)
        b4.setTitle("", for: .normal)
        b5.setTitle("", for: .normal)
        b6.setTitle("", for: .normal)
        b7.setTitle("", for: .normal)
        b8.setTitle("", for: .normal)
        b9.setTitle("", for: .normal)
        
        b1.isUserInteractionEnabled = true
        b2.isUserInteractionEnabled = true
        b3.isUserInteractionEnabled = true
        b4.isUserInteractionEnabled = true
        b5.isUserInteractionEnabled = true
        b6.isUserInteractionEnabled = true
        b7.isUserInteractionEnabled = true
        b8.isUserInteractionEnabled = true
        b9.isUserInteractionEnabled = true
        
        turn = 0
        if backaGround.image ==  UIImage(named: "DCdXVvLXcAELB8M"){
            backaGround.image = UIImage(named: "background")
        } else{
            backaGround.image = UIImage(named:  "DCdXVvLXcAELB8M")
        }
        
    }
    
    func okAlert(title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel) { alart in
            self.resetGame()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
}


