//
//  Utils.swift
//  scout-viewer-2016-iOS
//
//  Created by Citrus Circuits on 2/19/15.
//  Copyright (c) 2016 Citrus Circuits. All rights reserved.
//
import Foundation


/**
 Rounds a value.
 - parameter value: Value to be rounded
 - parameter numDecimalPlaces: How many decimal places it should be rounded to
 */
func roundValue(_ value: AnyObject?, toDecimalPlaces numDecimalPlaces: Int) -> String {
    if let val = value as? NSNumber {
        let f = NumberFormatter()
        f.numberStyle = NumberFormatter.Style.decimal
        f.maximumFractionDigits = numDecimalPlaces
        
        if val == 0 {
            return "0"
        }
        
        return f.string(from: val as NSNumber!)!
    }
    
    return ""
}

/**
 Converts a float value into a percentage.
 - parameter number: Float value
 */
func percentageValueOf(_ number: AnyObject?) -> String {
    if let n = number as? Float {
        return "\(roundValue(NSNumber(value: n * 100), toDecimalPlaces: 1))%"
    }
    
    return ""
}

/**
 Inserts commas and spaces between capitals in a string.
 - parameter string: String to be change
 */
func insertCommasAndSpacesBetweenCapitalsInString(_ string: String) -> String {
    var toReturn = ""
    for char in string.characters {
        if "\(char)".uppercased() == "\(char)" {
            toReturn += ", \(char)"
        } else {
            toReturn.append(char)
        }
    }
    
    for _ in 0...1 {
        toReturn.remove(at: string.startIndex)
    }
    
    return toReturn
}

/**
 Turns an NSNumArray into an Int Array
 - parameter nsNumberArray: NSNumberArray to be converted
 */
func nsNumArrayToIntArray(_ nsNumberArray: [NSNumber]) -> [Int] {
    var values: [Int] = []
    for num in nsNumberArray {
        if let int = Int("\(num)") {
            values.append(int)
        }
    }
    
    return values
}

/**
 A class filled with undoubtably underwhelmingly useful utilities.
 */
@objc class Utils: NSObject {
    static let teamDetailsKeys = TeamDetailsKeys()
    struct TeamDetailsKeys {
        
        let yesNoKeys : [String] = [
            "calculatedData.canScoreBothSwitchSidesAuto",
            "calculatedData.canPlaceHighLayerCube"
        ]
        
        let abilityKeys = [
            "calculatedData.firstPickAbility",
            "calculatedData.secondPickAbility",
            "calculatedData.autoAbility",
            "calculatedData.citrusDPR",
            "calculatedData.avgGroundIntakes",
            "calculatedData.avgTorque",
            "calculatedData.avgEvasion",
            "calculatedData.avgSpeed",
            "calculatedData.avgBallControl",
            "calculatedData.avgDefense",
            "calculatedData.actualNumRPs",
            "calculatedData.predictedNumRPs"
        ]
        
