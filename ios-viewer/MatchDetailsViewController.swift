//
//  MatchDetailsViewController.blue
//  scout-viewer-2016-iOS
//
//  Created by Citrus Circuits on 2/16/15.
//  Copyright (c) 2016 Citrus Circuits. All rights reserved.
//

import UIKit

class MatchDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //get firebase fetcher
    var firebaseFetcher = AppDelegate.getAppDelegate().firebaseFetcher;
    
    @objc var matchNumber = -1
    
    
    @objc var match: Match? = nil {
        didSet {
            updateUI()
        }
    }
    
    //used in valueforkey to iterate thru tables of similar names
    let mapping = ["1", "2", "3"]
    
    //keys for the tables
    var tableKeys: [String] = []
    
    //score labels
    @IBOutlet weak var redOfficialScoreLabel: UILabel!
    @IBOutlet weak var blueOfficialScoreLabel: UILabel!
    @IBOutlet weak var redPredictedScoreLabel: UILabel!
    @IBOutlet weak var bluePredictedScoreLabel: UILabel!
    
    @IBOutlet weak var blueWinPercentage: UILabel!
    @IBOutlet weak var redWinPercentage: UILabel!
    //tables and titles
    
    @IBOutlet weak var r1Button: UIButton!
    @IBOutlet weak var r2Button: UIButton!
    @IBOutlet weak var r3Button: UIButton!
    
    @IBOutlet weak var redTableView: UITableView!
    
    @IBOutlet weak var b1Button: UIButton!
    @IBOutlet weak var b2Button: UIButton!
    @IBOutlet weak var b3Button: UIButton!
    
    @IBOutlet weak var blueTableView: UITableView!
    
    func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        //can't select
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //get red teams
        let redTeams = firebaseFetcher?.getTeamsFromNumbers(match?.redAllianceTeamNumbers!)
        //get blue teams
        let blueTeams = firebaseFetcher?.getTeamsFromNumbers(match?.blueAllianceTeamNumbers!)
        
        //get cell
        let cell : MatchDetailsTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MatchDetailsCell", for: indexPath) as! MatchDetailsTableViewCell
        
        //set datapointLabel to tableKeys
        if indexPath.row != tableKeys.count {
            cell.datapointLabel.text = Utils.humanReadableNames[tableKeys[indexPath.row]]
        }
        
        //setup the label stuff
        var size: CGFloat = CGFloat((firebaseFetcher?.currentMatchManager.textSize)!)
        var numLines = 1
        if (firebaseFetcher?.currentMatchManager.matchDetailsScroll ?? false) {
            numLines = 0
        }
        cell.datapointLabel.font = cell.datapointLabel.font.withSize(size)
        cell.team1.font = cell.team1.font.withSize(size)
        cell.team2.font = cell.team2.font.withSize(size)
        cell.team3.font = cell.team3.font.withSize(size) // or NSLineBreakMode.ByWordWrapping
        cell.datapointLabel.numberOfLines = numLines
        cell.team1.lineBreakMode = .byWordWrapping // or NSLineBreakMode.ByWordWrapping
        cell.team2.lineBreakMode = .byWordWrapping
        cell.team3.lineBreakMode = .byWordWrapping
        cell.team1.numberOfLines = 0
        cell.team2.numberOfLines = 0
        cell.team3.numberOfLines = 0
        
        var teams: [Team]?
        
        switch tableView {
        case redTableView:
            teams = redTeams
        case blueTableView:
            teams = blueTeams
        default:
            break
        }
        
        if tableKeys[indexPath.row].contains("calculatedData.") {
            if Utils.teamDetailsKeys.percentageValues.contains(tableKeys[indexPath.row]) {
                //If the value is a percentage, multiply float by 100 and add %
                cell.team1.text = "\(String(describing: Utils.roundValue(((Utils.unwrap(any: teams?[0].calculatedData?.dictionaryRepresentation()[tableKeys[indexPath.row].replacingOccurrences(of: "calculatedData.", with: "")]) as! Float) * 100), toDecimalPlaces: 2)))%"
                cell.team2.text = "\(String(describing: Utils.roundValue(((Utils.unwrap(any: teams?[1].calculatedData?.dictionaryRepresentation()[tableKeys[indexPath.row].replacingOccurrences(of: "calculatedData.", with: "")]) as! Float) * 100), toDecimalPlaces: 2)))%"
                cell.team3.text = "\(String(describing: Utils.roundValue(((Utils.unwrap(any: teams?[2].calculatedData?.dictionaryRepresentation()[tableKeys[indexPath.row].replacingOccurrences(of: "calculatedData.", with: "")]) as! Float) * 100), toDecimalPlaces: 2)))%"
            } else {
                cell.team1.text = String(describing: Utils.unwrap(any: teams?[0].calculatedData?.dictionaryRepresentation()[tableKeys[indexPath.row].replacingOccurrences(of: "calculatedData.", with: "")]))
                cell.team2.text = String(describing: Utils.unwrap(any: teams?[1].calculatedData?.dictionaryRepresentation()[tableKeys[indexPath.row].replacingOccurrences(of: "calculatedData.", with: "")]))
                cell.team3.text = String(describing: Utils.unwrap(any: teams?[2].calculatedData?.dictionaryRepresentation()[tableKeys[indexPath.row].replacingOccurrences(of: "calculatedData.", with: "")]))
            }
        } else {
            if Utils.teamDetailsKeys.percentageValues.contains(tableKeys[indexPath.row]) {
                //If the value is a percentage, multiply float by 100 and add %
                cell.team1.text = "\(String(describing: Utils.roundValue(((Utils.unwrap(any: teams?[0].dictionaryRepresentation()[tableKeys[indexPath.row]]) as! Float) * 100), toDecimalPlaces: 2)))%"
                cell.team2.text = "\(String(describing: Utils.roundValue(((Utils.unwrap(any: teams?[1].dictionaryRepresentation()[tableKeys[indexPath.row]]) as! Float) * 100), toDecimalPlaces: 2)))%"
                cell.team3.text = "\(String(describing: Utils.roundValue(((Utils.unwrap(any: teams?[2].dictionaryRepresentation()[tableKeys[indexPath.row]]) as! Float) * 100), toDecimalPlaces: 2)))%"
            } else {
                cell.team1.text = String(describing: Utils.unwrap(any: teams?[0].dictionaryRepresentation()[tableKeys[indexPath.row]]))
                cell.team2.text = String(describing: Utils.unwrap(any: teams?[1].dictionaryRepresentation()[tableKeys[indexPath.row]]))
                cell.team3.text = String(describing: Utils.unwrap(any: teams?[2].dictionaryRepresentation()[tableKeys[indexPath.row]]))
            }
        }
        
        //if it's a float, round to the nearest hundreth
        if Float(cell.team1.text!) != nil {
            cell.team1.text = Utils.roundValue(Float(cell.team1.text!)!, toDecimalPlaces: 2)
        }
        if Float(cell.team2.text!) != nil {
            cell.team2.text = Utils.roundValue(Float(cell.team2.text!)!, toDecimalPlaces: 2)
        }
        if Float(cell.team3.text!) != nil {
            cell.team3.text = Utils.roundValue(Float(cell.team3.text!)!, toDecimalPlaces: 2)
        }
        
        return cell
    }
    
    //how many rows are there (all the keys)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (firebaseFetcher?.currentMatchManager.matchDetailsScroll ?? false) {
            tableView.isScrollEnabled = true
        } else {
            tableView.isScrollEnabled = false
        }
        tableKeys = (firebaseFetcher?.currentMatchManager.matchDetailsDatapoints)!
        return tableKeys.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if (firebaseFetcher?.currentMatchManager.matchDetailsScroll ?? false) {
            let boi = CGFloat(Double((firebaseFetcher?.currentMatchManager.textSize)!) * (Double((firebaseFetcher?.currentMatchManager.matchDetailsDatapoints[indexPath.row].count)!)/10.0))
            if boi <= CGFloat(20) {
                return CGFloat(20)
            }
            return boi
        } else {
            return CGFloat(14)
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        redTableView.reloadData()
        blueTableView.reloadData()
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableKeys = (firebaseFetcher?.currentMatchManager.matchDetailsDatapoints)!
        NotificationCenter.default.addObserver(self, selector: #selector(MatchDetailsViewController.checkRes(_:)), name: NSNotification.Name(rawValue: "updateLeftTable"), object: nil)
        
        updateUI()
        //register table views
        self.redTableView.register(UINib(nibName: "MatchDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "MatchDetailsCell")
        self.blueTableView.register(UINib(nibName: "MatchDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "MatchDetailsCell")
        //register self as delegate and dataSource so it can feed data to tableviews
        self.redTableView.delegate = self
        self.redTableView.dataSource = self
        self.blueTableView.delegate = self
        self.blueTableView.dataSource = self
        blueTableView.reloadData()
        redTableView.reloadData()
    }
    
    fileprivate func updateUI() {
        if redOfficialScoreLabel == nil {
            return
        }
        
        //if match exists
        if let match = match {
            if match.number != -1 {
                //setting title
                title = "Q\(String(describing: match.number))"
            } else {
                title = "???"
            }
            if let cd = match.calculatedData {
                //setting labels
                redOfficialScoreLabel.text = "Score: \(getLabelTitle(match.redScore))"
                redPredictedScoreLabel.text = "Pred. Score: \(getLabelTitle(cd.predictedRedScore))"
                if match.calculatedData?.redWinChance != nil {
                    redWinPercentage.text = "Win Chance: \(roundValue(((match.calculatedData?.redWinChance)! * 100) as AnyObject, toDecimalPlaces: 0))%"
                } else {
                    redWinPercentage.text = "Win Chance: 0%"
                }
            }
            //get red teams from match
            let redTeams = firebaseFetcher?.getTeamsFromNumbers(match.redAllianceTeamNumbers!)
            if (redTeams?.count)! > 0 {
                //Index goes from 1 to 3, because thats the way the ui labels are named.
                for index in 1...(redTeams?.count)! {
                    if index <= 3 {
                        //setting the titles of the team button numbers. V Sketch
                        (value(forKey: "r\(mapping[index-1])Button") as! UIButton).setTitle("\(match.redAllianceTeamNumbers![index-1])", for: UIControlState())
                        if ((redTeams![index-1]).calculatedData?.dysfunctionalPercentage)! > Float(0.0) {
                            switch index {
                            case 1:
                                self.r1Button.backgroundColor = UIColor.green
                            case 2:
                                self.r2Button.backgroundColor = UIColor.green
                            case 3:
                                self.r3Button.backgroundColor = UIColor.green
                            default:
                                print("This is an executable statement")
                            }
                        }
                        
                    }
                }
            }
            
            //setting labels
            blueOfficialScoreLabel.text = "Score: \(getLabelTitle(match.blueScore))"
            bluePredictedScoreLabel.text = "Pred. Score: \(getLabelTitle(match.calculatedData?.predictedBlueScore))"
            if match.calculatedData?.blueWinChance != nil {
                blueWinPercentage.text = "Win Chance: \(roundValue(((match.calculatedData?.blueWinChance)! * 100) as AnyObject, toDecimalPlaces: 0))%"
            } else {
                blueWinPercentage.text = "Win Chance: 0%"
            }
            
            let blueTeams = firebaseFetcher?.getTeamsFromNumbers(match.blueAllianceTeamNumbers)
            if (blueTeams?.count)! > 0 {
                for index in 1...(blueTeams?.count)! {
                    if index <= 3 {
                        //setting team button titles
                        (value(forKey: "b\(mapping[index - 1])Button") as! UIButton).setTitle("\(match.blueAllianceTeamNumbers![index - 1])", for: UIControlState())
                    }
                    if ((blueTeams![index-1]).calculatedData?.dysfunctionalPercentage)! > Float(0.0) {
                        switch index {
                        case 1:
                            self.b1Button.backgroundColor = UIColor.green
                        case 2:
                            self.b2Button.backgroundColor = UIColor.green
                        case 3:
                            self.b3Button.backgroundColor = UIColor.green
                        default:
                            print("This is an executable statement")
                        }
                    }
                }
            }
        }
    }
    
    enum PlayRelationship : String {
        case With = "With"
        case Against = "Against"
        case Both = "Both"
        case Neither = "Neither"
    }
    
    //returns whether you are playing against, with, both, or neither a team
    func playWithAgainstOrBothWithTeam(number: Int) -> PlayRelationship {
        var playWith = false
        var playAgainst = false
        //get our matches
        let ourMatches = firebaseFetcher?.getMatchesForTeam(1678)
        //get rid of already played matches
        let futureMatches = ourMatches?.filter { $0.number >= firebaseFetcher?.currentMatchManager.currentMatch ?? 0 }
        //iterate thru unplayed matches
        for match in futureMatches! {
            //if we're on red and they're on red, play with them. if we're on red and they're on blue, play against them.
            if (match.redAllianceTeamNumbers?.contains(1678))! {
                if (match.redAllianceTeamNumbers?.contains(number))! {
                    playWith = true
                } else if (match.blueAllianceTeamNumbers?.contains(number))! {
                    playAgainst = true
                }
            //if we're on blue and they're on blue, play with them. if we're on blue and they're on red, play against them.
            } else if (match.blueAllianceTeamNumbers?.contains(1678))! {
                if (match.blueAllianceTeamNumbers?.contains(number))! {
                    playWith = true
                } else if (match.redAllianceTeamNumbers?.contains(number))! {
                    playAgainst = true
                }
            }
        }
        //if we're playing with and against them, return both. if just play with or against, return the respective enum. if none of those, return neither
        if playWith && playAgainst {
            return .Both
        } else if playWith {
            return .With
        } else if playAgainst {
            return .Against
        } else {
            return .Neither
        }
    }
    
    //color
    func withAgainstAttributedStringForTeam(number: Int) -> NSAttributedString {
        var attString : NSAttributedString
        let withOrAgainst = playWithAgainstOrBothWithTeam(number: number)
        switch withOrAgainst {
        case .With : attString = NSAttributedString(string: withOrAgainst.rawValue, attributes: [NSAttributedStringKey.foregroundColor: UIColor.green])
        case .Against : attString = NSAttributedString(string: withOrAgainst.rawValue, attributes: [NSAttributedStringKey.foregroundColor: UIColor.orange])
        case .Both : attString = NSAttributedString(string: withOrAgainst.rawValue, attributes: [NSAttributedStringKey.foregroundColor: UIColor.brown])
        case .Neither : attString = NSAttributedString(string: withOrAgainst.rawValue, attributes: [NSAttributedStringKey.foregroundColor: UIColor.gray])
        }
        return attString
    }
    
    @IBAction func teamTapped(_ sender: UIButton) {
        print("WE STILL LOGGING")
        performSegue(withIdentifier: "GoToTeamController", sender: sender)
    }
    fileprivate func getLabelTitle(_ value: Int?) -> String {
        let unknown = "???"
        if value != nil {
            return "\(value!)"
        }
        return unknown
    }
    
    fileprivate func getLabelTitle(_ v: Float?) -> String {
        let unknown = "???"
        if let value = v {
            if value != -1 {
                return "\(value)"
            }
        }
        return unknown
    }
    
    fileprivate func getErrorLabelText(_ officialScore: Int?, predictedScore: Float?) -> String {
        if let err = getError(officialScore, predictedScore: predictedScore) {
            return roundValue(NSNumber(value: err * 100.0), toDecimalPlaces: 2) + "%"
        }
        
        return "???"
    }
    
    fileprivate func getError(_ officialScore: Int?, predictedScore: Float?) -> Float? {
        if let officialScore = officialScore,
            let predictedScore = predictedScore {
                if officialScore != -1 {
                    return abs((Float(officialScore) - predictedScore) / Float(officialScore))
                }
        }
        
        return nil
    }
    @objc func checkRes(_ notification:Notification) {
        if notification.name.rawValue == "updateLeftTable" {
            if self.match == nil {
                self.match = self.firebaseFetcher?.currentMatchManager.matches[self.matchNumber - 2] //Why the -2???
            }
            self.updateUI()
        }
    }
    
    //prepare to segue to appropriate vc
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let button = sender as? UIButton,
            let teamNumTapped = Int((button.titleLabel?.text)!) {
                if let dest = segue.destination as? TeamDetailsTableViewController {
                    dest.team = firebaseFetcher?.getTeam(teamNumTapped)
                }
        }
    }
}
