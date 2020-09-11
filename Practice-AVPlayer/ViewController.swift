//
//  ViewController.swift
//  Practice-AVPlayer
//
//  Created by 副島拓哉 on 2020/09/11.
//  Copyright © 2020 副島拓哉. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer
import AVKit

class ViewController: UIViewController {

    @IBOutlet weak var playerView: PlayerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let audioSession = AVAudioSession.sharedInstance()
        do {
            try audioSession.setCategory(.playback, mode: .moviePlayback)
        } catch {
            print("Setting category to AVAudioSessionCategoryPlayback failed.")
        }
        do {
            try audioSession.setActive(true)
            print("audio session set active !!")
        } catch {
            
        }
        
        setupPlayer()
        
    }
    
    private func setupPlayer() {
        let fileName = "Fishing"
        let fileExtension = "mp4"
        guard let url = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
            print("Url is nil")
            return
        }
        
        itemURL = url
        let item = AVPlayerItem(url: url)
        player = AVPlayer(playerItem: item)
        
        playerView.player = player
        
    }

    @IBAction func Play(_ sender: Any) {
        player.play()
        if let url = itemURL {
            setupNowPlaying(url: url)
        }
    }
    
    @IBAction func Stop(_ sender: Any) {
         player.pause()
    }
}

