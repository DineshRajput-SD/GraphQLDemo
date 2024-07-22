//
//  Launchscreen.swift
//  local
//
//  Created by NumeroEins on 09/01/24.
//

import UIKit
import ImageIO


class LaunchscreenVC: UIViewController {
    
//MARK: - @IBOutlet : ----
    
    @IBOutlet weak var imgSplash: UIImageView!

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Add your GIF file to the project and replace "your_gif_filename" with the actual filename
//        if let gifPath = Bundle.main.path(forResource: "Launch", ofType: "gif"),
//           let gifData = try? Data(contentsOf: URL(fileURLWithPath: gifPath)),
//           let image = UIImage.gifImageWithData(gifData) {
//            imageView.image = image
//        }
//        view.addSubview(imageView)
//        self.holdScreenForTwoMinutes()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = view.bounds
    }
    
    func holdScreenForTwoMinutes() {
        // Set the time interval to 2 minutes (120 seconds)
        let timeInterval: TimeInterval = 8
        // Create a Timer object with the specified time interval and a target function
        let timer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
        // Run the timer in the default run loop
        RunLoop.current.add(timer, forMode: .default)
    }
    
    @objc func timerAction() {
        // This function will be called after 2 minutes
//        print("Screen held for 2 minutes")
//        let auth =  UserDefaults.standard.string(forKey: UserDefaults.Keys.token)
//        if auth == "" && auth == "nil" || auth == nil {
//            AppDelegate.shared.setSelectLanguage()
//        }
//        else {
//            let strotpverify = UserDefaults.standard.string(forKey: UserDefaults.Keys.strVarifyOtp)
//            if strotpverify == nil || strotpverify == "" {
//                AppDelegate.shared.setSelectLanguage()
//            }else {
//                AppDelegate.shared.showTabBar()
//            }
//        }
        ObjAppdelegate.loginScreen()
        
        
    }
}


//MARK: - Extenstion UIImage : ----


/*extension UIImage {
    class func gifImageWithData(_ data: Data) -> UIImage? {
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else { return nil }
        return UIImage.animatedImageWithSource(source)
    }

    class func animatedImageWithSource(_ source: CGImageSource) -> UIImage? {
        var frames = [UIImage]()
        let count = CGImageSourceGetCount(source)
        for i in 0..<count {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                frames.append(UIImage(cgImage: image))
            }
        }
        let animation = UIImage.animatedImage(with: frames, duration: totalDuration(for: source))
        return animation
    }

    class func totalDuration(for source: CGImageSource) -> TimeInterval {
        let count = CGImageSourceGetCount(source)
        var totalDuration: TimeInterval = 0

        for i in 0..<count {
            guard let properties = CGImageSourceCopyPropertiesAtIndex(source, i, nil) as? [String: Any],
                  let gifInfo = properties[kCGImagePropertyGIFDictionary as String] as? [String: Any],
                  let duration = gifInfo[kCGImagePropertyGIFDelayTime as String] as? TimeInterval else {
                continue
            }
            totalDuration += duration
        }
        return totalDuration
    }
}
*/
