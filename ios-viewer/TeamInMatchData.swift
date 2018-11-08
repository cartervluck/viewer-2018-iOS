//
//  TeamInMatchData.swift
//
//  Created by Carter Luck on 1/14/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class TeamInMatchData: NSObject {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let rankDefense = "rankDefense"
    static let numGroundIntakeTele = "numGroundIntakeTele"
    static let numCubesFumbledTele = "numCubesFumbledTele"
    static let climb = "climb"
    static let numBadDecisions = "numBadDecisions"
    static let matchNumber = "matchNumber"
    static let numElevatedPyramidIntakeAuto = "numElevatedPyramidIntakeAuto"
    static let opponentPlatformIntakeTele = "opponentPlatformIntakeTele"
    static let didPark = "didPark"
    static let startingPosition = "startingPosition"
    static let numGroundPortalIntakeTele = "numGroundPortalIntakeTele"
    static let scaleAttemptAuto = "scaleAttemptAuto"
    static let numReturnIntake = "numReturnIntake"
    static let alliancePlatformIntakeAuto = "alliancePlatformIntakeAuto"
    static let didGetDisabled = "didGetDisabled"
    static let numHumanPortalIntakeTele = "numHumanPortalIntakeTele"
    static let numGroundPyramidIntakeAuto = "numGroundPyramidIntakeAuto"
    static let scoutName = "scoutName"
    static let allianceSwitchAttemptAuto = "allianceSwitchAttemptAuto"
    static let numSpilledCubesTele = "numSpilledCubesTele"
    static let numCubesFumbledAuto = "numCubesFumbledAuto"
    static let opponentSwitchAttemptTele = "opponentSwitchAttemptTele"
    static let scaleAttemptTele = "scaleAttemptTele"
    static let allianceSwitchAttemptTele = "allianceSwitchAttemptTele"
    static let calculatedData = "calculatedData"
    static let superNotes = "superNotes"
    static let didGetIncapacitated = "didGetIncapacitated"
    static let numGroundPyramidIntakeTele = "numGroundPyramidIntakeTele"
    static let numElevatedPyramidIntakeTele = "numElevatedPyramidIntakeTele"
    static let numSpilledCubesAuto = "numSpilledCubesAuto"
    static let alliancePlatformIntakeTele = "alliancePlatformIntakeTele"
    static let rankSpeed = "rankSpeed"
    static let didMakeAutoRun = "didMakeAutoRun"
    static let rankAgility = "rankAgility"
    static let teamNumber = "teamNumber"
    static let numExchangeInput = "numExchangeInput"
    static let numGoodDecisions = "numGoodDecisions"
    static let didCrossAutoLine = "didCrossAutoLine"
    static let startedWithCube = "startedWithCube"
  }

  // MARK: Properties
  public var rankDefense: Int?
  public var numGroundIntakeTele: Int?
  public var numCubesFumbledTele: Int?
  public var climb: [Climb]?
  public var numBadDecisions: Int?
  public var matchNumber: Int?
  public var numElevatedPyramidIntakeAuto: Int?
  public var opponentPlatformIntakeTele: [Bool]?
  public var didPark: Bool? = false
  public var startingPosition: String?
  public var numGroundPortalIntakeTele: Int?
  public var scaleAttemptAuto: [Attempt]?
  public var numReturnIntake: Int?
  public var alliancePlatformIntakeAuto: [Bool]?
  public var didGetDisabled: Bool? = false
  public var numHumanPortalIntakeTele: Int?
  public var numGroundPyramidIntakeAuto: Int?
  public var scoutName: String?
  public var allianceSwitchAttemptAuto: [Attempt]?
  public var numSpilledCubesTele: Int?
  public var numCubesFumbledAuto: Int?
  public var opponentSwitchAttemptTele: [Attempt]?
  public var scaleAttemptTele: [Attempt]?
  public var allianceSwitchAttemptTele: [Attempt]?
  @objc public var calculatedData: CalculatedTeamInMatchData?
  @objc public var superNotes: String?
  public var didGetIncapacitated: Bool? = false
  public var numGroundPyramidIntakeTele: Int?
  public var numElevatedPyramidIntakeTele: Int?
  public var numSpilledCubesAuto: Int?
  public var alliancePlatformIntakeTele: [Bool]?
  public var rankSpeed: Int?
  public var didMakeAutoRun: Bool? = false
  public var rankAgility: Int?
  public var teamNumber: Int?
  public var numExchangeInput: Int?
  public var numGoodDecisions: Int?
    public var didCrossAutoLine: Bool?
    public var startedWithCube: Bool?

  // MARK: SwiftyJSON Initializers
  /// Initiates the instance based on the object.
  ///
  /// - parameter object: The object of either Dictionary or Array kind that was passed.
  /// - returns: An initialized instance of the class.
  public convenience init(object: Any) {
    self.init(json: JSON(object))
  }

  /// Initiates the instance based on the JSON that was passed.
  ///
  /// - parameter json: JSON object from SwiftyJSON.
  public required init(json: JSON) {
    rankDefense = json[SerializationKeys.rankDefense].int
    numGroundIntakeTele = json[SerializationKeys.numGroundIntakeTele].int
    numCubesFumbledTele = json[SerializationKeys.numCubesFumbledTele].int
    if let items = json[SerializationKeys.climb].array { climb = items.map { Climb(json: $0) } }
    numBadDecisions = json[SerializationKeys.numBadDecisions].int
    matchNumber = json[SerializationKeys.matchNumber].int
    numElevatedPyramidIntakeAuto = json[SerializationKeys.numElevatedPyramidIntakeAuto].int
    if let items = json[SerializationKeys.opponentPlatformIntakeTele].array { opponentPlatformIntakeTele = items.map { $0.boolValue } }
    didPark = json[SerializationKeys.didPark].boolValue
    startingPosition = json[SerializationKeys.startingPosition].string
    numGroundPortalIntakeTele = json[SerializationKeys.numGroundPortalIntakeTele].int
    if let items = json[SerializationKeys.scaleAttemptAuto].array { scaleAttemptAuto = items.map { Attempt(json: $0) } }
    numReturnIntake = json[SerializationKeys.numReturnIntake].int
    if let items = json[SerializationKeys.alliancePlatformIntakeAuto].array { alliancePlatformIntakeAuto = items.map { $0.boolValue } }
    didGetDisabled = json[SerializationKeys.didGetDisabled].boolValue
    numHumanPortalIntakeTele = json[SerializationKeys.numHumanPortalIntakeTele].int
    numGroundPyramidIntakeAuto = json[SerializationKeys.numGroundPyramidIntakeAuto].int
    scoutName = json[SerializationKeys.scoutName].string
    if let items = json[SerializationKeys.allianceSwitchAttemptAuto].array { allianceSwitchAttemptAuto = items.map { Attempt(json: $0) } }
    numSpilledCubesTele = json[SerializationKeys.numSpilledCubesTele].int
    numCubesFumbledAuto = json[SerializationKeys.numCubesFumbledAuto].int
    //if let items = json[SerializationKeys.opponentSwitchAttemptAuto].array { opponentSwitchAttemptAuto = items.map { Attempt(json: $0) } }
    if let items = json[SerializationKeys.scaleAttemptTele].array { scaleAttemptTele = items.map { Attempt(json: $0) } }
    if let items = json[SerializationKeys.allianceSwitchAttemptTele].array { allianceSwitchAttemptTele = items.map { Attempt(json: $0) } }
    calculatedData = CalculatedTeamInMatchData(json: json[SerializationKeys.calculatedData])
    superNotes = json[SerializationKeys.superNotes].string
    didGetIncapacitated = json[SerializationKeys.didGetIncapacitated].boolValue
    numGroundPyramidIntakeTele = json[SerializationKeys.numGroundPyramidIntakeTele].int
    numElevatedPyramidIntakeTele = json[SerializationKeys.numElevatedPyramidIntakeTele].int
    numSpilledCubesAuto = json[SerializationKeys.numSpilledCubesAuto].int
    if let items = json[SerializationKeys.alliancePlatformIntakeTele].array { alliancePlatformIntakeTele = items.map { $0.boolValue } }
    rankSpeed = json[SerializationKeys.rankSpeed].int
    didMakeAutoRun = json[SerializationKeys.didMakeAutoRun].boolValue
    rankAgility = json[SerializationKeys.rankAgility].int
    teamNumber = json[SerializationKeys.teamNumber].int
    numExchangeInput = json[SerializationKeys.numExchangeInput].int
    numGoodDecisions = json[SerializationKeys.numGoodDecisions].int
    startedWithCube = json[SerializationKeys.startedWithCube].bool
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = rankDefense { dictionary[SerializationKeys.rankDefense] = value }
    if let value = numGroundIntakeTele { dictionary[SerializationKeys.numGroundIntakeTele] = value }
    if let value = numCubesFumbledTele { dictionary[SerializationKeys.numCubesFumbledTele] = value }
    if let value = climb { dictionary[SerializationKeys.climb] = value.map { $0.dictionaryRepresentation() } }
    if let value = numBadDecisions { dictionary[SerializationKeys.numBadDecisions] = value }
    if let value = matchNumber { dictionary[SerializationKeys.matchNumber] = value }
    if let value = numElevatedPyramidIntakeAuto { dictionary[SerializationKeys.numElevatedPyramidIntakeAuto] = value }
    if let value = opponentPlatformIntakeTele { dictionary[SerializationKeys.opponentPlatformIntakeTele] = value }
    dictionary[SerializationKeys.didPark] = didPark
    if let value = startingPosition { dictionary[SerializationKeys.startingPosition] = value }
    if let value = numGroundPortalIntakeTele { dictionary[SerializationKeys.numGroundPortalIntakeTele] = value }
    if let value = scaleAttemptAuto { dictionary[SerializationKeys.scaleAttemptAuto] = value.map { $0.dictionaryRepresentation() } }
    if let value = numReturnIntake { dictionary[SerializationKeys.numReturnIntake] = value }
    if let value = alliancePlatformIntakeAuto { dictionary[SerializationKeys.alliancePlatformIntakeAuto] = value }
    dictionary[SerializationKeys.didGetDisabled] = didGetDisabled
    if let value = numHumanPortalIntakeTele { dictionary[SerializationKeys.numHumanPortalIntakeTele] = value }
    if let value = numGroundPyramidIntakeAuto { dictionary[SerializationKeys.numGroundPyramidIntakeAuto] = value }
    if let value = scoutName { dictionary[SerializationKeys.scoutName] = value }
    if let value = allianceSwitchAttemptAuto { dictionary[SerializationKeys.allianceSwitchAttemptAuto] = value.map { $0.dictionaryRepresentation() } }
    if let value = numSpilledCubesTele { dictionary[SerializationKeys.numSpilledCubesTele] = value }
    if let value = numCubesFumbledAuto { dictionary[SerializationKeys.numCubesFumbledAuto] = value }
    if let value = opponentSwitchAttemptTele { dictionary[SerializationKeys.opponentSwitchAttemptTele] = value.map { $0.dictionaryRepresentation() } }
    if let value = scaleAttemptTele { dictionary[SerializationKeys.scaleAttemptTele] = value.map { $0.dictionaryRepresentation() } }
    if let value = allianceSwitchAttemptTele { dictionary[SerializationKeys.allianceSwitchAttemptTele] = value.map { $0.dictionaryRepresentation() } }
    if let value = calculatedData { dictionary[SerializationKeys.calculatedData] = value.dictionaryRepresentation() }
    if let value = superNotes { dictionary[SerializationKeys.superNotes] = value }
    dictionary[SerializationKeys.didGetIncapacitated] = didGetIncapacitated
    if let value = numGroundPyramidIntakeTele { dictionary[SerializationKeys.numGroundPyramidIntakeTele] = value }
    if let value = numElevatedPyramidIntakeTele { dictionary[SerializationKeys.numElevatedPyramidIntakeTele] = value }
    if let value = numSpilledCubesAuto { dictionary[SerializationKeys.numSpilledCubesAuto] = value }
    if let value = alliancePlatformIntakeTele { dictionary[SerializationKeys.alliancePlatformIntakeTele] = value }
    if let value = rankSpeed { dictionary[SerializationKeys.rankSpeed] = value }
    dictionary[SerializationKeys.didMakeAutoRun] = didMakeAutoRun
    if let value = rankAgility { dictionary[SerializationKeys.rankAgility] = value }
    if let value = teamNumber { dictionary[SerializationKeys.teamNumber] = value }
    if let value = numExchangeInput { dictionary[SerializationKeys.numExchangeInput] = value }
    if let value = numGoodDecisions { dictionary[SerializationKeys.numGoodDecisions] = value }
    if let value = didCrossAutoLine { dictionary[SerializationKeys.didCrossAutoLine] = value }
    if let value = startedWithCube { dictionary[SerializationKeys.startedWithCube] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.rankDefense = aDecoder.decodeObject(forKey: SerializationKeys.rankDefense) as? Int
    self.numGroundIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.numGroundIntakeTele) as? Int
    self.numCubesFumbledTele = aDecoder.decodeObject(forKey: SerializationKeys.numCubesFumbledTele) as? Int
    self.climb = aDecoder.decodeObject(forKey: SerializationKeys.climb) as? [Climb]
    self.numBadDecisions = aDecoder.decodeObject(forKey: SerializationKeys.numBadDecisions) as? Int
    self.matchNumber = aDecoder.decodeObject(forKey: SerializationKeys.matchNumber) as? Int
    self.numElevatedPyramidIntakeAuto = aDecoder.decodeObject(forKey: SerializationKeys.numElevatedPyramidIntakeAuto) as? Int
    self.opponentPlatformIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.opponentPlatformIntakeTele) as? [Bool]
    self.didPark = aDecoder.decodeBool(forKey: SerializationKeys.didPark)
    self.startingPosition = aDecoder.decodeObject(forKey: SerializationKeys.startingPosition) as? String
    self.numGroundPortalIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.numGroundPortalIntakeTele) as? Int
    self.scaleAttemptAuto = aDecoder.decodeObject(forKey: SerializationKeys.scaleAttemptAuto) as? [Attempt]
    self.numReturnIntake = aDecoder.decodeObject(forKey: SerializationKeys.numReturnIntake) as? Int
    self.alliancePlatformIntakeAuto = aDecoder.decodeObject(forKey: SerializationKeys.alliancePlatformIntakeAuto) as? [Bool]
    self.didGetDisabled = aDecoder.decodeBool(forKey: SerializationKeys.didGetDisabled)
    self.numHumanPortalIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.numHumanPortalIntakeTele) as? Int
    self.numGroundPyramidIntakeAuto = aDecoder.decodeObject(forKey: SerializationKeys.numGroundPyramidIntakeAuto) as? Int
    self.scoutName = aDecoder.decodeObject(forKey: SerializationKeys.scoutName) as? String
    self.allianceSwitchAttemptAuto = aDecoder.decodeObject(forKey: SerializationKeys.allianceSwitchAttemptAuto) as? [Attempt]
    self.numSpilledCubesTele = aDecoder.decodeObject(forKey: SerializationKeys.numSpilledCubesTele) as? Int
    self.numCubesFumbledAuto = aDecoder.decodeObject(forKey: SerializationKeys.numCubesFumbledAuto) as? Int
    self.opponentSwitchAttemptTele = aDecoder.decodeObject(forKey: SerializationKeys.opponentSwitchAttemptTele) as? [Attempt]
    self.scaleAttemptTele = aDecoder.decodeObject(forKey: SerializationKeys.scaleAttemptTele) as? [Attempt]
    self.allianceSwitchAttemptTele = aDecoder.decodeObject(forKey: SerializationKeys.allianceSwitchAttemptTele) as? [Attempt]
    self.calculatedData = aDecoder.decodeObject(forKey: SerializationKeys.calculatedData) as? CalculatedTeamInMatchData
    self.superNotes = aDecoder.decodeObject(forKey: SerializationKeys.superNotes) as? String
    self.didGetIncapacitated = aDecoder.decodeBool(forKey: SerializationKeys.didGetIncapacitated)
    self.numGroundPyramidIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.numGroundPyramidIntakeTele) as? Int
    self.numElevatedPyramidIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.numElevatedPyramidIntakeTele) as? Int
    self.numSpilledCubesAuto = aDecoder.decodeObject(forKey: SerializationKeys.numSpilledCubesAuto) as? Int
    self.alliancePlatformIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.alliancePlatformIntakeTele) as? [Bool]
    self.rankSpeed = aDecoder.decodeObject(forKey: SerializationKeys.rankSpeed) as? Int
    self.didMakeAutoRun = aDecoder.decodeBool(forKey: SerializationKeys.didMakeAutoRun)
    self.rankAgility = aDecoder.decodeObject(forKey: SerializationKeys.rankAgility) as? Int
    self.teamNumber = aDecoder.decodeObject(forKey: SerializationKeys.teamNumber) as? Int
    self.numExchangeInput = aDecoder.decodeObject(forKey: SerializationKeys.numExchangeInput) as? Int
    self.numGoodDecisions = aDecoder.decodeObject(forKey: SerializationKeys.numGoodDecisions) as? Int
    self.didCrossAutoLine = aDecoder.decodeObject(forKey: SerializationKeys.didCrossAutoLine) as? Bool
    self.startedWithCube = aDecoder.decodeObject(forKey: SerializationKeys.startedWithCube) as? Bool
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(rankDefense, forKey: SerializationKeys.rankDefense)
    aCoder.encode(numGroundIntakeTele, forKey: SerializationKeys.numGroundIntakeTele)
    aCoder.encode(numCubesFumbledTele, forKey: SerializationKeys.numCubesFumbledTele)
    aCoder.encode(climb, forKey: SerializationKeys.climb)
    aCoder.encode(numBadDecisions, forKey: SerializationKeys.numBadDecisions)
    aCoder.encode(matchNumber, forKey: SerializationKeys.matchNumber)
    aCoder.encode(numElevatedPyramidIntakeAuto, forKey: SerializationKeys.numElevatedPyramidIntakeAuto)
    aCoder.encode(opponentPlatformIntakeTele, forKey: SerializationKeys.opponentPlatformIntakeTele)
    aCoder.encode(didPark, forKey: SerializationKeys.didPark)
    aCoder.encode(startingPosition, forKey: SerializationKeys.startingPosition)
    aCoder.encode(numGroundPortalIntakeTele, forKey: SerializationKeys.numGroundPortalIntakeTele)
    aCoder.encode(scaleAttemptAuto, forKey: SerializationKeys.scaleAttemptAuto)
    aCoder.encode(numReturnIntake, forKey: SerializationKeys.numReturnIntake)
    aCoder.encode(alliancePlatformIntakeAuto, forKey: SerializationKeys.alliancePlatformIntakeAuto)
    aCoder.encode(didGetDisabled, forKey: SerializationKeys.didGetDisabled)
    aCoder.encode(numHumanPortalIntakeTele, forKey: SerializationKeys.numHumanPortalIntakeTele)
    aCoder.encode(numGroundPyramidIntakeAuto, forKey: SerializationKeys.numGroundPyramidIntakeAuto)
    aCoder.encode(scoutName, forKey: SerializationKeys.scoutName)
    aCoder.encode(allianceSwitchAttemptAuto, forKey: SerializationKeys.allianceSwitchAttemptAuto)
    aCoder.encode(numSpilledCubesTele, forKey: SerializationKeys.numSpilledCubesTele)
    aCoder.encode(numCubesFumbledAuto, forKey: SerializationKeys.numCubesFumbledAuto)
    aCoder.encode(opponentSwitchAttemptTele, forKey: SerializationKeys.opponentSwitchAttemptTele)
    aCoder.encode(scaleAttemptTele, forKey: SerializationKeys.scaleAttemptTele)
    aCoder.encode(allianceSwitchAttemptTele, forKey: SerializationKeys.allianceSwitchAttemptTele)
    aCoder.encode(calculatedData, forKey: SerializationKeys.calculatedData)
    aCoder.encode(superNotes, forKey: SerializationKeys.superNotes)
    aCoder.encode(didGetIncapacitated, forKey: SerializationKeys.didGetIncapacitated)
    aCoder.encode(numGroundPyramidIntakeTele, forKey: SerializationKeys.numGroundPyramidIntakeTele)
    aCoder.encode(numElevatedPyramidIntakeTele, forKey: SerializationKeys.numElevatedPyramidIntakeTele)
    aCoder.encode(numSpilledCubesAuto, forKey: SerializationKeys.numSpilledCubesAuto)
    aCoder.encode(alliancePlatformIntakeTele, forKey: SerializationKeys.alliancePlatformIntakeTele)
    aCoder.encode(rankSpeed, forKey: SerializationKeys.rankSpeed)
    aCoder.encode(didMakeAutoRun, forKey: SerializationKeys.didMakeAutoRun)
    aCoder.encode(rankAgility, forKey: SerializationKeys.rankAgility)
    aCoder.encode(teamNumber, forKey: SerializationKeys.teamNumber)
    aCoder.encode(numExchangeInput, forKey: SerializationKeys.numExchangeInput)
    aCoder.encode(numGoodDecisions, forKey: SerializationKeys.numGoodDecisions)
    aCoder.encode(didCrossAutoLine, forKey: SerializationKeys.didCrossAutoLine)
    aCoder.encode(startedWithCube, forKey: SerializationKeys.startedWithCube)
  }

}
