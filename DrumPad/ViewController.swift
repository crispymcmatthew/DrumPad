//
//  ViewController.swift
//  DrumPad
//
//  Created by user on 15/06/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var drumPlayer : AVAudioPlayer!
    var notePlayer : AVAudioPlayer!
    var selectedInstrument: String = "grandPiano"
    
    @IBAction func keyPressed(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            playDrums("baseTrack")
        case 2:
            playDrums("track2")
        /*case 3:
            playDrums("track3")*/
        case 4:
            playNote("C3")
        case 5:
            playNote("D3")
        case 6:
            playNote("E3")
        case 7:
            playNote("F3")
        case 8:
            playNote("G3")
        case 9:
            playNote("A3")
        case 10:
            playNote("B3")
        case 11:
            playNote("C4")
        case 12:
            selectedInstrument = "grandPiano"
        case 13:
            selectedInstrument = "articNoiseLead"
        case 14:
            selectedInstrument = "urbanGrunge"
        case 15:
            if let _ = drumPlayer {
                drumPlayer.stop()
            }
        default:
            print("Error: unknown")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    func playNote(_ sound: String) {
        let repo = "mp3/" + selectedInstrument + "/" + sound
        
        guard let url = Bundle.main.url(forResource: repo, withExtension: "mp3") else {
            print("RETURNING ")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            notePlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = notePlayer else { return }
            
            player.play()
            
        } catch let error {
            print("Error was detected")
            print(error.localizedDescription)
        }
    }
    
    func playDrums(_ track: String) {
        let repo = "mp3/drums/" + track
        
        guard let url = Bundle.main.url(forResource: repo, withExtension: "wav") else {
            print("RETURNING ")
            return
        }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            drumPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = drumPlayer else { return }
            
            player.play()
            
        } catch let error {
            print("Error was detected")
            print(error.localizedDescription)
        }
    }
}

