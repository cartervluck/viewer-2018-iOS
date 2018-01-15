//
//  Match.swift
//
//  Created by Carter Luck on 1/14/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class Match: NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let redAllianceTeamNumbers = "redAllianceTeamNumbers"
    static let blueCubesForPowerup = "blueCubesForPowerup"
    static let blueDidFaceBoss = "blueDidFaceBoss"
    static let blueCubesInVaultFinal = "blueCubesInVaultFinal"
    static let redSwitch = "redSwitch"
    static let redDidFaceBoss = "redDidFaceBoss"
    static let number = "number"
    static let calculatedData = "calculatedData"
    static let foulPointsGainedRed = "foulPointsGainedRed"
    static let blueDidAutoQuest = "blueDidAutoQuest"
    static let redDidAutoQuest = "redDidAutoQuest"
    static let redCubesInVaultFinal = "redCubesInVaultFinal"
    static let blueAllianceTeamNumbers = "blueAllianceTeamNumbers"
    static let redCubesForPowerup = "redCubesForPowerup"
    static let scale = "scale"
    static let blueScore = "blueScore"
    static let blueSwitch = "blueSwitch"
    static let foulPointsGainedBlue = "foulPointsGainedBlue"
    static let redScore = "redScore"
  }

  // MARK: Properties
  public var redAllianceTeamNumbers: [Int]?
    public var blueCubesForPowerup: [String:Int]?
  public var blueDidFaceBoss: Bool? = false
  public var blueCubesInVaultFinal: [String:Int]?
    public var redSwitch: [String:String]?
  public var redDidFaceBoss: Bool? = false
  public var number: Int?
  public var calculatedData: CalculatedMatchData?
  public var foulPointsGainedRed: Int?
  public var blueDidAutoQuest: Bool? = false
  public var redDidAutoQuest: Bool? = false
  public var redCubesInVaultFinal: [String:Int]?
  public var blueAllianceTeamNumbers: [Int]?
  public var redCubesForPowerup: [String:Int]?
    public var scale: [String:String]?
  public var blueScore: Int?
  public var blueSwitch: [String:String]?
  public var foulPointsGainedBlue: Int?
  public var redScore: Int?

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
    if let items = json[SerializationKeys.redAllianceTeamNumbers].array { redAllianceTeamNumbers = items.map { $0.intValue } }
    blueCubesForPowerup = json[SerializationKeys.blueCubesForPowerup].dictionaryObject as! [String: Int]?
    blueDidFaceBoss = json[SerializationKeys.blueDidFaceBoss].boolValue
    blueCubesInVaultFinal = json[SerializationKeys.blueCubesInVaultFinal].dictionaryObject as! [String: Int]?
    redSwitch = (json[SerializationKeys.redSwitch].dictionaryObject as! [String: String]?)!
    redDidFaceBoss = json[SerializationKeys.redDidFaceBoss].boolValue
    number = json[SerializationKeys.number].int
    calculatedData = CalculatedMatchData(json: json[SerializationKeys.calculatedData])
    foulPointsGainedRed = json[SerializationKeys.foulPointsGainedRed].int
    blueDidAutoQuest = json[SerializationKeys.blueDidAutoQuest].boolValue
    redDidAutoQuest = json[SerializationKeys.redDidAutoQuest].boolValue
    redCubesInVaultFinal = json[SerializationKeys.redCubesInVaultFinal].dictionaryObject as! [String: Int]?
    if let items = json[SerializationKeys.blueAllianceTeamNumbers].array { blueAllianceTeamNumbers = items.map { $0.intValue } }
    redCubesForPowerup = json[SerializationKeys.redCubesForPowerup].dictionaryObject as! [String: Int]?
    scale = json[SerializationKeys.scale].dictionaryObject as! [String: String]?
    blueScore = json[SerializationKeys.blueScore].int
    blueSwitch = json[SerializationKeys.blueSwitch].dictionaryObject as! [String: String]?
    foulPointsGainedBlue = json[SerializationKeys.foulPointsGainedBlue].int
    redScore = json[SerializationKeys.redScore].int
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    if let value = redAllianceTeamNumbers { dictionary[SerializationKeys.redAllianceTeamNumbers] = value }
    if let value = blueCubesForPowerup { dictionary[SerializationKeys.blueCubesForPowerup] = value }
    dictionary[SerializationKeys.blueDidFaceBoss] = blueDidFaceBoss
    if let value = blueCubesInVaultFinal { dictionary[SerializationKeys.blueCubesInVaultFinal] = value }
    if let value = redSwitch { dictionary[SerializationKeys.redSwitch] = value.dictionaryRepresentation() }
    dictionary[SerializationKeys.redDidFaceBoss] = redDidFaceBoss
    if let value = number { dictionary[SerializationKeys.number] = value }
    if let value = calculatedData { dictionary[SerializationKeys.calculatedData] = value.dictionaryRepresentation() }
    if let value = foulPointsGainedRed { dictionary[SerializationKeys.foulPointsGainedRed] = value }
    dictionary[SerializationKeys.blueDidAutoQuest] = blueDidAutoQuest
    dictionary[SerializationKeys.redDidAutoQuest] = redDidAutoQuest
    if let value = redCubesInVaultFinal { dictionary[SerializationKeys.redCubesInVaultFinal] = value }
    if let value = blueAllianceTeamNumbers { dictionary[SerializationKeys.blueAllianceTeamNumbers] = value }
    if let value = redCubesForPowerup { dictionary[SerializationKeys.redCubesForPowerup] = value }
    if let value = scale { dictionary[SerializationKeys.scale] = value.dictionaryRepresentation() }
    if let value = blueScore { dictionary[SerializationKeys.blueScore] = value }
    if let value = blueSwitch { dictionary[SerializationKeys.blueSwitch] = value.dictionaryRepresentation() }
    if let value = foulPointsGainedBlue { dictionary[SerializationKeys.foulPointsGainedBlue] = value }
    if let value = redScore { dictionary[SerializationKeys.redScore] = value }
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.redAllianceTeamNumbers = aDecoder.decodeObject(forKey: SerializationKeys.redAllianceTeamNumbers) as? [Int]
    self.blueCubesForPowerup = aDecoder.decodeObject(forKey: SerializationKeys.blueCubesForPowerup) as? [String:Int]
    self.blueDidFaceBoss = aDecoder.decodeBool(forKey: SerializationKeys.blueDidFaceBoss)
    self.blueCubesInVaultFinal = aDecoder.decodeObject(forKey: SerializationKeys.blueCubesInVaultFinal) as? [String:Int]
    self.redSwitch = aDecoder.decodeObject(forKey: SerializationKeys.redSwitch) as? [String:String]
    self.redDidFaceBoss = aDecoder.decodeBool(forKey: SerializationKeys.redDidFaceBoss)
    self.number = aDecoder.decodeObject(forKey: SerializationKeys.number) as? Int
    self.calculatedData = aDecoder.decodeObject(forKey: SerializationKeys.calculatedData) as? CalculatedMatchData
    self.foulPointsGainedRed = aDecoder.decodeObject(forKey: SerializationKeys.foulPointsGainedRed) as? Int
    self.blueDidAutoQuest = aDecoder.decodeBool(forKey: SerializationKeys.blueDidAutoQuest)
    self.redDidAutoQuest = aDecoder.decodeBool(forKey: SerializationKeys.redDidAutoQuest)
    self.redCubesInVaultFinal = aDecoder.decodeObject(forKey: SerializationKeys.redCubesInVaultFinal) as? [String:Int]
    self.blueAllianceTeamNumbers = aDecoder.decodeObject(forKey: SerializationKeys.blueAllianceTeamNumbers) as? [Int]
    self.redCubesForPowerup = aDecoder.decodeObject(forKey: SerializationKeys.redCubesForPowerup) as? [String:Int]
    self.scale = aDecoder.decodeObject(forKey: SerializationKeys.scale) as? [String:String]
    self.blueScore = aDecoder.decodeObject(forKey: SerializationKeys.blueScore) as? Int
    self.blueSwitch = aDecoder.decodeObject(forKey: SerializationKeys.blueSwitch) as? [String:String]
    self.foulPointsGainedBlue = aDecoder.decodeObject(forKey: SerializationKeys.foulPointsGainedBlue) as? Int
    self.redScore = aDecoder.decodeObject(forKey: SerializationKeys.redScore) as? Int
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(redAllianceTeamNumbers, forKey: SerializationKeys.redAllianceTeamNumbers)
    aCoder.encode(blueCubesForPowerup, forKey: SerializationKeys.blueCubesForPowerup)
    aCoder.encode(blueDidFaceBoss, forKey: SerializationKeys.blueDidFaceBoss)
    aCoder.encode(blueCubesInVaultFinal, forKey: SerializationKeys.blueCubesInVaultFinal)
    aCoder.encode(redSwitch, forKey: SerializationKeys.redSwitch)
    aCoder.encode(redDidFaceBoss, forKey: SerializationKeys.redDidFaceBoss)
    aCoder.encode(number, forKey: SerializationKeys.number)
    aCoder.encode(calculatedData, forKey: SerializationKeys.calculatedData)
    aCoder.encode(foulPointsGainedRed, forKey: SerializationKeys.foulPointsGainedRed)
    aCoder.encode(blueDidAutoQuest, forKey: SerializationKeys.blueDidAutoQuest)
    aCoder.encode(redDidAutoQuest, forKey: SerializationKeys.redDidAutoQuest)
    aCoder.encode(redCubesInVaultFinal, forKey: SerializationKeys.redCubesInVaultFinal)
    aCoder.encode(blueAllianceTeamNumbers, forKey: SerializationKeys.blueAllianceTeamNumbers)
    aCoder.encode(redCubesForPowerup, forKey: SerializationKeys.redCubesForPowerup)
    aCoder.encode(scale, forKey: SerializationKeys.scale)
    aCoder.encode(blueScore, forKey: SerializationKeys.blueScore)
    aCoder.encode(blueSwitch, forKey: SerializationKeys.blueSwitch)
    aCoder.encode(foulPointsGainedBlue, forKey: SerializationKeys.foulPointsGainedBlue)
    aCoder.encode(redScore, forKey: SerializationKeys.redScore)
  }

}
