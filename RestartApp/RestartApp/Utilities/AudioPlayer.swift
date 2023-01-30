//
//  AudioPlayer.swift
//  RestartApp
//
//  Created by Sevda Gul Baran on 30.01.2023.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("could not play the sound file..")
        }
    }
}