        let allTeamKeys = [
            "name",
            "number",
            "pitAvailableWeight",
            "pitDriveTrain",
            "pitSEALsNotes",
            "pitProgrammingLanguage",
            "pitClimberType",
            "pitRobotWidth",
            "pitRobotLength",
            "pitHasCamera",
            "pitWheelDiameter",
            "pitCanDoPIDOnDriveTrain",
            "pitHasGyro",
            "pitHasEncodersOnBothSides",
            "calculatedData.firstPickAbility",
            "calculatedData.secondPickAbility",
            "calculatedData.disabledPercentage",
            "calculatedData.incapacitatedPercentage",
            "calculatedData.dysfunctionalPercentage",
            "calculatedData.numMatchesPlayed",
            "calculatedData.avgNumRobotsLifted",
            "calculatedData.avgNumCubesPlacedAuto",
            "calculatedData.avgNumCubesPlacedTele",
            "calculatedData.avgNumAlliancePlatformIntakeAuto",
            "calculatedData.avgNumAlliancePlatformIntakeTele",
            "calculatedData.avgNumOpponentPlatformIntakeTele",
            "calculatedData.avgNumCubesFumbledAuto",
            "calculatedData.avgNumCubesFumbledTele",
            "calculatedData.avgNumElevatedPyramidIntakeAuto",
            "calculatedData.avgNumElevatedPyramidIntakeTele",
            "calculatedData.avgNumGroundPyramidIntakeAuto",
            "calculatedData.avgNumGroundPyramidIntakeTele",
            "calculatedData.avgNumGroundIntakeTele",
            "calculatedData.avgNumGroundPortalIntakeTele",
            "calculatedData.avgNumHumanPortalIntakeTele",
            "calculatedData.avgNumExchangeInputTele",
            "calculatedData.avgNumReturnIntakeTele",
            "calculatedData.avgNumGoodDecisions",
            "calculatedData.avgNumBadDecisions",
            "calculatedData.avgCubesSpilledAuto",
            "calculatedData.avgCubesSpilledTele",
            "calculatedData.avgCubesPlacedInScaleAuto",
            "calculatedData.avgCubesPlacedInScaleTele",
            "calculatedData.avgAllianceSwitchCubesAuto",
            "calculatedData.avgAllianceSwitchCubesTele",
            "calculatedData.avgOpponentSwitchCubesTele",
            "calculatedData.avgScaleTimeAuto",
            "calculatedData.avgScaleTimeTele",
            "calculatedData.avgTimeToOwnAllianceSwitchAuto",
            "calculatedData.avgTimeToOwnScaleAuto",
            "calculatedData.avgAllianceSwitchTimeAuto",
            "calculatedData.avgAllianceSwitchTimeTele",
            "calculatedData.avgOpponentSwitchTimeTele",
            "calculatedData.avgScaleCubesBy100s",
            "calculatedData.avgScaleCubesBy110s",
            "calculatedData.avgAllVaultTime",
            "calculatedData.avgClimbTime",
            "calculatedData.avgAgility",
            "calculatedData.avgSpeed",
            "calculatedData.avgDefense",
            "calculatedData.avgDrivingAbility",
            "calculatedData.totalNumGoodDecisions",
            "calculatedData.totalNumBadDecisions",
            "calculatedData.totalNumParks",
            "calculatedData.totalNumRobotsLifted",
            "calculatedData.totalNumRobotLiftAttempts",
            "calculatedData.totalNumRobotsGroundLifted",
            "calculatedData.totalNumRobotGroundLiftAttempts",
            "calculatedData.totalNumHighLayerScaleCubes",
            "calculatedData.totalSuperNotes",
            "calculatedData.avgTotalCubesPlaced",
            "calculatedData.numSuccessfulClimbs",
            "calculatedData.predictedClimb",
            "calculatedData.climbPercentage",
            "calculatedData.soloClimbPercentage",
            "calculatedData.activeAssistClimbPercentage",
            "calculatedData.activeLiftClimbPercentage",
            "calculatedData.activeNoClimbLiftClimbPercentage",
            "calculatedData.assistedClimbPercentage",
            "calculatedData.parkPercentage",
            "calculatedData.predictedSeed",
            "calculatedData.actualSeed",
            "calculatedData.predictedNumAllianceSwitchCubesAuto",
            "calculatedData.predictedNumScaleCubesAuto",
            "calculatedData.predictedPark",
            "calculatedData.predictedNumRPs",
            "calculatedData.predictedTotalNumRPs",
            "calculatedData.totalNumRPs",
            "calculatedData.actualNumRPs",
            "calculatedData.autoRunPercentage",
            "calculatedData.allianceSwitchSuccessPercentageAuto",
            "calculatedData.allianceSwitchSuccessPercentageTele",
            "calculatedData.opponentSwitchSuccessPercentageTele",
            "calculatedData.scaleSuccessPercentageAuto",
            "calculatedData.scaleSuccessPercentageTele",
            "calculatedData.allianceSwitchFailPercentageAuto",
            "calculatedData.allianceSwitchFailPercentageTele",
            "calculatedData.opponentSwitchFailPercentageTele",
            "calculatedData.scaleFailPercentageAuto",
            "calculatedData.scaleFailPercentageTele",
            "calculatedData.canScoreBothSwitchSidesAuto",
            "calculatedData.canPlaceHighLayerCube",
            "calculatedData.didThreeExchangeInputPercentage",
            "calculatedData.percentSuccessOppositeSwitchSideAuto",
            "calculatedData.canGroundIntake",
            "calculatedData.teleopExchangeAbility",
            "calculatedData.teleopScaleAbility",
            "calculatedData.teleopAllianceSwitchAbility",
            "calculatedData.teleopOpponentSwitchAbility",
            "calculatedData.pitAvgDriveTime",
            "calculatedData.pitAvgRampTime",
            "calculatedData.maxScaleCubes",
            "calculatedData.maxExchangeCubes",
            "calculatedData.avgSwitchOwnership",
            "calculatedData.RScoreDefense",
            "calculatedData.RScoreSpeed",
            "calculatedData.RScoreAgility",
            "calculatedData.RScoreDrivingAbility",
            "calculatedData.avgAllianceSwitchCycleTimeAuto",
            "calculatedData.avgAllianceSwitchCycleTimeTele",
            "calculatedData.avgOpponentSwitchCycleTimeTele",
            "calculatedData.avgScaleCycleTimeAuto",
            "calculatedData.avgScaleCycleTimeTele",
            "calculatedData.avgExchangeCycleTime",
        ]
        
        /**
         Values that should not be graphed
         */
        let notGraphingValues = [
            "First Pick Ability",
            "Second Pick Ability",
            "Avg. Driving Ability",
            "Tele SW Fail %",
            "Tele SC Fail %",
            "Auto SW Fail %",
            "Auto SC Fail %",
            "Auto Multi-Side",
            "Picklist Position",
            "Can Place High Layer Cube",
            "Auto SW Success %",
            "Avg. Cubes Placed",
        ]
        
        /** Values that should be displayed as long text cells */
        let TIMDLongTextCells : [String] = [
            "superNotes"
        ]
        
        let longTextCells : [String] = [
            "pitSEALsNotes"
        ]
        
        let unrankedCells = [
            "selectedImageURL",
            "otherUrls",
            "picklistPosition",
        ]
        
        /** Values to be displayed as percentages. */
        let percentageValues = [
            "calculatedData.disabledPercentage",
            "calculatedData.dysfunctionalPercentage",
            "calculatedData.incapacitatedPercentage",
            "calculatedData.climbPercentage",
            "calculatedData.scaleFailPercentageAuto",
            "calculatedData.switchFailPercentageAuto",
            "calculatedData.scaleFailPercentageTele",
            "calculatedData.switchFailPercentageTele",
            "calculatedData.autoRunPercentage"
        ]
        
        let addCommasBetweenCapitals : [String] = []
        
