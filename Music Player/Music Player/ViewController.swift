//
//  ViewController.swift
//  Music Player
//
//  Created by Brandon Martin on 3/4/18.
//  Copyright © 2018 Brandon Martin. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController {
    
    var musicPlayer = MPMusicPlayerController.applicationMusicPlayer

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func GenreButtonTapped(_ sender: UIButton) {
        MPMediaLibrary.requestAuthorization { (status) in
            if status == .authorized {
            self.playGenre(genre: sender.currentTitle!)
        }
        }
    }
    
    @IBAction func StopButtonTapped(_ sender: UIButton) {
        musicPlayer.stop()
    }
    
    @IBAction func NextButtonTapped(_ sender: UIButton) {
        musicPlayer.skipToNextItem()
    }
    
    func playGenre(genre: String) {
     musicPlayer.stop()
        let query = MPMediaQuery()
        let predicate = MPMediaPropertyPredicate(value: genre, forProperty: MPMediaItemPropertyGenre)
        
        query.addFilterPredicate(predicate)
        
        musicPlayer.setQueue(with: query)
        musicPlayer.shuffleMode = .songs
        musicPlayer.play()
     }
}
