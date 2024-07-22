//
//  AppShareData.swift
//  Vidhik
//
//  Created by NumeroEins on 11/01/24.
//


import UIKit

let objAppShareData = AppShareData.sharedObject()

class AppShareData {
    //MARK: - Shared object
    private static var sharedManager: AppShareData = {
        let manager = AppShareData()
        return manager
    }()
    
    // MARK: - Accessors
    class func sharedObject() -> AppShareData {
        return sharedManager
    }
    var isFromDoneSignUp = false
    var TabselectedIndex = 2
    var SelectedProfile = false
    var strUserType = ""

      func showAlert(message: String, title: String = "", controller: UIViewController) {
          let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
          let OKAction = UIAlertAction(title: NSLocalizedString("Ok", tableName: nil, comment: ""), style: .default, handler: nil)
          let color = #colorLiteral(red: 0.2, green: 0.5568627451, blue: 0.8117647059, alpha: 1)
          OKAction.setValue(color, forKey: "titleTextColor")

          alertController.addAction(OKAction)
          controller.present(alertController, animated: true, completion: nil)
      }
   
//    func alertForNavigateToLoginNav(controller: UIViewController){
//        let alertController = UIAlertController(title: "Alert".localize, message: "Your session is expired, please login again.".localize, preferredStyle: .alert)
////        let OKAction = UIAlertAction(title: NSLocalizedString("OK", tableName: nil, comment: ""), style: .default, handler: nil)
//        let OKAction = UIAlertAction(title: "Ok".localize, style: .default, handler: { action in
//            AppDelegate.shared.showLogin_Signup()
//        })
//        let color = #colorLiteral(red: 0.2, green: 0.5568627451, blue: 0.8117647059, alpha: 1)
//        OKAction.setValue(color, forKey: "titleTextColor")
//        alertController.addAction(OKAction)
//        controller.present(alertController, animated: true, completion: nil)
//    }
    
    func getConvertDateto(strDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "YYYY-MM-DD HH:MM:SS ±HHMM" //Input Format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let UTCDate = dateFormatter.date(from: strDate)
        dateFormatter.dateFormat = "dd/MM/yyyy, hh:mm a" // Output Format
        dateFormatter.timeZone = TimeZone.current
        let UTCToCurrentFormat = dateFormatter.string(from: UTCDate!)
        return UTCToCurrentFormat
    }
    func getFormattedDateFromDate222(strDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm a" //Input Format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let UTCDate = dateFormatter.date(from: strDate)
        dateFormatter.dateFormat = "d MMM yyyy, h:mm a" // Output Format
        dateFormatter.timeZone = TimeZone.current
        let UTCToCurrentFormat = dateFormatter.string(from: UTCDate!)
        return UTCToCurrentFormat
    }
    func getFormattedDateFromDaterechargeHistory(strDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm a" //Input Format
       // dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let UTCDate = dateFormatter.date(from: strDate)
        dateFormatter.dateFormat = "d MMM yyyy, h:mm a" // Output Format
        let UTCToCurrentFormat = dateFormatter.string(from: UTCDate!)
        return UTCToCurrentFormat
    }

    
    func getFormattedDateFromDate1(strDate: String) -> String {
     
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat =    "dd - MM - yyy"//Input Format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let UTCDate = dateFormatter.date(from: strDate)
        dateFormatter.dateFormat = "dd/MM/yyyy"  // Output Format
        dateFormatter.timeZone = TimeZone.current
        let UTCToCurrentFormat = dateFormatter.string(from: UTCDate!)
        return UTCToCurrentFormat
    }
    
    func getFormattedDateFromDate2(strDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" //Input Format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let UTCDate = dateFormatter.date(from: strDate)
        dateFormatter.dateFormat = "dd/MM/yyyy" // Output Format
        dateFormatter.timeZone = TimeZone.current
        let UTCToCurrentFormat = dateFormatter.string(from: UTCDate!)
        
        return UTCToCurrentFormat
    }
    