        let boolValues = [
            "calculatedData.disabledPercentage",
            "calculatedData.incapacitatedPercentage",
            "calculatedData.canScoreBothSwitchSidesAuto",
            "didMakeAutoRun",
            "crossedAutoZone",
            "didGetDisabled",
            "wasIncapacitated",
            "calculatedData.didClimb",
            "didPark",
            "calculatedData.canScoreBothSwitchSidesAuto",
            "calculatedData.canPlaceHighLayerCube",
            "canPlaceHighLayerCube",
            "pitHasCamera",
        ]
        
        
        let keySetNamesOld = [
            "Information",
            "Ability - High Level",
            "Autonomous",
            "TeleOp",
            "Percentages",
            "Pit Scouting / Robot Design",
            "Additional Info",
            ]
        // MARK: KeySets, TeamDetails keys.
        func keySetNames(_ minimalist : Bool) -> [String] {
            if minimalist {
                return  [
                    "",
                    //"High Level",
                    "Autonomous",
                    "Teleoperated",
                    "Siege",
                    "Status",
                    //superKeys,
                    //pitKeys,
                    //"SEALS"
                ]
            }
            return [
                "Default",
                "High Level",
                "Status",
                "Autonomous",
                "Teleoperated",
                "End Game",
                "Super Scout",
                "Pit Scout",
                "SEALS"
            ]
            
        }
        
        /** Sections of teamDetails view. */
        func keySets(_ minimalist : Bool) -> [[String]] {
            return [
                defaultKeys,
                highLevel,
                statusKeys,
                autoKeys,
                teleKeys,
                endGame,
                superKeys,
                pitKeys,
                sealKeys
            ]
            
        }
        
        /** Segues to schedules, things unrelated to data */
        let defaultKeys = [
            "TeamInMatchDatas",
            "matchDatas"
        ]
        
        let highLevel : [String] = [ //needed
            "calculatedData.firstPickAbility",
             "calculatedData.secondPickAbility",
             "picklistPosition",
             "calculatedData.canPlaceHighLayerCube",
        ]
        
        /** Keys relating to autonomous to be displayed on teamDetails. */
        let autoKeys = [
        //Some stuff is not needed
            "calculatedData.avgCubesPlacedInScaleAuto",
            "calculatedData.avgAllianceSwitchCubesAuto",
            "calculatedData.canScoreBothSwitchSidesAuto",
            "calculatedData.switchFailPercentageAuto",
            "calculatedData.scaleFailPercentageAuto",
            "calculatedData.avgTimeToOwnAllianceSwitchAuto",
            "calculatedData.avgTimeToOwnScaleAuto",
            "calculatedData.allianceSwitchSuccessPercentageAuto",
            "calculatedData.autoRunPercentage",
        ]
        
        /** Keys relating to Teleoperated to be displayed on teamDetails */
        let teleKeys = [
            "calculatedData.avgNumCubesFumbledTele",
            "calculatedData.avgCubesPlacedInScaleTele",
            "calculatedData.avgOpponentSwitchCubesTele",
            "calculatedData.avgAllianceSwitchCubesTele",
            "calculatedData.avgNumExchangeInputTele",
            "calculatedData.avgNumGroundIntakeTele",
            "calculatedData.avgNumHumanPortalIntakeTele",
            "calculatedData.avgNumGroundPortalIntakeTele",
            "calculatedData.switchFailPercentageTele",
            "calculatedData.scaleFailPercentageTele",
            "calculatedData.avgNumAlliancePlatformIntakeTele",
            "calculatedData.avgNumOpponentPlatformIntakeTele",
            "calculatedData.avgCubesSpilledTele",
            "calculatedData.avgTotalCubesPlaced",
            "calculatedData.avgScaleCubesBy100s",
            "calculatedData.avgScaleCubesBy110s",
        ]
        
        /** Dict translating a key for a teamDetails datapoint to the key for the respective TIMD datapoint. Does not include "calculatedData." in the keys. */
        let teamDetailsToTIMD = [
            //status
            "incapacitatedPercentage" : "didGetIncapacitated",
            "disabledPercentage" : "didGetDisabled",
            "dysfunctionalPercentage" : "calculatedData.isDysfunctional",
            //scoring stuff
            "avgTimeToOwnAllianceSwitchAuto" : "timeToOwnAllianceSwitchAuto",
            "avgTimeToOwnScaleAuto" : "timeToOwnScaleAuto",
            "avgCubesPlacedInScaleAuto" : "calculatedData.numScaleSuccessAuto",
            "avgAllianceSwitchCubesAuto" : "calculatedData.numAllianceSwitchSuccessAuto",
            "avgCubesPlacedInScaleTele" : "calculatedData.numScaleSuccessTele",
            "avgAllianceSwitchCubesTele" : "calculatedData.numAllianceSwitchSuccessTele",
            "avgNumCubesFumbledTele" : "numCubesFumbledTele",
            "avgOpponentSwitchCubesTele" : "calculatedData.numOpponentSwitchSuccessTele",
            "avgNumExchangeInputTele" : "numExchangeInput",
            "avgNumGroundIntakeTele" : "numGroundIntakeTele",
            "avgNumHumanPortalIntakeTele" : "numHumanPortalIntakeTele",
            "avgNumGroundPortalIntakeTele" : "numGroundPortalIntakeTele",
            "avgClimbTime" : "calculatedData.climbTime",
            "climbPercentage" : "calculatedData.didClimb",
            "avgNumRobotsLifted" : "calculatedData.numRobotsLifted",
            "autoRunPercentage" : "didMakeAutoRun",
            "avgNumAlliancePlatformIntakeTele" : "calculatedData.numAlliancePlatformIntakeTele",
            "avgNumOpponentPlatformIntakeTele" : "calculatedData.numOpponentPlatformIntakeTele",
            "avgNumCubesSpilledTele" : "numSpilledCubesTele",
            "avgScaleCubesBy100s" : "calculatedData.numCubesScaleAt100s",
            "avgScaleCubesBy110s" : "calculatedData.numCubesScaleAt110s",
            //super data
            "avgSpeed" : "rankSpeed",
            "avgAgility" : "rankAgility",
            "avgTorque" : "rankTorque",
            "avgDrivingAbility" : "calculatedData.drivingAbility",
            "avgDefense" : "rankDefense",
            //RScore super data
            "RScoreDrivingAbility" : "calculatedData.drivingAbility",
            "RScoreAgility" : "rankAgility",
            "RScoreDefense" : "rankDefense",
            "RScoreSpeed" : "rankSpeed",
            "RScoreTorque" : "rankTorque",
            "totalNumGoodDecisions" : "numGoodDecisions",
            "totalNumBadDecisions" : "numBadDecisions",

            //Misc
            "actualNumRPs" : "calculatedData.numRPs",
            "numAutoPoints" : "calculatedData.numAutoPoints",
            
            ]
        
