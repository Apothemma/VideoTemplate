//
//  TemplateDetailsPresenter.swift
//  VideoEditor
//
//  Created by Вячеслав on 29.03.2023.
//

import Foundation
import UIKit
import AVFoundation

protocol TemplateDetailsPresenterProtocol: PresenterProtocol {
    func backButtonPressed()
    func viewDidDisappear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
}



final class TemplateDetailsPresenter {
    private weak var view: TemplateDetailsViewControllerProtocol?
    private let router: TemplateDetailsRouterProtocol
    private let template: Template
    
    private lazy var photos: [[UIImage?]] = {
        return TemplateService.shared.getImages(for: template)
    }()
    
    var audioPlayer: AVAudioPlayer?
    private var timer = Timer()
    private var timerCount = 0
    
    init(view: TemplateDetailsViewControllerProtocol?, router: TemplateDetailsRouterProtocol,
         template: Template) {
        self.view = view
        self.router = router
        self.template = template
    }
}


// MARK: - TemplateDetailsPresenterProtocol

extension TemplateDetailsPresenter: TemplateDetailsPresenterProtocol {
    func viewDidLoad() {
        view?.setTitle(template: template.rawValue)
        startTemplate()
    }
    
    func viewDidAppear(_ animated: Bool) {
        let queue = DispatchQueue(label: "sound")
        queue.async {
            while !self.photos.isEmpty {
                self.playSound()
                break
            }
        }
    }
    
    func viewDidDisappear(_ animated: Bool) {
        stopSound()
    }
    
    func backButtonPressed() {
        router.popDetail(animated: true)
    }
}


// MARK: - private

private extension TemplateDetailsPresenter {
    func startTemplate() {
        timer = Timer.scheduledTimer(timeInterval: 1.4, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
    }
    
    func playSound() {
        let url = TemplateService.shared.getTemplateMusicURL(for: template)

        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.numberOfLoops = -1
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch {
            print("Ошибка воспроизведения музыки: \(error.localizedDescription)")
        }
    }
    
    func stopSound() {
        audioPlayer?.stop()
    }
}


// MARK: - @objc

@objc
private extension TemplateDetailsPresenter {
    func timerCounter() {
        timerCount = (timerCount) % photos[0].count + 1
        
        self.view?.setBackgroundImage(photos[0][timerCount - 1])

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) { [self] in
            view?.setImage(photos[1][safe: timerCount])
        }
    }

}