    func getFormattedDateFromDate12(strDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ" //Input Format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let UTCDate = dateFormatter.date(from: strDate)
        dateFormatter.dateFormat = "dd MMM yyyy" // Output Format
        dateFormatter.timeZone = TimeZone.current
        let UTCToCurrentFormat = dateFormatter.string(from: UTCDate!)
        
        return UTCToCurrentFormat
    }
    
    
    
    
    func getFormattedDateFromDate3(strDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss" //Input Format
        dateFormatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        let UTCDate = dateFormatter.date(from: strDate)
        dateFormatter.dateFormat = "dd/MM/yyyy" // Output Format
        dateFormatter.timeZone = TimeZone.current
        let UTCToCurrentFormat = dateFormatter.string(from: UTCDate!)
        return UTCToCurrentFormat
    }
    
 
    
    
    func compressImage (_ image: UIImage) -> UIImage {
        
        let actualHeight:CGFloat = image.size.height
        let actualWidth:CGFloat = image.size.width
        let imgRatio:CGFloat = actualWidth/actualHeight
        let maxWidth:CGFloat = 500.0
        let resizedHeight:CGFloat = maxWidth/imgRatio
        let compressionQuality:CGFloat = 0.5
        
        let rect:CGRect = CGRect(x: 0, y: 0, width: maxWidth, height: resizedHeight)
        UIGraphicsBeginImageContext(rect.size)
        image.draw(in: rect)
        let img: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        let imageData:Data = img.jpegData(compressionQuality: compressionQuality)!
        UIGraphicsEndImageContext()
        return UIImage(data: imageData)!
    }
    

}

extension AppShareData
{

       // MARK: - saveUpdateUserInfoFromAppshareData ---------------------
       //func SaveUpdateUserInfoFromAppshareData(userDetail:[String:Any])
//       {
//        
//          var userDetailRemoveNull = [String:Any]()
//        
//           userDetailRemoveNull = self.removeNSNull(from: userDetail);
//           do {
//               let archived = try NSKeyedArchiver.archivedData(withRootObject: userDetailRemoveNull, requiringSecureCoding: false)
//               
//               UserDefaults.standard.set(archived, forKey: UserDefaults.Keys.userInfo)
//               
//           } catch { print(error) }
//           
//       }

    // MARK: - FetchUserInfoFromAppshareData -------------------------
//     func fetchUserInfoFromAppshareData()
//     {
//         
//         if let unarchivedObject = UserDefaults.standard.object(forKey:UserDefaults.Keys.userInfo) as? NSData {
//             do {
//                 let records  = try NSKeyedUnarchiver.unarchivedObject(ofClasses: [NSDictionary.self, Record.self], from:  unarchivedObject as Data)
//                 print("records----- \(records ?? [:])")
//                 objUserDetail = UserDetailModel.init(dict: records as? [String: Any] ?? [:])
//               // userDetail = self.removeNSNull(from: userDetail);
//
//             } catch { print(error) }
//         }
//
//     }
//    
//    func resetDefaultsAlluserInfo(){
//           let defaults = UserDefaults.standard
//           let myVenderId = defaults.string(forKey:UserDefaults.Keys.strVenderId)
//           let fcmDevceToken = defaults.string(forKey:UserDefaults.Keys.deviceToken)
//
//           let dictionary = defaults.dictionaryRepresentation()
//           dictionary.keys.forEach { key in
//               defaults.removeObject(forKey: key)
//           }
//           
//           if let bundleID = Bundle.main.bundleIdentifier {
//               UserDefaults.standard.removePersistentDomain(forName: bundleID)
//           }
//           
//           defaults.set(fcmDevceToken, forKey:UserDefaults.Keys.deviceToken)
//           defaults.set(myVenderId ?? "", forKey:UserDefaults.Keys.strVenderId)
//        objUserDetail = UserDetailModel(dict: [:])
//       }
    
    func removeNSNull(from dict: [String: Any]) -> [String: Any] {
        var mutableDict = dict
        
        let keysWithEmptString = dict.filter { $0.1 is NSNull }.map { $0.0 }
        for key in keysWithEmptString {
            mutableDict[key] = ""
            print(key)
        }
        return mutableDict
    }
    
    // Array to json formate convert
    func json(from arrayAdtionalEmail:[String]) -> String? {
        
        var myJsonString = ""
        do {
            let data =  try JSONSerialization.data(withJSONObject:arrayAdtionalEmail, options: .prettyPrinted)
            myJsonString = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
        } catch {
            print(error.localizedDescription)
        }
        return myJsonString
    }
}