        /** Keys relating to the portions of the game that occur in the end (climbing, challenging, etc) */
        let endGame = [
            "calculatedData.climbPercentage",
            "calculatedData.avgClimbTime",
            "calculatedData.avgNumRobotsLifted",
        ]
        
        /** Keys relating to the status of a robot to be displayed on teamDetails */
        let statusKeys = [
            "calculatedData.dysfunctionalPercentage",
            "calculatedData.disabledPercentage",
            "calculatedData.incapacitatedPercentage",
        ]
        
        /** Keys relating to the data the pit scout collects to be displayed on teamDetails */
        let pitKeys = [
            "pitDriveTrain",
            "pitClimberType",
            "pitAvailableWeight",
            "pitRobotWidth",
            "pitRobotLength",
            "pitProgrammingLanguage",
            "pitWheelDiameter",
            "pitHasCamera",
        ]
        
        /** Data collected by SEALS */
        let sealKeys = [
            "calculatedData.pitAvgDriveTime",
            "calculatedData.pitAvgRampTime",
            "pitSEALsNotes",
        ]
        
        /** Human readable names for CTIMD keys */
        let calculatedTeamInMatchDataHumanReadableKeys = [
            "First Pick Ability",
            "R Score Torque",
            "R Score Evasion",
            "R Score Speed",
            "Number of RPs",
            "Number of Auto Points",
            "R Score Defense",
            "R Score Driving Ability",
            "Citrus DPR",
            "Second Pick Ability",
            "Overall Second Pick Ability",
            "Score Contribution"
        ]
    }
    
    
    static let superKeys = [
        //superNotes- They're in TIMDs, so see TeamDetails for more info
        "superNotes",
        "calculatedData.avgDrivingAbility",
        "calculatedData.avgSpeed",
        "calculatedData.avgAgility",
        "calculatedData.avgDefense",
        "calculatedData.totalNumGoodDecisions",
        "calculatedData.totalNumBadDecisions"
    ]
    static let statusKeys = ["uploadedData.incapacitated", "uploadedData.disabled"]
    static let miscKeys = ["uploadedData.miscellaneousNotes"]
    
    /** Keys that should be booleans in graphs */
    static let boolGraphs = [
        "calculatedData.climbPercentage",
        "calculatedData.dysfunctionalPercentage",
        "calculatedData.incapacitatedPercentage",
        "calculatedData.disabledPercentage",
        "calculatedData.autoRunPercentage"
    ]
    
    // MARK: TIMD keys
    /** Keys relating to the Autonomous period to be displayed in the TIMD view */
    static let TIMDAutoKeys : [String] = [
        "didMakeAutoRun",
        "numCubesFumbledAuto",
        "calculatedData.numAllianceSwitchCubeSuccessAuto",
        "calculatedData.numScaleSuccessAuto",
        "didCrossAutoLine",
        "startedWithCube",
    ]
    
    /** Keys relating to the Teleoperated period to be displayed in the TIMD view */
    static let TIMDTeleKeys : [String] = [
        "calculatedData.numAllianceSwitchSuccessTele",
        "calculatedData.numScaleSuccessTele",
        "calculatedData.numOpponentSwitchSuccessTele",
        "numExchangeInput",
        "numGroundIntakeTele",
        "numHumanPortalIntakeTele",
        "climb",
        "didPark"
    ]
    
    /** Keys relating to the status of a robot to be displayed in the TIMD view */
    static let TIMDStatusKeys = [
        "didGetDisabled",
        "didGetIncapacitated"
    ]
    
    /** Keys relating to the data Super Scouts collect to be displayed in the TIMD view */
    static let TIMDSuperKeys = [
        "rankSpeed",
        "rankAgility",
        "rankDefense",
        "superNotes",
        "numGoodDecisions",
        "numBadDecisions"
    ]
    
    /** All sections of the TIMD view */
    static let TIMDKeys = [
        TIMDAutoKeys,
        TIMDTeleKeys,
        TIMDStatusKeys,
        TIMDSuperKeys
    ]
    
