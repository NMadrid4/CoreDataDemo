//
//  ViewController2.swift
//  CoreDataTest
//
//  Created by Melanie on 12/5/18.
//

import UIKit

class ViewController2: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        var nsDictionary: NSDictionary?
        if let path = Bundle.main.path(forResource: "TestProperties", ofType: "plist") {
            nsDictionary = NSDictionary(contentsOfFile: path)
            
//            for key in nsDictionary?.allKeys as! [String] {
//                print(nsDictionary!.value(forKey: key))
//            }

        }
        
        
        
        let config = parseConfig()
        print(config.name)
//        print(config.id)
    }
    
    struct Config: Decodable {
        private enum CodingKeys: String, CodingKey {
            case name
        }
        
        let name: String
    }
    
    func parseConfig() -> Config {
        let url = Bundle.main.url(forResource: "TestProperties", withExtension: "plist")!
        let data = try! Data(contentsOf: url)
        let decoder = PropertyListDecoder()
        return try! decoder.decode(Config.self, from: data)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
