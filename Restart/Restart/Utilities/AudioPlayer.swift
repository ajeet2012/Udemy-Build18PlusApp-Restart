//
//  AudioPlayer.swift
//  Restart
//
//  Created by Ajeet Sharma on 11/04/26.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(fileName: String, type: String) {
    guard let url = Bundle.main.url(forResource: fileName, withExtension: type) else { return }
    do {
        audioPlayer = try AVAudioPlayer(contentsOf: url)
        audioPlayer?.play()
    } catch {
        print("Error playing sound: \(error.localizedDescription)")
    }
}