    /** A dictionary turning TIMD keys into teamDetails keys */
    static let graphTitleSwitch = [
        
        "didBecomeIncapacitated" : "incapacitatedPercentage",
        "didStartDisabled" : "disabledPercentage",
        "calculatedData.RScoreSpeed" : "calculatedData.avgSpeed",
        "calculatedData.RScoreEvasion" : "calculatedData.avgEvasion",
        "calculatedData.RScoreTorque" : "calculatedData.avgTorque",
        "calculatedData.totalNumGoodDecisions" : "numGoodDecisions",
        "calculatedData.totalNumBadDecisions" : "numBadDecisions",
        "calculatedData.avgScaleCubesBy100s" : "calculatedData.numCubesScaleAt100s",
        "calculatedData.avgScaleCubesBy110s" : "calculatedData.numCubesScaleAt110s",
    ]
    
    /** Team Details keys? */
    static let teamCalcKeys = [
        "actualSeed",
        "avgDefense",
        "avgEvasion",
        "avgGroundIntakes",
        "avgSpeed",
        "avgTorque",
        "disabledPercentage",
        "dysfunctionalPercentage",
        "firstPickAbility",
        "incapacitatedPercentage",
        "actualNumRPs",
        "predictedNumRPs",
        "predictedSeed",
        "scalePercentage",
        "sdGroundIntakes",
        "sdHighShotsAuto",
        "sdHighShotsTele",
        "sdLowShotsAuto",
        "sdLowShotsTele",
        "secondPickAbility",
        "secondPickAbility",
    ]
    
    /** Calculated TIMD keys */
    static let calculatedTeamInMatchDataKeys = [
        "calculatedData.firstPickAbility",
        "calculatedData.numRPs",
        "calculatedData.secondPickAbility",
        "calculatedData.secondPickAbility",
        "calculatedData.scoreContribution",
    ]
    
