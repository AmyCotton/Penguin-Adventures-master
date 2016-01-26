import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController {
    

	@IBOutlet weak var storyButtonOne: UIButton!
	
	@IBOutlet weak var storyButtonTwo: UIButton!
	
	@IBOutlet weak var storyButtonThree: UIButton!
	
	@IBOutlet weak var storyButtonFour: UIButton!
	
	
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
		
		self.storyButtonOne.hidden = true
		self.storyButtonTwo.hidden = true
		self.storyButtonThree.hidden = true
		self.storyButtonFour.hidden = true
        
        locationManager.requestAlwaysAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        
        let bournemouthPierOne = CLLocationCoordinate2D(latitude: 50.715930, longitude: -1.876767)
        let bournemouthPierOneRegion = CLCircularRegion(center: bournemouthPierOne, radius: 50, identifier: "bournemouthPierOne")
        locationManager.startMonitoringForRegion(bournemouthPierOneRegion)
        
        let bournemouthPierTwo = CLLocationCoordinate2D(latitude: 50.719568, longitude: -1.843150)
        let bournemouthPierTwoRegion = CLCircularRegion(center: bournemouthPierTwo, radius: 50, identifier: "bournemouthPierTwo")
        locationManager.startMonitoringForRegion(bournemouthPierTwoRegion)
        
        let bournemouthPierThree = CLLocationCoordinate2D(latitude: 50.719798, longitude: -1.879381)
        let bournemouthPierThreeRegion = CLCircularRegion(center: bournemouthPierThree, radius: 50, identifier: "bournemouthPierThree")
        locationManager.startMonitoringForRegion(bournemouthPierThreeRegion)
		
		let bournemouthPierFour = CLLocationCoordinate2D(latitude: 50.718186, longitude: -1.876749)
		let bournemouthPierFourRegion = CLCircularRegion(center: bournemouthPierFour, radius: 50, identifier: "bournemouthPierFour")
		locationManager.startMonitoringForRegion(bournemouthPierFourRegion)

    }
}

extension ViewController: CLLocationManagerDelegate {
    
    @IBAction func helpButton(sender: AnyObject) {
        
        let alertController = UIAlertController(title: "Want to find a penguin?", message:
            "To find a penguin, walk around the Oceanarium untill you get an alert! This will unlock a penguin adventure which you can view by selecting the penguin.", preferredStyle: UIAlertControllerStyle.Alert)
        alertController.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.Default,handler: nil))
        
        self.presentViewController(alertController, animated: true, completion: nil)
    }
        
    
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation = locations.last
        
        if let newLocation = newLocation {
            print(newLocation)
        }
        
    }
    
    func locationManager(manager: CLLocationManager, didExitRegion region: CLRegion) {
        print("Leaving \(region.identifier)")
        
        let refreshAlert = UIAlertController(title: "Story Unavailable", message: "You are now in an area where you cannot view this penguin story anymore. Go back to your previous location to read this story.).", preferredStyle: UIAlertControllerStyle.Alert)
        
        
        refreshAlert.addAction(UIAlertAction(title: "Close", style: .Default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismissViewControllerAnimated(true, completion: nil)
            
            
        }))
        
       // presentViewController(refreshAlert, animated: true, completion: nil)
        
    }
    
    
    func locationManager(manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Entering \(region.identifier)")

		if region.identifier == "bournemouthPierOne" {
		self.storyButtonOne.hidden = false
		} else if region.identifier == "bournemouthPierTwo" {
		self.storyButtonTwo.hidden = false
		} else if region.identifier == "bournemouthPierThree" {
		self.storyButtonThree.hidden = false
		} else if region.identifier == "bournemouthPierFour" {
		self.storyButtonFour.hidden = false
		}
        
        if self.storyButtonOne.hidden == false && self.storyButtonTwo.hidden == false && self.storyButtonThree.hidden == false && storyButtonFour.hidden == false {
        
            let refreshAlert = UIAlertController(title: "Congratulations!", message: "You have discovered all of the penguins!", preferredStyle: UIAlertControllerStyle.Alert)
            
            
            refreshAlert.addAction(UIAlertAction(title: "Close", style: .Default, handler: { (action: UIAlertAction!) in
                
                refreshAlert .dismissViewControllerAnimated(true, completion: nil)
                
                
            }))
            presentViewController(refreshAlert, animated: true, completion: nil)
        
            
        } else {
        
        }
		
		let refreshAlert = UIAlertController(title: "New Penguin Story Found!", message: "You have discovered a new penguin! To read the new story select new penguin that has appeared!", preferredStyle: UIAlertControllerStyle.Alert)
        
        
        refreshAlert.addAction(UIAlertAction(title: "Close", style: .Default, handler: { (action: UIAlertAction!) in
            
            refreshAlert .dismissViewControllerAnimated(true, completion: nil)
            
            
        }))
        
       presentViewController(refreshAlert, animated: true, completion: nil)
    }
    
    
}












	