//
//  CalculatedTeamInMatchData.swift
//
//  Created by Carter Luck on 1/14/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CalculatedTeamInMatchData: NSObject {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let numOpponentSwitchSuccessTele = "numOpponentSwitchSuccessTele"
    static let avgScaleTimeAuto = "avgScaleTimeAuto"
    static let numCubesPlacedTele = "numCubesPlacedTele"
    static let numOpponentSwitchFailedTele = "numOpponentSwitchFailedTele"
    static let numAllianceSwitchFailedTele = "numAllianceSwitchFailedTele"
    static let drivingAbility = "drivingAbility"
    static let numAllianceSwitchSuccessAuto = "numAllianceSwitchSuccessAuto"
    static let numRPs = "numRPs"
    static let avgAllianceSwitchTimeAuto = "avgAllianceSwitchTimeAuto"
    static let climbTime = "climbTime"
    static let numClimbAttempts = "numClimbAttempts"
    static let numScaleFailedAuto = "numScaleFailedAuto"
    static let numAllianceSwitchSuccessTele = "numAllianceSwitchSuccessTele"
    static let numScaleSuccessTele = "numScaleSuccessTele"
    static let didConflictWithAuto = "didConflictWithAuto"
    static let numAllianceSwitchFailedAuto = "numAllianceSwitchFailedAuto"
    static let avgAllianceSwitchTimeTele = "avgAllianceSwitchTimeTele"
    static let numScaleFailedTele = "numScaleFailedTele"
    static let isDysfunctional = "isDysfunctional"
    static let numOpponentSwitchSuccessAuto = "numOpponentSwitchSuccessAuto"
    static let numScaleSuccessAuto = "numScaleSuccessAuto"
    static let avgScaleTimeTele = "avgScaleTimeTele"
    static let numCubesPlacedAuto = "numCubesPlacedAuto"
    static let numOpponentSwitchFailedAuto = "numOpponentSwitchFailedAuto"
    static let didClimb = "didClimb"
    static let numRobotsLifted = "numRobotsLifted"
    static let timeToOwnAllianceSwitchAuto = "timeToOwnAllianceSwitchAuto"
    static let timeToOwnScaleAuto = "timeToOwnScaleAuto"
    static let numAlliancePlatformIntakeTele = "numAlliancePlatformIntakeTele"
    static let numOpponentPlatformIntakeTele = "numOpponentPlatformIntakeTele"
    static let switchOwnership = "switchOwnership"
    static let numCubesScaleAt100s = "numCubesScaleAt100s"
    static let numCubesScaleAt110s = "numCubesScaleAt110s"
    static let allianceSwitchCycleTimeAuto = "allianceSwitchCycleTimeAuto"
    static let allianceSwitchCycleTimeTele = "allianceSwitchCycleTimeTele"
    static let opponentSwitchCycleTimeTele = "opponentSwitchCycleTimeTele"
    static let scaleCycleTimeAuto = "scaleCycleTimeAuto"
    static let scaleCycleTimeTele = "scaleCycleTimeTele"
    static let exchangeCycleTime = "exchangeCycleTime"
    static let numAllianceSwitchAuto = "numAllianceSwitchAuto"
    static let numAllianceSwitchTele = "numAllianceSwitchTele"
    static let numOpponentSwitchTele = "numOpponentSwitchTele"
    static let numScaleAuto = "numScaleAuto"
    static let numScaleTele = "numScaleTele"
    static let avgVaultTime = "avgVaultTime"
    static let totalCubesPlaced = "totalCubesPlaced"
    static let numExchangeInput = "numExchangeInput"
    static let numCubesDroppedAuto = "numCubesDroppedAuto"
    static let numCubesDroppedTele = "numCubesDroppedTele"
    static let numSpilledCubesAuto = "numSpilledCubesAuto"
    static let numSpilledCubesTele = "numSpilledCubesTele"
}

  // MARK: Properties
  public var numOpponentSwitchSuccessTele: Int?
  public var avgScaleTimeAuto: Int?
  public var numCubesPlacedTele: Int?
  public var numOpponentSwitchFailedTele: Int?
  public var numAllianceSwitchFailedTele: Int?
  public var drivingAbility: Int?
  public var numAllianceSwitchSuccessAuto: Int?
  public var numRPs: Int?
  public var avgAllianceSwitchTimeAuto: Int?
  public var climbTime: Int?
  public var numClimbAttempts: Int?
  public var numScaleFailedAuto: Int?
  public var numAllianceSwitchSuccessTele: Int?
  public var numScaleSuccessTele: Int?
  public var didConflictWithAuto: Bool? = false
  public var numAllianceSwitchFailedAuto: Int?
  public var avgAllianceSwitchTimeTele: Int?
  public var numScaleFailedTele: Int?
  public var isDysfunctional: Bool? = false
  public var numOpponentSwitchSuccessAuto: Int?
  public var numScaleSuccessAuto: Int?
  public var avgScaleTimeTele: Int?
  public var numCubesPlacedAuto: Int?
  public var numOpponentSwitchFailedAuto: Int?
  public var didClimb: Bool?
    public var numRobotsLifted: Int?
    public var timeToOwnAllianceSwitchAuto: Float?
    public var timeToOwnScaleAuto: Float?
    public var numAlliancePlatformIntakeTele: Int?
    public var numOpponentPlatformIntakeTele: Int?
    public var switchOwnership: Int?
    public var numCubesScaleAt100s: Int?
    public var numCubesScaleAt110s: Int?
    public var allianceSwitchCycleTimeAuto: Float?
    public var allianceSwitchCycleTimeTele: Float?
    public var opponentSwitchCycleTimeTele: Float?
    public var scaleCycleTimeAuto: Float?
    public var scaleCycleTimeTele: Float?
    public var exchangeCycleTime: Float?
    public var numAllianceSwitchAuto: Int?
    public var numAllianceSwitchTele: Int?
    public var numOpponentSwitchTele: Int?
    public var numScaleAuto: Int?
    public var numScaleTele: Int?
    public var avgVaultTime: Float?
    public var totalCubesPlaced: Int?
    public var numExchangeInput: Int?
    public var numCubesDroppedAuto: Int?
    public var numCubesDroppedTele: Int?
    public var numSpilledCubesAuto: Int?
    public var numSpilledCubesTele: Int?

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
    numOpponentSwitchSuccessTele = json[SerializationKeys.numOpponentSwitchSuccessTele].int
    avgScaleTimeAuto = json[SerializationKeys.avgScaleTimeAuto].int
    numCubesPlacedTele = json[SerializationKeys.numCubesPlacedTele].int
    numOpponentSwitchFailedTele = json[SerializationKeys.numOpponentSwitchFailedTele].int
    numAllianceSwitchFailedTele = json[SerializationKeys.numAllianceSwitchFailedTele].int
    drivingAbility = json[SerializationKeys.drivingAbility].int
    numAllianceSwitchSuccessAuto = json[SerializationKeys.numAllianceSwitchSuccessAuto].int
    numRPs = json[SerializationKeys.numRPs].int
    avgAllianceSwitchTimeAuto = json[SerializationKeys.avgAllianceSwitchTimeAuto].int
    climbTime = json[SerializationKeys.climbTime].int
    numClimbAttempts = json[SerializationKeys.numClimbAttempts].int
    numScaleFailedAuto = json[SerializationKeys.numScaleFailedAuto].int
    numAllianceSwitchSuccessTele = json[SerializationKeys.numAllianceSwitchSuccessTele].int
    numScaleSuccessTele = json[SerializationKeys.numScaleSuccessTele].int
    didConflictWithAuto = json[SerializationKeys.didConflictWithAuto].boolValue
    numAllianceSwitchFailedAuto = json[SerializationKeys.numAllianceSwitchFailedAuto].int
    avgAllianceSwitchTimeTele = json[SerializationKeys.avgAllianceSwitchTimeTele].int
    numScaleFailedTele = json[SerializationKeys.numScaleFailedTele].int
    isDysfunctional = json[SerializationKeys.isDysfunctional].boolValue
    numOpponentSwitchSuccessAuto = json[SerializationKeys.numOpponentSwitchSuccessAuto].int
    numScaleSuccessAuto = json[SerializationKeys.numScaleSuccessAuto].int
    avgScaleTimeTele = json[SerializationKeys.avgScaleTimeTele].int
    numCubesPlacedAuto = json[SerializationKeys.numCubesPlacedAuto].int
    numOpponentSwitchFailedAuto = json[SerializationKeys.numOpponentSwitchFailedAuto].int
    didClimb = json[SerializationKeys.didClimb].bool
    numRobotsLifted = json[SerializationKeys.numRobotsLifted].int
    timeToOwnAllianceSwitchAuto = json[SerializationKeys.timeToOwnAllianceSwitchAuto].float
    timeToOwnScaleAuto = json[SerializationKeys.timeToOwnScaleAuto].float
    numAlliancePlatformIntakeTele = json[SerializationKeys.numAlliancePlatformIntakeTele].int
    numOpponentPlatformIntakeTele = json[SerializationKeys.numOpponentPlatformIntakeTele].int
    switchOwnership = json[SerializationKeys.switchOwnership].int
    numCubesScaleAt100s = json[SerializationKeys.numCubesScaleAt100s].int
    numCubesScaleAt100s = json[SerializationKeys.numCubesScaleAt110s].int
    allianceSwitchCycleTimeAuto = json[SerializationKeys.allianceSwitchCycleTimeAuto].float
    allianceSwitchCycleTimeTele = json[SerializationKeys.allianceSwitchCycleTimeTele].float
    opponentSwitchCycleTimeTele = json[SerializationKeys.opponentSwitchCycleTimeTele].float
    scaleCycleTimeAuto = json[SerializationKeys.scaleCycleTimeAuto].float
    scaleCycleTimeTele = json[SerializationKeys.scaleCycleTimeTele].float
    exchangeCycleTime = json[SerializationKeys.exchangeCycleTime].float
    numAllianceSwitchAuto = json[SerializationKeys.numAllianceSwitchAuto].int
    numAllianceSwitchTele = json[SerializationKeys.numAllianceSwitchTele].int
    numOpponentSwitchTele = json[SerializationKeys.numOpponentSwitchTele].int
    numScaleAuto = json[SerializationKeys.numScaleAuto].int
    numScaleTele = json[SerializationKeys.numScaleTele].int
    avgVaultTime = json[SerializationKeys.avgVaultTime].float
    totalCubesPlaced = json[SerializationKeys.totalCubesPlaced].int
    numExchangeInput = json[SerializationKeys.numExchangeInput].int
    numCubesDroppedAuto = json[SerializationKeys.numCubesDroppedAuto].int
    numCubesDroppedTele = json[SerializationKeys.numCubesDroppedTele].int
    numSpilledCubesAuto = json[SerializationKeys.numSpilledCubesAuto].int
    numSpilledCubesTele = json[SerializationKeys.numSpilledCubesTele].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = numOpponentSwitchSuccessTele { dictionary[SerializationKeys.numOpponentSwitchSuccessTele] = value }
    if let value = avgScaleTimeAuto { dictionary[SerializationKeys.avgScaleTimeAuto] = value }
    if let value = numCubesPlacedTele { dictionary[SerializationKeys.numCubesPlacedTele] = value }
    if let value = numOpponentSwitchFailedTele { dictionary[SerializationKeys.numOpponentSwitchFailedTele] = value }
    if let value = numAllianceSwitchFailedTele { dictionary[SerializationKeys.numAllianceSwitchFailedTele] = value }
    if let value = drivingAbility { dictionary[SerializationKeys.drivingAbility] = value }
    if let value = numAllianceSwitchSuccessAuto { dictionary[SerializationKeys.numAllianceSwitchSuccessAuto] = value }
    if let value = numRPs { dictionary[SerializationKeys.numRPs] = value }
    if let value = avgAllianceSwitchTimeAuto { dictionary[SerializationKeys.avgAllianceSwitchTimeAuto] = value }
    if let value = climbTime { dictionary[SerializationKeys.climbTime] = value }
    if let value = numClimbAttempts { dictionary[SerializationKeys.numClimbAttempts] = value }
    if let value = numScaleFailedAuto { dictionary[SerializationKeys.numScaleFailedAuto] = value }
    if let value = numAllianceSwitchSuccessTele { dictionary[SerializationKeys.numAllianceSwitchSuccessTele] = value }
    if let value = numScaleSuccessTele { dictionary[SerializationKeys.numScaleSuccessTele] = value }
    dictionary[SerializationKeys.didConflictWithAuto] = didConflictWithAuto
    if let value = numAllianceSwitchFailedAuto { dictionary[SerializationKeys.numAllianceSwitchFailedAuto] = value }
    if let value = avgAllianceSwitchTimeTele { dictionary[SerializationKeys.avgAllianceSwitchTimeTele] = value }
    if let value = numScaleFailedTele { dictionary[SerializationKeys.numScaleFailedTele] = value }
    dictionary[SerializationKeys.isDysfunctional] = isDysfunctional
    if let value = numOpponentSwitchSuccessAuto { dictionary[SerializationKeys.numOpponentSwitchSuccessAuto] = value }
    if let value = numScaleSuccessAuto { dictionary[SerializationKeys.numScaleSuccessAuto] = value }
    if let value = avgScaleTimeTele { dictionary[SerializationKeys.avgScaleTimeTele] = value }
    if let value = numCubesPlacedAuto { dictionary[SerializationKeys.numCubesPlacedAuto] = value }
    if let value = numOpponentSwitchFailedAuto { dictionary[SerializationKeys.numOpponentSwitchFailedAuto] = value }
    if let value = didClimb { dictionary[SerializationKeys.didClimb] = value }
    if let value = numRobotsLifted { dictionary[SerializationKeys.numRobotsLifted] = value }
    if let value = timeToOwnAllianceSwitchAuto { dictionary[SerializationKeys.timeToOwnAllianceSwitchAuto] = value }
    if let value = timeToOwnScaleAuto { dictionary[SerializationKeys.timeToOwnScaleAuto] = value }
    if let value = numAlliancePlatformIntakeTele { dictionary[SerializationKeys.numAlliancePlatformIntakeTele] = value }
    if let value = numOpponentPlatformIntakeTele { dictionary[SerializationKeys.numOpponentPlatformIntakeTele] = value }
    if let value = switchOwnership { dictionary[SerializationKeys.switchOwnership] = value }
    if let value = numCubesScaleAt100s { dictionary[SerializationKeys.numCubesScaleAt100s] = value }
    if let value = numCubesScaleAt110s { dictionary[SerializationKeys.numCubesScaleAt110s] = value }
    if let value = allianceSwitchCycleTimeAuto { dictionary[SerializationKeys.allianceSwitchCycleTimeAuto] = value }
    if let value = allianceSwitchCycleTimeTele { dictionary[SerializationKeys.allianceSwitchCycleTimeTele] = value }
    if let value = opponentSwitchCycleTimeTele { dictionary[SerializationKeys.opponentSwitchCycleTimeTele] = value }
    if let value = scaleCycleTimeAuto { dictionary[SerializationKeys.scaleCycleTimeAuto] = value }
    if let value = scaleCycleTimeTele { dictionary[SerializationKeys.scaleCycleTimeTele] = value }
    if let value = exchangeCycleTime { dictionary[SerializationKeys.exchangeCycleTime] = value }
    if let value = numAllianceSwitchAuto { dictionary[SerializationKeys.numAllianceSwitchAuto] = value }
    if let value = numAllianceSwitchTele { dictionary[SerializationKeys.numAllianceSwitchTele] = value }
    if let value = numOpponentSwitchTele { dictionary[SerializationKeys.numOpponentSwitchTele] = value }
    if let value = numScaleAuto { dictionary[SerializationKeys.numScaleAuto] = value }
    if let value = numScaleTele { dictionary[SerializationKeys.numScaleTele] = value }
    if let value = avgVaultTime { dictionary[SerializationKeys.avgVaultTime] = value }
    if let value = totalCubesPlaced { dictionary[SerializationKeys.totalCubesPlaced] = value }
    if let value = numExchangeInput { dictionary[SerializationKeys.numExchangeInput] = value }
    if let value = numCubesDroppedAuto { dictionary[SerializationKeys.numCubesDroppedAuto] = value }
    if let value = numCubesDroppedTele { dictionary[SerializationKeys.numCubesDroppedTele] = value }
    if let value = numSpilledCubesAuto { dictionary[SerializationKeys.numSpilledCubesAuto] = value }
    if let value = numSpilledCubesTele { dictionary[SerializationKeys.numSpilledCubesTele] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.numOpponentSwitchSuccessTele = aDecoder.decodeObject(forKey: SerializationKeys.numOpponentSwitchSuccessTele) as? Int
    self.avgScaleTimeAuto = aDecoder.decodeObject(forKey: SerializationKeys.avgScaleTimeAuto) as? Int
    self.numCubesPlacedTele = aDecoder.decodeObject(forKey: SerializationKeys.numCubesPlacedTele) as? Int
    self.numOpponentSwitchFailedTele = aDecoder.decodeObject(forKey: SerializationKeys.numOpponentSwitchFailedTele) as? Int
    self.numAllianceSwitchFailedTele = aDecoder.decodeObject(forKey: SerializationKeys.numAllianceSwitchFailedTele) as? Int
    self.drivingAbility = aDecoder.decodeObject(forKey: SerializationKeys.drivingAbility) as? Int
    self.numAllianceSwitchSuccessAuto = aDecoder.decodeObject(forKey: SerializationKeys.numAllianceSwitchSuccessAuto) as? Int
    self.numRPs = aDecoder.decodeObject(forKey: SerializationKeys.numRPs) as? Int
    self.avgAllianceSwitchTimeAuto = aDecoder.decodeObject(forKey: SerializationKeys.avgAllianceSwitchTimeAuto) as? Int
    self.climbTime = aDecoder.decodeObject(forKey: SerializationKeys.climbTime) as? Int
    self.numClimbAttempts = aDecoder.decodeObject(forKey: SerializationKeys.numClimbAttempts) as? Int
    self.numScaleFailedAuto = aDecoder.decodeObject(forKey: SerializationKeys.numScaleFailedAuto) as? Int
    self.numAllianceSwitchSuccessTele = aDecoder.decodeObject(forKey: SerializationKeys.numAllianceSwitchSuccessTele) as? Int
    self.numScaleSuccessTele = aDecoder.decodeObject(forKey: SerializationKeys.numScaleSuccessTele) as? Int
    self.didConflictWithAuto = aDecoder.decodeBool(forKey: SerializationKeys.didConflictWithAuto)
    self.numAllianceSwitchFailedAuto = aDecoder.decodeObject(forKey: SerializationKeys.numAllianceSwitchFailedAuto) as? Int
    self.avgAllianceSwitchTimeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgAllianceSwitchTimeTele) as? Int
    self.numScaleFailedTele = aDecoder.decodeObject(forKey: SerializationKeys.numScaleFailedTele) as? Int
    self.isDysfunctional = aDecoder.decodeBool(forKey: SerializationKeys.isDysfunctional)
    self.numOpponentSwitchSuccessAuto = aDecoder.decodeObject(forKey: SerializationKeys.numOpponentSwitchSuccessAuto) as? Int
    self.numScaleSuccessAuto = aDecoder.decodeObject(forKey: SerializationKeys.numScaleSuccessAuto) as? Int
    self.avgScaleTimeTele = aDecoder.decodeObject(forKey: SerializationKeys.avgScaleTimeTele) as? Int
    self.numCubesPlacedAuto = aDecoder.decodeObject(forKey: SerializationKeys.numCubesPlacedAuto) as? Int
    self.numOpponentSwitchFailedAuto = aDecoder.decodeObject(forKey: SerializationKeys.numOpponentSwitchFailedAuto) as? Int
    self.didClimb = aDecoder.decodeObject(forKey: SerializationKeys.didClimb) as? Bool
    self.numRobotsLifted = aDecoder.decodeObject(forKey: SerializationKeys.numRobotsLifted) as? Int
    self.timeToOwnAllianceSwitchAuto = aDecoder.decodeObject(forKey: SerializationKeys.timeToOwnAllianceSwitchAuto) as? Float
    self.timeToOwnScaleAuto = aDecoder.decodeObject(forKey: SerializationKeys.timeToOwnScaleAuto) as? Float
    self.numAlliancePlatformIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.numAlliancePlatformIntakeTele) as? Int
    self.numOpponentPlatformIntakeTele = aDecoder.decodeObject(forKey: SerializationKeys.numOpponentPlatformIntakeTele) as? Int
    self.switchOwnership = aDecoder.decodeObject(forKey: SerializationKeys.switchOwnership) as? Int
    self.numCubesScaleAt100s = aDecoder.decodeObject(forKey: SerializationKeys.numCubesScaleAt100s) as? Int
    self.numCubesScaleAt110s = aDecoder.decodeObject(forKey: SerializationKeys.numCubesScaleAt110s) as? Int
    self.allianceSwitchCycleTimeAuto = aDecoder.decodeObject(forKey: SerializationKeys.allianceSwitchCycleTimeAuto) as? Float
    self.allianceSwitchCycleTimeTele = aDecoder.decodeObject(forKey: SerializationKeys.allianceSwitchCycleTimeTele) as? Float
    self.opponentSwitchCycleTimeTele = aDecoder.decodeObject(forKey: SerializationKeys.opponentSwitchCycleTimeTele) as? Float
    self.scaleCycleTimeAuto = aDecoder.decodeObject(forKey: SerializationKeys.scaleCycleTimeAuto) as? Float
    self.scaleCycleTimeTele = aDecoder.decodeObject(forKey: SerializationKeys.scaleCycleTimeTele) as? Float
    self.exchangeCycleTime = aDecoder.decodeObject(forKey: SerializationKeys.exchangeCycleTime) as? Float
    self.numAllianceSwitchAuto = aDecoder.decodeObject(forKey: SerializationKeys.numAllianceSwitchAuto) as? Int
    self.numAllianceSwitchTele = aDecoder.decodeObject(forKey: SerializationKeys.numAllianceSwitchTele) as? Int
    self.numOpponentSwitchTele = aDecoder.decodeObject(forKey: SerializationKeys.numOpponentSwitchTele) as? Int
    self.numScaleAuto = aDecoder.decodeObject(forKey: SerializationKeys.numOpponentSwitchTele) as? Int
    self.numScaleTele = aDecoder.decodeObject(forKey: SerializationKeys.numScaleTele) as? Int
    self.avgVaultTime = aDecoder.decodeObject(forKey: SerializationKeys.avgVaultTime) as? Float
    self.totalCubesPlaced = aDecoder.decodeObject(forKey: SerializationKeys.totalCubesPlaced) as? Int
    self.numExchangeInput = aDecoder.decodeObject(forKey: SerializationKeys.numExchangeInput) as? Int
    self.numCubesDroppedAuto = aDecoder.decodeObject(forKey: SerializationKeys.numCubesDroppedAuto) as? Int
    self.numCubesDroppedTele = aDecoder.decodeObject(forKey: SerializationKeys.numCubesDroppedTele) as? Int
    self.numSpilledCubesAuto = aDecoder.decodeObject(forKey: SerializationKeys.numSpilledCubesAuto) as? Int
    self.numSpilledCubesTele = aDecoder.decodeObject(forKey: SerializationKeys.numSpilledCubesTele) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(numOpponentSwitchSuccessTele, forKey: SerializationKeys.numOpponentSwitchSuccessTele)
    aCoder.encode(avgScaleTimeAuto, forKey: SerializationKeys.avgScaleTimeAuto)
    aCoder.encode(numCubesPlacedTele, forKey: SerializationKeys.numCubesPlacedTele)
    aCoder.encode(numOpponentSwitchFailedTele, forKey: SerializationKeys.numOpponentSwitchFailedTele)
    aCoder.encode(numAllianceSwitchFailedTele, forKey: SerializationKeys.numAllianceSwitchFailedTele)
    aCoder.encode(drivingAbility, forKey: SerializationKeys.drivingAbility)
    aCoder.encode(numAllianceSwitchSuccessAuto, forKey: SerializationKeys.numAllianceSwitchSuccessAuto)
    aCoder.encode(numRPs, forKey: SerializationKeys.numRPs)
    aCoder.encode(avgAllianceSwitchTimeAuto, forKey: SerializationKeys.avgAllianceSwitchTimeAuto)
    aCoder.encode(climbTime, forKey: SerializationKeys.climbTime)
    aCoder.encode(numClimbAttempts, forKey: SerializationKeys.numClimbAttempts)
    aCoder.encode(numScaleFailedAuto, forKey: SerializationKeys.numScaleFailedAuto)
    aCoder.encode(numAllianceSwitchSuccessTele, forKey: SerializationKeys.numAllianceSwitchSuccessTele)
    aCoder.encode(numScaleSuccessTele, forKey: SerializationKeys.numScaleSuccessTele)
    aCoder.encode(didConflictWithAuto, forKey: SerializationKeys.didConflictWithAuto)
    aCoder.encode(numAllianceSwitchFailedAuto, forKey: SerializationKeys.numAllianceSwitchFailedAuto)
    aCoder.encode(avgAllianceSwitchTimeTele, forKey: SerializationKeys.avgAllianceSwitchTimeTele)
    aCoder.encode(numScaleFailedTele, forKey: SerializationKeys.numScaleFailedTele)
    aCoder.encode(isDysfunctional, forKey: SerializationKeys.isDysfunctional)
    aCoder.encode(numOpponentSwitchSuccessAuto, forKey: SerializationKeys.numOpponentSwitchSuccessAuto)
    aCoder.encode(numScaleSuccessAuto, forKey: SerializationKeys.numScaleSuccessAuto)
    aCoder.encode(avgScaleTimeTele, forKey: SerializationKeys.avgScaleTimeTele)
    aCoder.encode(numCubesPlacedAuto, forKey: SerializationKeys.numCubesPlacedAuto)
    aCoder.encode(numOpponentSwitchFailedAuto, forKey: SerializationKeys.numOpponentSwitchFailedAuto)
    aCoder.encode(numRobotsLifted, forKey: SerializationKeys.numRobotsLifted)
    aCoder.encode(didClimb, forKey: SerializationKeys.didClimb)
    aCoder.encode(timeToOwnAllianceSwitchAuto, forKey: SerializationKeys.timeToOwnAllianceSwitchAuto)
    aCoder.encode(timeToOwnScaleAuto, forKey: SerializationKeys.timeToOwnScaleAuto)
    aCoder.encode(numAlliancePlatformIntakeTele, forKey: SerializationKeys.numAlliancePlatformIntakeTele)
    aCoder.encode(numAlliancePlatformIntakeTele, forKey: SerializationKeys.numOpponentPlatformIntakeTele)
    aCoder.encode(switchOwnership, forKey: SerializationKeys.switchOwnership)
    aCoder.encode(numCubesScaleAt100s, forKey: SerializationKeys.numCubesScaleAt100s)
    aCoder.encode(numCubesScaleAt110s, forKey: SerializationKeys.numCubesScaleAt110s)
    aCoder.encode(allianceSwitchCycleTimeAuto, forKey: SerializationKeys.allianceSwitchCycleTimeAuto)
    aCoder.encode(allianceSwitchCycleTimeTele, forKey: SerializationKeys.allianceSwitchCycleTimeTele)
    aCoder.encode(opponentSwitchCycleTimeTele, forKey: SerializationKeys.opponentSwitchCycleTimeTele)
    aCoder.encode(scaleCycleTimeAuto, forKey: SerializationKeys.scaleCycleTimeAuto)
    aCoder.encode(scaleCycleTimeTele, forKey: SerializationKeys.scaleCycleTimeTele)
    aCoder.encode(exchangeCycleTime, forKey: SerializationKeys.exchangeCycleTime)
    aCoder.encode(numAllianceSwitchAuto, forKey: SerializationKeys.numAllianceSwitchAuto)
    aCoder.encode(numAllianceSwitchTele, forKey: SerializationKeys.numAllianceSwitchTele)
    aCoder.encode(numOpponentSwitchTele, forKey: SerializationKeys.numOpponentSwitchTele)
    aCoder.encode(numScaleAuto, forKey: SerializationKeys.numScaleAuto)
    aCoder.encode(numScaleTele, forKey: SerializationKeys.numScaleTele)
    aCoder.encode(avgVaultTime, forKey: SerializationKeys.avgVaultTime)
    aCoder.encode(totalCubesPlaced, forKey: SerializationKeys.totalCubesPlaced)
    aCoder.encode(numExchangeInput, forKey: SerializationKeys.numExchangeInput)
    aCoder.encode(numCubesDroppedAuto, forKey: SerializationKeys.numCubesDroppedAuto)
    aCoder.encode(numCubesDroppedTele, forKey: SerializationKeys.numCubesDroppedTele)
    aCoder.encode(numSpilledCubesAuto, forKey: SerializationKeys.numSpilledCubesAuto)
    aCoder.encode(numSpilledCubesTele, forKey: SerializationKeys.numSpilledCubesTele)
  }
}