    /** A dictionary with datapoints as keys and Human Readable versions as values */
    static let humanReadableNames = [
        "superNotes": "Super Scout Notes",
        "pitSEALsNotes" : "SEALs Notes",
        "calculatedData.actualSeed" : "Seed",
        "calculatedData.avgEvasion" : "Avg. Evasion",
        "calculatedData.avgTorque" : "Avg. Torque",
        "calculatedData.disabledPercentage" : "Disabled %",
        "calculatedData.dysfunctionalPercentage" : "Dysfunctional %",
        "calculatedData.driverAbility" : "Driver Ability",
        "calculatedData.firstPickAbility" : "First Pick Ability",
        "calculatedData.incapacitatedPercentage" : "Incapacitated %",
        "calculatedData.numRPs" : "Number of RPs",
        "calculatedData.actualNumRPs": "# of RPs",
        "calculatedData.predictedNumRPs" : "Predicted # of RPs",
        "calculatedData.predictedSeed" : "Predicted Seed",
        "calculatedData.scalePercentage" : "Scale %",
        "calculatedData.secondPickAbility" : "Second Pick Ability",
        "matchDatas" : "Matches",
        "TeamInMatchDatas" : "TIMDs",
        "pitLowBarCapability": "Low Bar Ability",
        "calculatedData.autoAbility" : "Auto Ability",
        "calculatedData.citrusDPR" : "Citrus DPR",
        "calculatedData.RScoreDrivingAbility": "R Score Driving Ability",
        "calculatedData.drivingAbility": "Driving Ability",
        "pitPotentialLowBarCapability" : "Low Bar Potential",
        "pitHeightOfBallLeavingShooter": "Shot Release Height",
        "pitDriveBaseWidth" : "Drive Base Width",
        "pitDriveBaseLength" : "Drive Base Length",
        "pitBumperHeight" : "Bumper Height",
        "pitPotentialShotBlockerCapability" : "Shot Blocking Potential",
        "pitNotes" : "Pit Notes",
        "pitCheesecakeAbility" : "Cheesecake Ease",
        "pitProgrammingLanguage": "Prog. Lang.",
        "pitAvailableWeight" : "Avail. Weight",
        "pitOrganization" : "Pit Organization",
        "pitDidUseStandardTankDrive" : "Has Normal Tank Drivetrain",
        "pitCanCheesecake": "Cheesecakable",
        "rankDefense" : "Defense Rank",
        "rankAgility" : "Agility Rank",
        "rankSpeed" : "Speed Rank",
        "rankTorque" : "Torque Rank",
        "didBecomeIncapacitated" : "Was Incap.",
        "didStartDisabled" : "Was Disabled",
        "calculatedData.RScoreSpeed" : "R Score Speed",
        "calculatedData.RScoreEvasion" : "R Score Evasion",
        "calculatedData.RScoreTorque" : "R Score Torque",
        "calculatedData.RScoreAgility": "R Score Agility",
        "calculatedData.RScoreDefense": "R Score Defense",
        "calculatedData.RScoreGearControl": "R Score Gear Control",
        "calculatedData.avgAgility": "Avg. Agility",
        "calculatedData.avgDefense": "Avg. Defense",
        "calculatedData.avgSpeed": "Avg. Speed",
        "calculatedData.avgDrivingAbility": "Avg. Driving Ability",
        "pitNumberOfWheels": "Number of Wheels",
        "didPotentiallyConflictingAuto" : "Did a Potentially Conflicting Auto",
        "pitDriveTrain" : "Drive Train",
        "calculatedData.avgNumGroundPyramidIntakeAuto" : "Auto Avg. Ground PY Intakes",
        "calculatedData.avgNumGroundPortalIntakeAuto" : "Auto Avg. Ground PO Intakes",
        "calculatedData.avgNumElevatedPyramidIntakeAuto" : "Auto Avg. Elevated PY Intakes",
        "calculatedData.avgNumCubesFumbledAuto" : "Auto Avg. Cubes Fumbled",
        "calculatedData.avgNumAlliancePlatformIntakeAuto" : "Auto Avg. PZ Intakes",
        "calculatedData.avgNumCubesSpilledAuto" : "Auto Avg. Cubes Spilled",
        "calculatedData.avgCubesPlacedInScaleAuto" : "Auto Avg. Cubes in SC",
        "calculatedData.avgAllianceSwitchCubesAuto" : "Auto Avg. Cubes in SW",
        "calculatedData.avgNumGroundPyramidIntakeTele" : "Tele Avg. Ground PY Intakes",
        "calculatedData.avgNumGroundPortalIntakeTele" : "Tele Avg. Ground PO Intakes",
        "calculatedData.avgNumElevatedPyramidIntakeTele" : "Tele Avg. Elevated PY Intakes",
        "calculatedData.avgNumCubesFumbledTele" : "Tele Avg. Cubes Fumbled",
        "calculatedData.avgNumAlliancePlatformIntakeTele" : "Tele Avg. PZ Intakes",
        "calculatedData.avgNumCubesSpilledTele" : "Tele Avg. Cubes Spilled",
        "calculatedData.avgCubesPlacedInScaleTele" : "Tele Avg. Cubes in SC",
        "calculatedData.avgAllianceSwitchCubesTele" : "Tele Avg. Cubes in SW",
        "calculatedData.avgNumExchangeInputTele" : "Tele Avg. EX Input",
        "calculatedData.autoRunPercentage" : "Auto Run %",
        "calculatedData.totalNumGoodDecisions" : "Total # of Good Decisions",
        "calculatedData.totalNumBadDecisions" : "Total # of Bad Decisions",
        "calculatedData.avgClimbTime" : "Avg. Climb Time",
        "calculatedData.avgOpponentSwitchCubesTele" : "Tele Avg. Cubes in SWO",
        "calculatedData.avgNumGroundIntakeTele" : "Tele Avg. Ground Intakes",
        "calculatedData.avgNumPortalIntakeTele" : "Tele Avg. PO Intakes",
        "calculatedData.switchFailPercentageTele" : "Tele SW Fail %",
        "calculatedData.scaleFailPercentageTele" : "Tele SC Fail %",
        "calculatedData.canScoreBothSwitchSidesAuto" : "Auto Multi-Side",
        "didMakeAutoRun" : "Did Make Auto Run",
        "calculatedData.switchFailPercentageAuto" : "Auto SW Fail %",
        "calculatedData.scaleFailPercentageAuto" : "Auto SC Fail %",
        "calculatedData.avgNumHumanPortalIntakeTele" : "Tele Avg. Human PO Intakes",
        "calculatedData.climbPercentage" : "Climb %",
        "pitClimberType" : "Climber Type",
        "calculatedData.avgCubesSpilledTele" : "Tele Avg. Cubes Spilled",
        "didPark" : "Parked",
        "climb" : "Climb",
        "numHumanPortalIntakeTele" : "Tele Human Portal Intakes",
        "numGoodDecisions" : "Good Decisions",
        "numBadDecisions" : "Bad Decisions",
        "numGroundIntakeTele" : "Tele Ground Intakes",
        "numExchangeInput" : "EX Inputs",
        "numCubesFumbledAuto" : "Auto Cubes Fumbled",
        "didCrossAutoZone" : "Crossed Auto Zone",
        "calculatedData.numAllianceSwitchCubeSuccessAuto" : "Auto Successful SW Cubes",
        "calculatedData.numScaleSuccessAuto" : "Auto Successful SC Cubes",
        "calculatedData.numAllianceSwitchSuccessTele" : "Tele Successful SW Cubes",
        "calculatedData.numScaleSuccessTele" : "Tele Successful SC Cubes",
        "calculatedData.numOpponentSwitchSuccessTele" : "Tele Successful SWO Cubes",
        "calculatedData.didClimb" : "Climbed",
        "pitRobotWidth" : "Robot Width",
        "pitRobotLength" : "Robot Length",
        "picklistPosition" : "Picklist Position",
        "pitDriveTest" : "Pit Drive Test",
        "calculatedData.avgTimeToOwnAllianceSwitchAuto" : "Auto Avg. Time to Own SW",
        "calculatedData.avgTimeToOwnScaleAuto" : "Auto Avg. Time to Own SC",
        "timeToOwnAllianceSwitchAuto" : "Auto Time to Own SW",
        "timeToOwnScaleAuto" : "Auto Time to Own SC",
        "calculatedData.avgNumRobotsLifted" : "Avg. Num Robots Lifted",
        "numRobotsLifted" : "Num. Robots Lifted",
        "calculatedData.avgNumOpponentPlatformIntakeTele" : "Tele Avg. PZO Intakes",
        "calculatedData.allianceSwitchSuccessPercentageAuto" : "Auto SW Success %",
        "calculatedData.canPlaceHighLayerCube" : "Can Place High Layer Cube",
        "calculatedData.pitAvgDriveTime" : "Avg. Drive Time",
        "calculatedData.pitAvgRampTime" : "Avg. Ramp Time",
        "pitHasCamera" : "Has Camera",
        "pitWheelDiameter" : "Wheel Diameter",
        "calculatedData.avgTotalCubesPlaced" : "Avg. Cubes Placed",
        "calculatedData.avgAllVaultTime" : "Time to fill Vault",
        "calculatedData.avgScaleCubesBy100s" : "Avg. Scale Cubes by 100",
        "calculatedData.avgScaleCubesBy110s" : "Avg. Scale Cubes by 110",
        "calculatedData.numCubesScaleAt100s" : "Scale Cubes by 100",
        "calculatedData.numCubesScaleAt110s" : "Scale Cubes by 110",
        "name" : "Name",
        "number" : "Number",
        "calculatedData" : "Calculated Data",
        "pitSelectedImage" : "Selected Image",
        "pitAllImageURLs" : "All Image URLs",
        "pitImageKeys" : "Image Keys",
        "pitCanDoPIDOnDriveTrain" : "PID On Drive Train",
        "pitHasGyro" : "Has Gyro",
        "pitHasEncodersOnBothSides" : "Encoders On Both Sides",
        "calculatedData.numMatchesPlayed" : "Matches Played",
        "calculatedData.avgNumCubesPlacedAuto" : "Auto Cubes Placed",
        "calculatedData.avgNumCubesPlacedTele" : "Tele Cubes Placed",
        "calculatedData.avgNumReturnIntakeTele" : "Tele Return Intakes",
        "calculatedData.avgNumGoodDecisions" : "Avg. Good Decisions",
        "calculatedData.avgNumBadDecisions" : "Avg. Bad Decisions",
        "calculatedData.avgCubesSpilledAuto" : "Auto Cubes Spilled",
        "calculatedData.avgScaleTimeAuto" : "Auto Avg. Scale Time",
        "calculatedData.avgScaleTimeTele" : "Tele Avg. Scale Time",
        "calculatedData.avgAllianceSwitchTimeAuto" : "Auto Avg. SW Time",
        "calculatedData.avgAllianceSwitchTimeTele" : "Tele Avg. SW Time",
        "calculatedData.avgOpponentSwitchTimeTele" : "Tele Avg. SWO Time",
        
        "calculatedData.totalNumParks" : "Num. Parks",
        "calculatedData.totalNumRobotsLifted" : "Num. Robots Lifted",
        "calculatedData.totalNumRobotLiftAttempts" : "Lift Attempts",
        "calculatedData.totalNumRobotsGroundLifted" : "Ground Lifts",
        "calculatedData.totalNumRobotGroundLiftAttempts" : "Ground Lift Attempts",
        "calculatedData.totalNumHighLayerScaleCubes" : "High Layer SC Cubes",
        "calculatedData.totalSuperNotes" : "Super Notes",
        "calculatedData.numSuccessfulClimbs" : "Num. Successful Climbs",
        "calculatedData.predictedClimb" : "Predicted Climb",
        "calculatedData.soloClimbPercentage" : "Solo Climb %",
        "calculatedData.activeAssistClimbPercentage" : "Assisted Climb %",
        "calculatedData.activeLiftClimbPercentage" : "Active Climb %",
        "calculatedData.activeNoClimbLiftClimbPercentage" : "Ground Lift %",
        "calculatedData.assistedClimbPercentage" : "Assisted Climb %",
        "calculatedData.parkPercentage" : "Park %",
        "calculatedData.predictedNumAllianceSwitchCubesAuto" : "Auto Predicted SW Cubes",
        "calculatedData.predictedNumScaleCubesAuto" : "Auto Predicted SC Cubes",
        "calculatedData.predictedPark" : "Predicted Park",
        "calculatedData.predictedTotalNumRPs" : "Predicted RPs",
        "calculatedData.totalNumRPs" : "Total RPs",
        "calculatedData.allianceSwitchSuccessPercentageTele" : "Tele SW Success %",
        "calculatedData.opponentSwitchSuccessPercentageTele" : "Tele SWO Success %",
        "calculatedData.scaleSuccessPercentageAuto" : "Auto SC  Success %",
        "calculatedData.scaleSuccessPercentageTele" : "Tele SC Success %",
        "calculatedData.allianceSwitchFailPercentageAuto" : "Auto SW Fail %",
        "calculatedData.allianceSwitchFailPercentageTele" : "Tele SW Fail %",
        "calculatedData.opponentSwitchFailPercentageTele" : "Tele SWO Fail %",
        "calculatedData.didThreeExchangeInputPercentage" : "3 EX Input %",
        "calculatedData.percentSuccessOppositeSwitchSideAuto" : "Opposite Side SW Auto %",
        "calculatedData.canGroundIntake" : "Can Ground Intake",
        "calculatedData.teleopExchangeAbility" : "Tele EX Ability",
        "calculatedData.teleopScaleAbility" : "Tele SC Ability",
        "calculatedData.teleopAllianceSwitchAbility" : "Tele SW Ability",
        "calculatedData.teleopOpponentSwitchAbility" : "Tele SWO Ability",
        "calculatedData.maxScaleCubes" : "Max SC Cubes",
        "calculatedData.maxExchangeCubes" : "Max EX Cubes",
        "calculatedData.avgSwitchOwnership" : "Avg. Switch Ownership",
        "calculatedData.avgAllianceSwitchCycleTimeAuto" : "Avg. SW Cycle Time Auto",
        "calculatedData.avgAllianceSwitchCycleTimeTele" : "Avg. SW Cycle Time Tele",
        "calculatedData.avgOpponentSwitchCycleTimeTele" : "Avg. SWO Cycle Time Tele",
        "calculatedData.avgScaleCycleTimeAuto" : "Avg. SC Cycle Time Auto",
        "calculatedData.avgScaleCycleTimeTele" : "Avg. SC Cycle Time Tele",
        "calculatedData.avgExchangeCycleTime" : "Avg. Exchange Cycle Time",
        "didCrossAutoLine" : "Crossed Auto Line",
        "startedWithCube" : "Started With Cube",
    ]
    
