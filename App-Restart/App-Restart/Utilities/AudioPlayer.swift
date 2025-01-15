//
//  AudioPlayer.swift
//  App-Restart
//
//  Created by Manuel Salinas on 1/14/25.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type){
        do {
            audioPlayer =  try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch  {
            print("couldn't play sound file")
        }
    }
}
