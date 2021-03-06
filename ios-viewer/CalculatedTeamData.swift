//
//  CalculatedData.swift
//
//  Created by Bryton Moeller on 1/18/17
//  Copyright (c) Citrus Circuits. All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CalculatedTeamData: NSObject {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let sdLiftoffAbility = "sdLiftoffAbility"
    static let RScoreDefense = "RScoreDefense"
    static let RScoreAgility = "RScoreAgility"
    static let RScoreDrivingAbility = "RScoreDrivingAbility"
    static let incapacitatedPercentage = "incapacitatedPercentage"
    static let overallSecondPickAbility = "overallSecondPickAbility"
    static let avgHighShotsTele = "avgHighShotsTele"
    static let baselineReachedPercentage = "baselineReachedPercentage"
    static let avgGearsPlacedByLiftAuto = "avgGearsPlacedByLiftAuto"
    static let avgGearControl = "avgGearControl"
    static let actualSeed = "actualSeed"
    static let sdHighShotsTele = "sdHighShotsTele"
    static let liftoffPercentage = "liftoffPercentage"
    static let avgHighShotsAuto = "avgHighShotsAuto"
    static let avgAgility = "avgAgility"
    static let predictedSeed = "predictedSeed"
    static let avgDrivingAbility = "avgDrivingAbility"
    static let avgGearsPlacedByLiftTele = "avgGearsPlacedByLiftTele"
    static let liftoffAbility = "liftoffAbility"
    static let sdGearsPlacedByLiftAuto = "sdGearsPlacedByLiftAuto"
    static let sdLowShotsAuto = "sdLowShotsAuto"
    static let avgKeyShotTime = "avgKeyShotTime"
    static let avgHopperShotTime = "avgHopperShotTime"
    static let sdLowShotsTele = "sdLowShotsTele"
    static let sdGearsPlacedByLiftTele = "sdGearsPlacedByLiftTele"
    static let avgDefense = "avgDefense"
    static let avgLowShotsTele = "avgLowShotsTele"
    static let sdHighShotsAuto = "sdHighShotsAuto"
    static let avgSpeed = "avgSpeed"
    static let RScoreSpeed = "RScoreSpeed"
    static let disabledPercentage = "disabledPercentage"
    static let avgLowShotsAuto = "avgLowShotsAuto"
    static let firstPickAbility = "firstPickAbility"
    static let avgBallControl = "avgBallControl"
    static let actualNumRPs = "actualNumRPs"
    static let predictedNumRPs = "predictedNumRPs"
    static let disfunctionalPercentage = "disfunctionalPercentage"
    static let sdBaselineReachedPercentage = "sdBaselineReachedPercentage"
    static let avgGearsFumbledTele = "avgGearsFumbledTele"
    static let avgGearsEjectedTele = "avgGearsEjectedTele"
    static let avgGearGroundIntakesTele = "avgGearGroundIntakesTele"
    static let avgLoaderIntakesTele = "avgLoaderIntakesTele"
    static let avgHoppersOpenedTele = "avgHoppersOpenedTele"
    static let avgHoppersOpenedAuto = "avgHoppersOpenedAuto"
    static let firstPickAllRotorsTurningChance = "firstPickAllRotorsTurningChance"
    static let avgGearsPlacedAuto = "avgGearsPlacedAuto"
    static let sdGearsPlacedAuto = "sdGearsPlacedAuto"
    static let avgGearsPlacedTele = "avgGearsPlacedTele"
    static let sdGearsPlacedTele = "sdGearsPlacedTele"
    static let allRotorsAbility = "allRotorsAbility"

  }

  // MARK: Properties
  public var sdLiftoffAbility: Float = -1.0
    public var RScoreDefense: Float = -1.0
    public var RScoreAgility: Float = -1.0
    public var RScoreDrivingAbility: Float = -1.0
  public var incapacitatedPercentage: Float = -1.0
  public var overallSecondPickAbility: Float = -1.0
  public var avgHighShotsTele: Float = -1.0
  public var baselineReachedPercentage: Float = -1.0
    public var avgGearsPlacedByLiftAuto: [String: Float]?
  public var avgGearControl: Float = -1.0
    public var RScoreSpeed: Float = -1.0
  public var actualSeed: Int = -1
    public var avgDrivingAbility: Float = -1.0
  public var sdHighShotsTele: Float = -1.0
  public var liftoffPercentage: Float = -1.0
  public var avgHighShotsAuto: Float = -1.0
  public var avgAgility: Float = -1.0
  public var predictedSeed: Int = -1
  public var avgGearsPlacedByLiftTele: Float = -1.0
  public var liftoffAbility: Float = -1.0
  public var sdGearsPlacedByLiftAuto: Float = -1.0
  public var sdLowShotsAuto: Float = -1.0
  public var avgKeyShotTime: Float = -1.0
    public var avgHopperShotTime: Float = -1.0
  public var sdLowShotsTele: Float = -1.0
  public var sdGearsPlacedByLiftTele: Float = -1.0
  public var avgDefense: Float = -1.0
  public var avgLowShotsTele: Float = -1.0
  public var sdHighShotsAuto: Float = -1.0
  public var avgSpeed: Float = -1.0
  public var disabledPercentage: Float = -1.0
  public var avgLowShotsAuto: Float = -1.0
  public var firstPickAbility: Float = -1.0
  public var avgBallControl: Float = -1.0
    public var actualNumRPs: Float = -1.0
    public var predictedNumRPs: Float = -1.0
    public var disfunctionalPercentage: Float = -1.0
    public var sdBaselineReachedPercentage: Float = -1.0
    public var avgGearsFumbledTele: Float = -1.0
    public var avgGearsEjectedTele: Float = -1.0
    public var avgGearGroundIntakesTele: Float = -1.0
    public var avgLoaderIntakesTele: Float = -1.0
    public var avgHoppersOpenedTele: Float = -1.0
    public var avgHoppersOpenedAuto: Float = -1.0
    public var firstPickAllRotorsTurningChance: Float = -1.0
    public var avgGearsPlacedAuto: Float = -1.0
    public var sdGearsPlacedAuto: Float = -1.0
    public var avgGearsPlacedTele: Float = -1.0
    public var sdGearsPlacedTele: Float = -1.0
    public var allRotorsAbility: Float = -1.0

    




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
    RScoreDefense = json[SerializationKeys.RScoreDefense].floatValue
    RScoreAgility = json[SerializationKeys.RScoreAgility].floatValue
    RScoreDrivingAbility = json[SerializationKeys.RScoreDrivingAbility].floatValue
    sdLiftoffAbility = json[SerializationKeys.sdLiftoffAbility].floatValue
    incapacitatedPercentage = json[SerializationKeys.incapacitatedPercentage].floatValue
    overallSecondPickAbility = json[SerializationKeys.overallSecondPickAbility].floatValue
    avgHighShotsTele = json[SerializationKeys.avgHighShotsTele].floatValue
    baselineReachedPercentage = json[SerializationKeys.baselineReachedPercentage].floatValue
    avgGearsPlacedByLiftAuto = json[SerializationKeys.avgGearsPlacedByLiftAuto].dictionaryObject as? [String : Float]
    avgGearControl = json[SerializationKeys.avgGearControl].floatValue
    actualSeed = json[SerializationKeys.actualSeed].intValue
    avgDrivingAbility = json[SerializationKeys.avgDrivingAbility].floatValue
    sdHighShotsTele = json[SerializationKeys.sdHighShotsTele].floatValue
    liftoffPercentage = json[SerializationKeys.liftoffPercentage].floatValue
    avgHighShotsAuto = json[SerializationKeys.avgHighShotsAuto].floatValue
    avgAgility = json[SerializationKeys.avgAgility].floatValue
    predictedSeed = json[SerializationKeys.predictedSeed].intValue
    avgGearsPlacedByLiftTele = json[SerializationKeys.avgGearsPlacedByLiftTele].floatValue
    liftoffAbility = json[SerializationKeys.liftoffAbility].floatValue
    sdGearsPlacedByLiftAuto = json[SerializationKeys.sdGearsPlacedByLiftAuto].floatValue
    sdLowShotsAuto = json[SerializationKeys.sdLowShotsAuto].floatValue
    avgKeyShotTime = json[SerializationKeys.avgKeyShotTime].floatValue
    avgHopperShotTime = json[SerializationKeys.avgHopperShotTime].floatValue
    sdLowShotsTele = json[SerializationKeys.sdLowShotsTele].floatValue
    sdGearsPlacedByLiftTele = json[SerializationKeys.sdGearsPlacedByLiftTele].floatValue
    avgDefense = json[SerializationKeys.avgDefense].floatValue
    avgLowShotsTele = json[SerializationKeys.avgLowShotsTele].floatValue
    sdHighShotsAuto = json[SerializationKeys.sdHighShotsAuto].floatValue
    avgSpeed = json[SerializationKeys.avgSpeed].floatValue
    RScoreSpeed = json[SerializationKeys.RScoreSpeed].floatValue
    disabledPercentage = json[SerializationKeys.disabledPercentage].floatValue
    avgLowShotsAuto = json[SerializationKeys.avgLowShotsAuto].floatValue
    firstPickAbility = json[SerializationKeys.firstPickAbility].floatValue
    avgBallControl = json[SerializationKeys.avgBallControl].floatValue
    actualNumRPs = json[SerializationKeys.actualNumRPs].floatValue
    predictedNumRPs = json[SerializationKeys.predictedNumRPs].floatValue
    disfunctionalPercentage = json[SerializationKeys.disfunctionalPercentage].floatValue
    sdBaselineReachedPercentage = json[SerializationKeys.sdBaselineReachedPercentage].floatValue
    avgGearsFumbledTele = json[SerializationKeys.avgGearsFumbledTele].floatValue
    avgGearsEjectedTele = json[SerializationKeys.avgGearsEjectedTele].floatValue
    avgGearGroundIntakesTele = json[SerializationKeys.avgGearGroundIntakesTele].floatValue
    avgLoaderIntakesTele = json[SerializationKeys.avgLoaderIntakesTele].floatValue
    avgHoppersOpenedTele = json[SerializationKeys.avgHoppersOpenedTele].floatValue
    avgHoppersOpenedAuto  = json[SerializationKeys.avgHoppersOpenedAuto].floatValue
    firstPickAllRotorsTurningChance = json[SerializationKeys.firstPickAllRotorsTurningChance].floatValue
    avgGearsPlacedAuto = json[SerializationKeys.avgGearsPlacedAuto].floatValue
    sdGearsPlacedAuto = json[SerializationKeys.sdGearsPlacedAuto].floatValue
    avgGearsPlacedTele = json[SerializationKeys.avgGearsPlacedTele].floatValue
    sdGearsPlacedTele = json[SerializationKeys.sdGearsPlacedTele].floatValue
    avgDrivingAbility = json[SerializationKeys.avgDrivingAbility].floatValue
    allRotorsAbility = json[SerializationKeys.allRotorsAbility].floatValue
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.avgDrivingAbility] = avgDrivingAbility
    dictionary[SerializationKeys.RScoreDefense] = RScoreDefense
    dictionary[SerializationKeys.RScoreAgility] = RScoreAgility
    dictionary[SerializationKeys.RScoreDrivingAbility] = RScoreDrivingAbility
    dictionary[SerializationKeys.sdLiftoffAbility] = sdLiftoffAbility
    dictionary[SerializationKeys.incapacitatedPercentage] = incapacitatedPercentage
    dictionary[SerializationKeys.overallSecondPickAbility] = overallSecondPickAbility
    dictionary[SerializationKeys.avgHighShotsTele] = avgHighShotsTele
    dictionary[SerializationKeys.baselineReachedPercentage] = baselineReachedPercentage
    dictionary[SerializationKeys.avgGearsPlacedByLiftAuto] = avgGearsPlacedByLiftAuto
    dictionary[SerializationKeys.avgGearControl] = avgGearControl
    dictionary[SerializationKeys.actualSeed] = actualSeed
     dictionary[SerializationKeys.sdHighShotsTele] = sdHighShotsTele
   dictionary[SerializationKeys.liftoffPercentage] = liftoffPercentage
     dictionary[SerializationKeys.avgHighShotsAuto] = avgHighShotsAuto
    dictionary[SerializationKeys.avgAgility] = avgAgility
    dictionary[SerializationKeys.predictedSeed] = predictedSeed
    dictionary[SerializationKeys.avgGearsPlacedByLiftTele] = avgGearsPlacedByLiftTele
    dictionary[SerializationKeys.liftoffAbility] = liftoffAbility
    dictionary[SerializationKeys.sdGearsPlacedByLiftAuto] = sdGearsPlacedByLiftAuto
    dictionary[SerializationKeys.sdLowShotsAuto] = sdLowShotsAuto
    dictionary[SerializationKeys.avgKeyShotTime] = avgKeyShotTime
    dictionary[SerializationKeys.avgHopperShotTime] = avgHopperShotTime
    dictionary[SerializationKeys.sdLowShotsTele] = sdLowShotsTele
    dictionary[SerializationKeys.sdGearsPlacedByLiftTele] = sdGearsPlacedByLiftTele
    dictionary[SerializationKeys.avgDefense] = avgDefense
    dictionary[SerializationKeys.avgLowShotsTele] = avgLowShotsTele
    dictionary[SerializationKeys.sdHighShotsAuto] = sdHighShotsAuto
    dictionary[SerializationKeys.avgSpeed] = avgSpeed
    dictionary[SerializationKeys.RScoreSpeed] = RScoreSpeed
    dictionary[SerializationKeys.disabledPercentage] = disabledPercentage
    dictionary[SerializationKeys.avgLowShotsAuto] = avgLowShotsAuto
    dictionary[SerializationKeys.firstPickAbility] = firstPickAbility
    dictionary[SerializationKeys.avgBallControl] = avgBallControl
    dictionary[SerializationKeys.actualNumRPs] = actualNumRPs
    dictionary[SerializationKeys.predictedNumRPs] = predictedNumRPs
    dictionary[SerializationKeys.disfunctionalPercentage] = disfunctionalPercentage
    dictionary[SerializationKeys.sdBaselineReachedPercentage] = sdBaselineReachedPercentage
    dictionary[SerializationKeys.avgGearsPlacedByLiftAuto] = avgGearsPlacedByLiftAuto
    dictionary[SerializationKeys.avgGearsFumbledTele] = avgGearsFumbledTele
    dictionary[SerializationKeys.avgGearsEjectedTele] = avgGearsEjectedTele
    dictionary[SerializationKeys.avgGearGroundIntakesTele] = avgGearGroundIntakesTele
    dictionary[SerializationKeys.avgLoaderIntakesTele] = avgLoaderIntakesTele
    dictionary[SerializationKeys.avgHoppersOpenedTele] = avgHoppersOpenedTele
    dictionary[SerializationKeys.avgHoppersOpenedAuto] = avgHoppersOpenedAuto
    dictionary[SerializationKeys.firstPickAllRotorsTurningChance] = firstPickAllRotorsTurningChance
    dictionary[SerializationKeys.avgGearsPlacedAuto] = avgGearsPlacedAuto
    dictionary[SerializationKeys.sdGearsPlacedAuto] = sdGearsPlacedAuto
    dictionary[SerializationKeys.avgGearsPlacedTele] = avgGearsPlacedTele
    dictionary[SerializationKeys.sdGearsPlacedTele] = sdGearsPlacedTele
    dictionary[SerializationKeys.avgDrivingAbility] = avgDrivingAbility
    dictionary[SerializationKeys.allRotorsAbility] = allRotorsAbility

    return dictionary
  }

}