    /**
     Rounds a given float value to a given number of decimal places.
     - parameter value: Input value
     - parameter numDecimalPlaces: Number of decimal places
     */
    @objc class func roundValue(_ value: Float, toDecimalPlaces numDecimalPlaces: Int) -> String {
        let val = value as NSNumber
        let f = NumberFormatter()
        f.numberStyle = NumberFormatter.Style.decimal
        f.maximumFractionDigits = numDecimalPlaces
        
        if val == 0 {
            return "0"
        }
        
        return f.string(from: val)!
    }
    
    /**
     Rounds a given double value to a given number of decimal places.
     - parameter value: Input value
     - parameter toDecimalPlaces: Number of decimal places to round to
     */
    class func roundDoubleValue(_ value: Double, toDecimalPlaces numDecimalPlaces: Int) -> String {
        let val = value as NSNumber
        let f = NumberFormatter()
        f.numberStyle = NumberFormatter.Style.decimal
        f.maximumFractionDigits = numDecimalPlaces
        
        if val == 0 {
            return "0"
        }
        
        return f.string(from: val)!
    }
    
    /** Returns a human readable name for a given key. */
    class func getHumanReadableNameForKey(_ key: String) -> String? {
        return humanReadableNames[key]
    }
    
    /** Returns the key for a human readable name */
    class func findKeyForValue(_ value: String) ->String?
    {
        for (key, stringValue) in humanReadableNames
        {
            if (stringValue == value)
            {
                return key
            }
        }
        
        return nil
    }
    
    /**
     Returns a key for a given Human Readable Name.
     - parameter name: Human Readable Name
     */
    class func getKeyForHumanReadableName(_ name: String) -> String? {
        var computerReadableNames = [String: String]()
        for (key, value) in humanReadableNames {
            computerReadableNames[value] = key
        }
        return computerReadableNames[name]
    }
    
    /** Detects if a given value is null. */
    class func isNull(_ object: AnyObject?) -> Bool {
        if object_getClass(object) == object_getClass(NSNull()) {
            return true
        }
        return false
    }
    
    /** Converts a value to one that is presentable as a string on the screen. It won't have Optional() or anything like that in it. */
    class func sp(thing : Any?) -> String {
        if thing != nil {
            if let s = thing as? String {
                return s
            } else if ((thing as? Int) != nil) || ((thing as? Float) != nil) || ((thing as? Double) != nil) {
                return "\(thing!)"
            } else if let n = thing as? NSNumber {
                return n.stringValue
            } else {
                print("Presentable String Unknown Type")
                return "\(thing)"
            }
        } else {
            return ""
        }
    }
    
    /**Conversion of bool value to string "Yes" or "No".*/
    class func boolToString(b: Bool?) -> String? {
        let stringBool : String? = b?.description ?? nil
        let boolToStringValues = [
            "true" : "Yes",
            "false" : "No"
        ]
        if stringBool != nil {
            let stringReadable = boolToStringValues[stringBool!]
            return (stringReadable)
        }
        return(nil)
    }
    
    /**
     Unwraps a value.
     */
    class func unwrap(any:Any) -> Any {
        
        let mi = Mirror(reflecting: any)
        if mi.displayStyle != .optional {
            return any
        }
        
        if mi.children.count == 0 { return NSNull() }
        let (_, some) = mi.children.first!
        return some
        
    }
    
    /** Gets the human readable name from a key... use humanReadableNames instead */
    class func humanReadableNameFromKey(key: String) -> String {
        let noCalculatedDataKey = key.replacingOccurrences(of: "calculatedData.", with: "").replacingOccurrences(of: "pit", with: "pitScout")
        var indiciesToAddSpaces = [Int]()
        for i in 0..<noCalculatedDataKey.characters.count {
            if i != 0 {
                let currentChar = Array(noCalculatedDataKey.characters)[i]
                let previousChar = Array(noCalculatedDataKey.characters)[i-1]
                if !self.isLowercase(string: String(currentChar)) && self.isLowercase(string: String(previousChar)) {
                    indiciesToAddSpaces.append(i)
                }
            }
        }
        var finalName = noCalculatedDataKey
        indiciesToAddSpaces.sort()
        for i in 0..<indiciesToAddSpaces.count {
            let ind = indiciesToAddSpaces[i] + i //Adding i to ajust for the fact that we are adding characters as we go here
            finalName = finalName.insert(string: " ", ind: ind)
        }
        finalName = String(Array(finalName.characters)[0]).uppercased() + String(finalName.characters.dropFirst())
        return finalName
    }
    
    static func isLowercase(string: String) -> Bool {
        let set = CharacterSet.lowercaseLetters
        
        if let scala = UnicodeScalar(string) {
            return set.contains(scala)
        } else {
            return false
        }
    }
}

extension String {
    func insert(string:String,ind:Int) -> String {
        return  String(self.characters.prefix(ind)) + string + String(self.characters.suffix(self.characters.count-ind))
    }
}

