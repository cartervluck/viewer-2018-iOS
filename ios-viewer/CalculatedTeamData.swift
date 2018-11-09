//
//  CalculatedTeamData.swift
//
//  Created by Carter Luck on 1/14/18
//  Copyright (c) . All rights reserved.
//

import Foundation
import SwiftyJSON

public final class CalculatedTeamData: NSObject, NSCoding {

  // MARK: Declaration for string constants to be used to decode and also serialize.
  private struct SerializationKeys {
    static let avgNumCubesFumbledAuto = "avgNumCubesFumbledAuto"
    static let avgNumHumanPortalIntakeTele = "avgNumHumanPortalIntakeTele"
    static let switchFailPercentageAuto = "switchFailPercentageAuto"
    static let avgNumElevatedPyramidIntakeAuto = "avgNumElevatedPyramidIntakeAuto"
    static let avgAllianceSwitchCubesTele = "avgAllianceSwitchCubesTele"
    static let avgOpponentSwitchCubesTele = "avgOpponentSwitchCubesTele"
    static let avgCubesPlacedInScaleTele = "avgCubesPlacedInScaleTele"
    static let avgAgility = "avgAgility"
    static let secondPickAbility = "secondPickAbility"
    static let avgNumGoodDecisions = "avgNumGoodDecisions"
    static let avgNumAlliancePlatformIntakeAuto = "avgNumAlliancePlatformIntakeAuto"
    static let avgNumReturnIntakeTele = "avgNumReturnIntakeTele"
    static let avgNumOpponentPlatformIntakeTele = "avgNumOpponentPlatformIntakeTele"
    static let avgNumBadDecisions = "avgNumBadDecisions"
    static let avgClimbTime = "avgClimbTime"
    static let predictedClimb = "predictedClimb"
    static let avgDrivingAbility = "avgDrivingAbility"
    static let avgNumExchangeInputTele = "avgNumExchangeInputTele"
    static let avgDefense = "avgDefense"
    static let avgCubesPlacedInScaleAuto = "avgCubesPlacedInScaleAuto"
    static let disabledPercentage = "disabledPercentage"
    static let predictedNumScaleCubesAuto = "predictedNumScaleCubesAuto"
    static let scaleFailPercentageTele = "scaleFailPercentageTele"
    static let incapacitatedPercentage = "incapacitatedPercentage"
    static let predictedNumAllianceSwitchCubesAuto = "predictedNumAllianceSwitchCubesAuto"
    static let autoRunPercentage = "autoRunPercentage"
    static let avgNumCubesFumbledTele = "avgNumCubesFumbledTele"
    static let scaleFailPercentageAuto = "scaleFailPercentageAuto"
    static let avgCubesSpilledAuto = "avgCubesSpilledAuto"
    static let avgCubesSpilledTele = "avgCubesSpilledTele"
    static let avgAllianceSwitchCubesAuto = "avgAllianceSwitchCubesAuto"
    static let avgOpponentSwitchCubesAuto = "avgOpponentSwitchCubesAuto"
    static let switchFailPercentageTele = "switchFailPercentageTele"
    static let avgNumAlliancePlatformIntakeTele = "avgNumAlliancePlatformIntakeTele"
    static let avgNumGroundIntakeTele = "avgNumGroundIntakeTele"
    static let climbPercentage = "climbPercentage"
    static let avgNumOpponentPlatformIntakeAuto = "avgNumOpponentPlatformIntakeAuto"
    static let canScoreBothSwitchSidesAuto = "canScoreBothSwitchSidesAuto"
    static let avgNumGroundPortalIntakeTele = "avgNumGroundPortalIntakeTele"
    static let avgNumElevatedPyramidIntakeTele = "avgNumElevatedPyramidIntakeTele"
    static let avgNumGroundPyramidIntakeTele = "avgNumGroundPyramidIntakeTele"
    static let numMatchesPlayed = "numMatchesPlayed"
    static let avgNumGroundPyramidIntakeAuto = "avgNumGroundPyramidIntakeAuto"
    static let avgSpeed = "avgSpeed"
    static let firstPickAbility = "firstPickAbility"
    static let actualSeed = "actualSeed"
    static let predictedSeed = "predictedSeed"
    static let predictedNumRPs = "predictedNumRPs"
    static let actualNumRPs = "actualNumRPs"
    static let dysfunctionalPercentage = "dysfunctionalPercentage"
    static let totalNumGoodDecisions = "totalNumGoodDecisions"
    static let totalNumBadDecisions = "totalNumBadDecisions"
    static let avgNumRobotsLifted = "avgNumRobotsLifted"
    static let avgTimeToOwnAllianceSwitchAuto = "avgTimeToOwnAllianceSwitchAuto"
    static let avgTimeToOwnScaleAuto = "avgTimeToOwnScaleAuto"
    static let parkPercentage = "parkPercentage"
    static let percentSuccessOppositeSwitchSideAuto = "percentSuccessOppositeSwitchSideAuto"
    static let allianceSwitchSuccessPercentageAuto = "allianceSwitchSuccessPercentageAuto"
    static let canPlaceHighLayerCube = "canPlaceHighLayerCube"
    static let pitAvgDriveTime = "pitAvgDriveTime"
    static let pitAvgRampTime = "pitAvgRampTime"
    static let avgTotalCubesPlaced = "avgTotalCubesPlaced"
    static let avgSwitchOwnership = "avgSwitchOwnership"
    static let avgScaleCubesBy100s = "avgScaleCubesBy100s"
    static let avgScaleCubesBy110s = "avgScaleCubesBy110s"
    static let avgAllVaultTime = "avgAllVaultTime"
    static let RScoreAgility = "RScoreAgility"
    static let RScoreDefense = "RScoreDefense"
    static let RScoreDrivingAbility = "RScoreDrivingAbility"
    static let RScoreSpeed = "RScoreSpeed"
    //MARK
    static let avgNumCubesPlacedAuto = "avgNumCubesPlacedAuto"
    static let avgNumCubesPlacedTele = "avgNumCubesPlacedTele"
    static let avgScaleTimeAuto = "avgScaleTimeAuto"
    static let avgScaleTimeTele = "avgScaleTimeTele"
    static let avgAllianceSwitchTimeAuto = "avgAllianceSwitchTimeAuto"
    static let avgAllianceSwitchTimeTele = "avgAllianceSwitchTimeTele"
    static let avgOpponentSwitchTimeTele = "avgOpponentSwitchTimeTele"
    static let totalNumParks = "totalNumParks"
    static let totalNumRobotsLifted = "totalNumRobotsLifted"
    static let totalNumRobotLiftAttempts = "totalNumRobotLiftAttempts"
    static let totalNumRobotsGroundLifted = "totalNumRobotsGroundLifted"
    static let totalNumRobotGroundLiftAttempts = "totalNumRobotGroundLiftAttempts"
    static let totalNumHighLayerScaleCubes = "totalNumHighLayerScaleCubes"
    static let totalSuperNotes = "totalSuperNotes"
    static let numSuccessfulClimbs = "numSuccessfulClimbs"
    static let soloClimbPercentage = "soloClimbPercentage"
    static let activeAssistClimbPercentage = "activeAssistClimbPercentage"
    static let activeLiftClimbPercentage = "activeLiftClimbPercentage"
    static let activeNoClimbLiftClimbPercentage = "activeNoClimbLiftClimbPercentage"
    static let assistedClimbPercentage = "assistedClimbPercentage"
    static let predictedPark = "predictedPark"
    static let predictedTotalNumRPs = "predictedTotalNumRPs"
    static let totalNumRPs = "totalNumRPs"
    static let allianceSwitchSuccessPercentageTele = "allianceSwitchSuccessPercentageTele"
    static let opponentSwitchSuccessPercentageTele = "opponentSwitchSuccessPercentageTele"
    static let scaleSuccessPercentageAuto = "scaleSuccessPercentageAuto"
    static let scaleSuccessPercentageTele = "scaleSuccessPercentageTele"
    static let allianceSwitchFailPercentageAuto = "allianceSwitchFailPercentageAuto"
    static let allianceSwitchFailPercentageTele = "allianceSwitchFailPercentageTele"
    static let opponentSwitchFailPercentageTele = "opponentSwitchFailPercentageTele"
    static let didThreeExchangeInputPercentage = "didThreeExchangeInputPercentage"
    static let canGroundIntake = "canGroundIntake"
    static let teleopExchangeAbility = "teleopExchangeAbility"
    static let teleopScaleAbility = "teleopScaleAbility"
    static let teleopAllianceSwitchAbility = "teleopAllianceSwitchAbility"
    static let teleopOpponentSwitchAbility = "teleopOpponentSwitchAbility"
    static let maxScaleCubes = "maxScaleCubes"
    static let maxExchangeCubes = "maxExchangeCubes"
    static let avgAllianceSwitchCycleTimeAuto = "avgAllianceSwitchCycleTimeAuto"
    static let avgAllianceSwitchCycleTimeTele = "avgAllianceSwitchCycleTimeTele"
    static let avgOpponentSwitchCycleTimeTele = "avgOpponentSwitchCycleTimeTele"
    static let avgScaleCycleTimeAuto = "avgScaleCycleTimeAuto"
    static let avgScaleCycleTimeTele = "avgScaleCycleTimeTele"
    static let avgExchangeCycleTime = "avgExchangeCycleTime"
    static let avgNumCubesDroppedAuto = "avgNumCubesDroppedAuto"
    static let avgNumCubesDroppedTele = "avgNumCubesDroppedTele"
    static let lfmAvgNumRobotsLifted = "lfmAvgNumRobotsLifted"
    static let lfmAvgNumCubesPlacedAuto = "lfmAvgNumCubesPlacedAuto"
    static let lfmAvgNumCubesPlacedTele = "lfmAvgNumCubesPlacedTele"
    static let lfmAvgNumCubesDroppedAuto = "lfmAvgNumCubesDroppedAuto"
    static let lfmAvgNumCubesDroppedTele = "lfmAvgNumCubesDroppedTele"
    static let lfmAvgNumExchangeInputTele = "lfmAvgNumExchangeInputTele"
    static let lfmAvgNumGoodDecisions = "lfmAvgNumGoodDecisions"
    static let lfmAvgNumBadDecisions = "lfmAvgNumBadDecisions"
    static let lfmAvgCubesSpilledAuto = "lfmAvgCubesSpilledAuto"
    static let lfmAvgCubesSpilledTele = "lfmAvgCubesSpilledTele"
    static let lfmAvgCubesPlacedInScaleAuto = "lfmAvgCubesPlacedInScaleAuto"
    static let lfmAvgCubesPlacedInScaleTele = "lfmAvgCubesPlacedInScaleTele"
    static let lfmAvgAllianceSwitchCubesAuto = "lfmAvgAllianceSwitchCubesAuto"
    static let lfmAvgAllianceSwitchCubesTele = "lfmAvgAllianceSwitchCubesTele"
    static let lfmAvgOpponentSwitchCubesTele = "lfmAvgOpponentSwitchCubesTele"
    static let lfmAvgSpeed = "lfmAvgSpeed"
    static let lfmAvgDefense = "lfmAvgDefense"
    static let lfmAvgAgility = "lfmAvgAgility"
    static let lfmAvgDrivingAbility = "lfmAvgDrivingAbility"
 }

  // MARK: Properties
  @objc public var avgNumCubesFumbledAuto: Float = -1.0
  @objc public var avgNumHumanPortalIntakeTele: Float = -1.0
  @objc public var switchFailPercentageAuto: Float = -1.0
  @objc public var avgNumElevatedPyramidIntakeAuto: Float = -1.0
  @objc public var avgOpponentSwitchCubesAuto: Float = -1.0
  @objc public var avgOpponentSwitchCubesTele: Float = -1.0
  @objc public var avgAllianceSwitchCubesAuto: Float = -1.0
  @objc public var avgAllianceSwitchCubesTele: Float = -1.0
  @objc public var avgAgility: Float = -1.0
  @objc public var secondPickAbility: Float = -1.0
  @objc public var avgNumGoodDecisions: Float = -1.0
  @objc public var avgNumAlliancePlatformIntakeAuto: Float = -1.0
  @objc public var avgNumReturnIntakeTele: Float = -1.0
  @objc public var avgNumOpponentPlatformIntakeTele: Float = -1.0
  @objc public var avgNumBadDecisions: Float = -1.0
  @objc public var avgClimbTime: Float = -1.0
  @objc public var predictedClimb: Float = -1.0
  @objc public var avgDrivingAbility: Float = -1.0
  @objc public var avgNumExchangeInputTele: Float = -1.0
  @objc public var avgDefense: Float = -1.0
  @objc public var avgCubesPlacedInScaleAuto: Float = -1.0
  @objc public var disabledPercentage: Float = -1.0
  @objc public var predictedNumScaleCubesAuto: Float = -1.0
  @objc public var scaleFailPercentageTele: Float = -1.0
  @objc public var incapacitatedPercentage: Float = -1.0
  @objc public var predictedNumAllianceSwitchCubesAuto: Float = -1.0
  @objc public var autoRunPercentage: Float = -1.0
  @objc public var avgNumCubesFumbledTele: Float = -1.0
  @objc public var scaleFailPercentageAuto: Float = -1.0
  @objc public var avgCubesSpilledAuto: Float = -1.0
  @objc public var avgCubesSpilledTele: Float = -1.0
  @objc public var switchFailPercentageTele: Float = -1.0
  @objc public var avgNumAlliancePlatformIntakeTele: Float = -1.0
  @objc public var avgNumGroundIntakeTele: Float = -1.0
  @objc public var climbPercentage: Float = -1.0
  @objc public var avgNumOpponentPlatformIntakeAuto: Float = -1.0
  @objc public var canScoreBothSwitchSidesAuto: Bool = false
  @objc public var avgNumGroundPortalIntakeTele: Float = -1.0
  @objc public var avgNumElevatedPyramidIntakeTele: Float = -1.0
  @objc public var avgNumGroundPyramidIntakeTele: Float = -1.0
  public var numMatchesPlayed: Int?
  @objc public var avgNumGroundPyramidIntakeAuto: Float = -1.0
  @objc public var avgSpeed: Float = -1.0
  @objc public var firstPickAbility: Float = -1.0
    @objc public var actualSeed: Int = -1
    @objc public var predictedSeed: Int = -1
    @objc public var predictedNumRPs: Float = 1.0
    @objc public var actualNumRPs: Float = -1.0
    @objc public var dysfunctionalPercentage: Float = -1.0
    @objc public var avgCubesPlacedInScaleTele: Float = -1.0
    @objc public var totalNumGoodDecisions: Int = -1
    @objc public var totalNumBadDecisions: Int = -1
    @objc public var avgNumRobotsLifted: Float = -1.0
    @objc public var avgTimeToOwnAllianceSwitchAuto: Float = -1.0
    @objc public var avgTimeToOwnScaleAuto: Float = -1.0
    @objc public var parkPercentage: Float = -1.0
    @objc public var percentSuccessOppositeSwitchSideAuto: Float = -1.0
    @objc public var allianceSwitchSuccessPercentageAuto: Float = -1.0
    @objc public var canPlaceHighLayerCube: Bool = false
    @objc public var pitAvgDriveTime: Float = -1.0
    @objc public var pitAvgRampTime: Float = -1.0
    @objc public var avgTotalCubesPlaced: Float = -1.0
    @objc public var avgSwitchOwnership: Int = -1
    @objc public var avgScaleCubesBy100s: Float = -1.0
    @objc public var avgScaleCubesBy110s: Float = -1.0
    @objc public var avgAllVaultTime: Float = -1.0
    @objc public var RScoreAgility: Float = -1.0
    @objc public var RScoreDefense: Float = -1.0
    @objc public var RScoreDrivingAbility: Float = -1.0
    @objc public var RScoreSpeed: Float = -1.0
    @objc public var avgNumCubesPlacedAuto: Float = -1.0
    @objc public var avgNumCubesPlacedTele: Float = -1.0
    @objc public var avgScaleTimeAuto: Float = -1.0
    @objc public var avgScaleTimeTele: Float = -1.0
    @objc public var avgAllianceSwitchTimeAuto: Float = -1.0
    @objc public var avgAllianceSwitchTimeTele: Float = -1.0
    @objc public var avgOpponentSwitchTimeTele: Float = -1.0
    @objc public var totalNumParks: Int = -1
    @objc public var totalNumRobotsLifted: Int = -1
    @objc public var totalNumRobotLiftAttempts: Int = -1
    @objc public var totalNumRobotsGroundLifted: Int = -1
    @objc public var totalNumRobotGroundLiftAttempts: Int = -1
    @objc public var totalNumHighLayerScaleCubes: Int = -1
    @objc public var totalSuperNotes: String = "-1"
    @objc public var numSuccessfulClimbs: Int = -1
    @objc public var soloClimbPercentage: Float = -1.0
    @objc public var activeAssistClimbPercentage: Float = -1.0
    @objc public var activeLiftClimbPercentage: Float = -1.0
    @objc public var activeNoClimbLiftClimbPercentage: Float = -1.0
    @objc public var assistedClimbPercentage: Float = -1.0
    @objc public var predictedPark: Float = -1.0
    @objc public var predictedTotalNumRPs: Int = -1
    @objc public var totalNumRPs: Int = -1
    @objc public var allianceSwitchSuccessPercentageTele: Float = -1.0
    @objc public var opponentSwitchSuccessPercentageTele: Float = -1.0
    @objc public var scaleSuccessPercentageAuto: Float = -1.0
    @objc public var scaleSuccessPercentageTele: Float = -1.0
    @objc public var allianceSwitchFailPercentageAuto: Float = -1.0
    @objc public var allianceSwitchFailPercentageTele: Float = -1.0
    @objc public var opponentSwitchFailPercentageTele: Float = -1.0
    @objc public var didThreeExchangeInputPercentage: Float = -1.0
    @objc public var canGroundIntake: Float = -1.0
    @objc public var teleopExchangeAbility: Float = -1.0
    @objc public var teleopScaleAbility: Float = -1.0
    @objc public var teleopAllianceSwitchAbility: Float = -1.0
    @objc public var teleopOpponentSwitchAbility: Float = -1.0
    @objc public var maxScaleCubes: Int = -1
    @objc public var maxExchangeCubes: Int = -1
    @objc public var avgAllianceSwitchCycleTimeAuto: Float = -1.0
    @objc public var avgAllianceSwitchCycleTimeTele: Float = -1.0
    @objc public var avgOpponentSwitchCycleTimeTele: Float = -1.0
    @objc public var avgScaleCycleTimeAuto: Float = -1.0
    @objc public var avgScaleCycleTimeTele: Float = -1.0
    @objc public var avgExchangeCycleTime: Float = -1.0
    @objc public var avgNumCubesDroppedAuto: Float = -1.0
    @objc public var avgNumCubesDroppedTele: Float = -1.0
    @objc public var lfmAvgNumRobotsLifted: Float = -1.0
    @objc public var lfmAvgNumCubesPlacedAuto: Float = -1.0
    @objc public var lfmAvgNumCubesPlacedTele: Float = -1.0
    @objc public var lfmAvgNumCubesDroppedAuto: Float = -1.0
    @objc public var lfmAvgNumCubesDroppedTele: Float = -1.0
    @objc public var lfmAvgNumExchangeInputTele: Float = -1.0
    @objc public var lfmAvgNumGoodDecisions: Float = -1.0
    @objc public var lfmAvgNumBadDecisions: Float = -1.0
    @objc public var lfmAvgCubesSpilledAuto: Float = -1.0
    @objc public var lfmAvgCubesSpilledTele: Float = -1.0
    @objc public var lfmAvgCubesPlacedInScaleAuto: Float = -1.0
    @objc public var lfmAvgCubesPlacedInScaleTele: Float = -1.0
    @objc public var lfmAvgAllianceSwitchCubesAuto: Float = -1.0
    @objc public var lfmAvgAllianceSwitchCubesTele: Float = -1.0
    @objc public var lfmAvgOpponentSwitchCubesTele: Float = -1.0
    @objc public var lfmAvgSpeed: Float = -1.0
    @objc public var lfmAvgDefense: Float = -1.0
    @objc public var lfmAvgAgility: Float = -1.0
    @objc public var lfmAvgDrivingAbility: Float = -1.0

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
    avgNumCubesFumbledAuto = json[SerializationKeys.avgNumCubesFumbledAuto].floatValue
    avgNumHumanPortalIntakeTele = json[SerializationKeys.avgNumHumanPortalIntakeTele].floatValue
    switchFailPercentageAuto = json[SerializationKeys.switchFailPercentageAuto].floatValue
    avgNumElevatedPyramidIntakeAuto = json[SerializationKeys.avgNumElevatedPyramidIntakeAuto].floatValue
    avgAllianceSwitchCubesAuto = json[SerializationKeys.avgAllianceSwitchCubesAuto].floatValue
    avgAllianceSwitchCubesTele = json[SerializationKeys.avgAllianceSwitchCubesTele].floatValue
    avgOpponentSwitchCubesAuto = json[SerializationKeys.avgOpponentSwitchCubesAuto].floatValue
    avgOpponentSwitchCubesTele = json[SerializationKeys.avgOpponentSwitchCubesTele].floatValue
    avgAgility = json[SerializationKeys.avgAgility].floatValue
    secondPickAbility = json[SerializationKeys.secondPickAbility].floatValue
    avgNumGoodDecisions = json[SerializationKeys.avgNumGoodDecisions].floatValue
    avgNumAlliancePlatformIntakeAuto = json[SerializationKeys.avgNumAlliancePlatformIntakeAuto].floatValue
    avgNumReturnIntakeTele = json[SerializationKeys.avgNumReturnIntakeTele].floatValue
    avgNumOpponentPlatformIntakeTele = json[SerializationKeys.avgNumOpponentPlatformIntakeTele].floatValue
    avgNumBadDecisions = json[SerializationKeys.avgNumBadDecisions].floatValue
    avgClimbTime = json[SerializationKeys.avgClimbTime].floatValue
    predictedClimb = json[SerializationKeys.predictedClimb].floatValue
    avgDrivingAbility = json[SerializationKeys.avgDrivingAbility].floatValue
    avgNumExchangeInputTele = json[SerializationKeys.avgNumExchangeInputTele].floatValue
    avgDefense = json[SerializationKeys.avgDefense].floatValue
    avgCubesPlacedInScaleAuto = json[SerializationKeys.avgCubesPlacedInScaleAuto].floatValue
    disabledPercentage = json[SerializationKeys.disabledPercentage].floatValue
    predictedNumScaleCubesAuto = json[SerializationKeys.predictedNumScaleCubesAuto].floatValue
    scaleFailPercentageTele = json[SerializationKeys.scaleFailPercentageTele].floatValue
    incapacitatedPercentage = json[SerializationKeys.incapacitatedPercentage].floatValue
    predictedNumAllianceSwitchCubesAuto = json[SerializationKeys.predictedNumAllianceSwitchCubesAuto].floatValue
    autoRunPercentage = json[SerializationKeys.autoRunPercentage].floatValue
    avgNumCubesFumbledTele = json[SerializationKeys.avgNumCubesFumbledTele].floatValue
    scaleFailPercentageAuto = json[SerializationKeys.scaleFailPercentageAuto].floatValue
    avgCubesSpilledAuto = json[SerializationKeys.avgCubesSpilledAuto].floatValue
    avgCubesSpilledTele = json[SerializationKeys.avgCubesSpilledTele].floatValue
    avgAllianceSwitchCubesTele = json[SerializationKeys.avgAllianceSwitchCubesTele].floatValue
    avgAllianceSwitchCubesAuto = json[SerializationKeys.avgAllianceSwitchCubesAuto].floatValue
    avgOpponentSwitchCubesTele = json[SerializationKeys.avgOpponentSwitchCubesTele].floatValue
    avgOpponentSwitchCubesAuto = json[SerializationKeys.avgOpponentSwitchCubesAuto].floatValue
    switchFailPercentageTele = json[SerializationKeys.switchFailPercentageTele].floatValue
    avgNumAlliancePlatformIntakeTele = json[SerializationKeys.avgNumAlliancePlatformIntakeTele].floatValue
    avgNumGroundIntakeTele = json[SerializationKeys.avgNumGroundIntakeTele].floatValue
    climbPercentage = json[SerializationKeys.climbPercentage].floatValue
    avgNumOpponentPlatformIntakeAuto = json[SerializationKeys.avgNumOpponentPlatformIntakeAuto].floatValue
    canScoreBothSwitchSidesAuto = json[SerializationKeys.canScoreBothSwitchSidesAuto].boolValue
    avgNumGroundPortalIntakeTele = json[SerializationKeys.avgNumGroundPortalIntakeTele].floatValue
    avgNumElevatedPyramidIntakeTele = json[SerializationKeys.avgNumElevatedPyramidIntakeTele].floatValue
    avgNumGroundPyramidIntakeTele = json[SerializationKeys.avgNumGroundPyramidIntakeTele].floatValue
    numMatchesPlayed = json[SerializationKeys.numMatchesPlayed].int
    avgNumGroundPyramidIntakeAuto = json[SerializationKeys.avgNumGroundPyramidIntakeAuto].floatValue
    avgSpeed = json[SerializationKeys.avgSpeed].floatValue
    firstPickAbility = json[SerializationKeys.firstPickAbility].floatValue
    actualSeed = json[SerializationKeys.actualSeed].intValue
    predictedSeed = json[SerializationKeys.predictedSeed].intValue
    predictedNumRPs = json[SerializationKeys.predictedNumRPs].floatValue
    actualNumRPs = json[SerializationKeys.actualNumRPs].floatValue
    dysfunctionalPercentage = json[SerializationKeys.dysfunctionalPercentage].floatValue
    avgCubesPlacedInScaleTele = json[SerializationKeys.avgCubesPlacedInScaleTele].floatValue
    totalNumGoodDecisions = json[SerializationKeys.totalNumGoodDecisions].intValue
    totalNumBadDecisions = json[SerializationKeys.totalNumBadDecisions].intValue
    avgNumRobotsLifted = json[SerializationKeys.avgNumRobotsLifted].floatValue
    avgTimeToOwnAllianceSwitchAuto = json[SerializationKeys.avgTimeToOwnAllianceSwitchAuto].floatValue
    avgTimeToOwnScaleAuto = json[SerializationKeys.avgTimeToOwnScaleAuto].floatValue
    parkPercentage = json[SerializationKeys.parkPercentage].floatValue
    percentSuccessOppositeSwitchSideAuto = json[SerializationKeys.percentSuccessOppositeSwitchSideAuto].floatValue
    allianceSwitchSuccessPercentageAuto = json[SerializationKeys.allianceSwitchSuccessPercentageAuto].floatValue
    canPlaceHighLayerCube = json[SerializationKeys.canPlaceHighLayerCube].boolValue
    pitAvgDriveTime = json[SerializationKeys.pitAvgDriveTime].floatValue
    pitAvgRampTime = json[SerializationKeys.pitAvgRampTime].floatValue
    avgTotalCubesPlaced = json[SerializationKeys.avgTotalCubesPlaced].floatValue
    avgSwitchOwnership = json[SerializationKeys.avgSwitchOwnership].intValue
    avgScaleCubesBy100s = json[SerializationKeys.avgScaleCubesBy100s].floatValue
    avgScaleCubesBy110s = json[SerializationKeys.avgScaleCubesBy110s].floatValue
    avgAllVaultTime = json[SerializationKeys.avgAllVaultTime].floatValue
    RScoreAgility = json[SerializationKeys.RScoreAgility].floatValue
    RScoreDefense = json[SerializationKeys.RScoreDefense].floatValue
    RScoreDrivingAbility = json[SerializationKeys.RScoreDrivingAbility].floatValue
    RScoreSpeed = json[SerializationKeys.RScoreSpeed].floatValue
       avgNumCubesPlacedAuto = json[SerializationKeys.avgNumCubesPlacedAuto].floatValue
       avgNumCubesPlacedTele = json[SerializationKeys.avgNumCubesPlacedTele].floatValue
       avgScaleTimeAuto = json[SerializationKeys.avgScaleTimeAuto].floatValue
       avgScaleTimeTele = json[SerializationKeys.avgScaleTimeTele].floatValue
       avgAllianceSwitchTimeAuto = json[SerializationKeys.avgAllianceSwitchTimeAuto].floatValue
       avgAllianceSwitchTimeTele = json[SerializationKeys.avgAllianceSwitchTimeTele].floatValue
       avgOpponentSwitchTimeTele = json[SerializationKeys.avgOpponentSwitchTimeTele].floatValue
       totalNumParks = json[SerializationKeys.totalNumParks].intValue
       totalNumRobotsLifted = json[SerializationKeys.totalNumRobotsLifted].intValue
       totalNumRobotLiftAttempts = json[SerializationKeys.totalNumRobotLiftAttempts].intValue
       totalNumRobotsGroundLifted = json[SerializationKeys.totalNumRobotsGroundLifted].intValue
       totalNumRobotGroundLiftAttempts = json[SerializationKeys.totalNumRobotGroundLiftAttempts].intValue
       totalNumHighLayerScaleCubes = json[SerializationKeys.totalNumHighLayerScaleCubes].intValue
       totalSuperNotes = json[SerializationKeys.totalSuperNotes].stringValue
       numSuccessfulClimbs = json[SerializationKeys.numSuccessfulClimbs].intValue
       soloClimbPercentage = json[SerializationKeys.soloClimbPercentage].floatValue
       activeAssistClimbPercentage = json[SerializationKeys.activeAssistClimbPercentage].floatValue
       activeLiftClimbPercentage = json[SerializationKeys.activeLiftClimbPercentage].floatValue
       activeNoClimbLiftClimbPercentage = json[SerializationKeys.activeNoClimbLiftClimbPercentage].floatValue
       assistedClimbPercentage = json[SerializationKeys.assistedClimbPercentage].floatValue
       predictedPark = json[SerializationKeys.predictedPark].floatValue
       predictedTotalNumRPs = json[SerializationKeys.predictedTotalNumRPs].intValue
       totalNumRPs = json[SerializationKeys.totalNumRPs].intValue
       allianceSwitchSuccessPercentageTele = json[SerializationKeys.allianceSwitchSuccessPercentageTele].floatValue
       opponentSwitchSuccessPercentageTele = json[SerializationKeys.opponentSwitchSuccessPercentageTele].floatValue
       scaleSuccessPercentageAuto = json[SerializationKeys.scaleSuccessPercentageAuto].floatValue
       scaleSuccessPercentageTele = json[SerializationKeys.scaleSuccessPercentageTele].floatValue
       allianceSwitchFailPercentageAuto = json[SerializationKeys.allianceSwitchFailPercentageAuto].floatValue
       allianceSwitchFailPercentageTele = json[SerializationKeys.allianceSwitchFailPercentageTele].floatValue
       opponentSwitchFailPercentageTele = json[SerializationKeys.opponentSwitchFailPercentageTele].floatValue
       didThreeExchangeInputPercentage = json[SerializationKeys.didThreeExchangeInputPercentage].floatValue
       canGroundIntake = json[SerializationKeys.canGroundIntake].floatValue
       teleopExchangeAbility = json[SerializationKeys.teleopExchangeAbility].floatValue
       teleopScaleAbility = json[SerializationKeys.teleopScaleAbility].floatValue
       teleopAllianceSwitchAbility = json[SerializationKeys.teleopAllianceSwitchAbility].floatValue
       teleopOpponentSwitchAbility = json[SerializationKeys.teleopOpponentSwitchAbility].floatValue
       maxScaleCubes = json[SerializationKeys.maxScaleCubes].intValue
       maxExchangeCubes = json[SerializationKeys.maxExchangeCubes].intValue
    avgAllianceSwitchCycleTimeAuto = json[SerializationKeys.avgAllianceSwitchCycleTimeAuto].floatValue
    avgAllianceSwitchCycleTimeTele = json[SerializationKeys.avgAllianceSwitchCycleTimeTele].floatValue
    avgOpponentSwitchCycleTimeTele = json[SerializationKeys.avgOpponentSwitchCycleTimeTele].floatValue
    avgScaleCycleTimeAuto = json[SerializationKeys.avgScaleCycleTimeAuto].floatValue
    avgScaleCycleTimeTele = json[SerializationKeys.avgScaleCycleTimeTele].floatValue
    avgExchangeCycleTime = json[SerializationKeys.avgExchangeCycleTime].floatValue
    avgNumCubesDroppedAuto = json[SerializationKeys.avgNumCubesDroppedAuto].floatValue
    avgNumCubesDroppedTele = json[SerializationKeys.avgNumCubesDroppedTele].floatValue
    lfmAvgNumRobotsLifted = json[SerializationKeys.lfmAvgNumRobotsLifted].floatValue
    lfmAvgNumCubesPlacedAuto = json[SerializationKeys.lfmAvgNumCubesPlacedAuto].floatValue
    lfmAvgNumCubesPlacedTele = json[SerializationKeys.lfmAvgNumCubesPlacedTele].floatValue
    lfmAvgNumCubesDroppedAuto = json[SerializationKeys.lfmAvgNumCubesDroppedAuto].floatValue
    lfmAvgNumCubesDroppedTele = json[SerializationKeys.lfmAvgNumCubesDroppedTele].floatValue
    lfmAvgNumExchangeInputTele = json[SerializationKeys.lfmAvgNumExchangeInputTele].floatValue
    lfmAvgNumGoodDecisions = json[SerializationKeys.lfmAvgNumGoodDecisions].floatValue
    lfmAvgNumBadDecisions = json[SerializationKeys.lfmAvgNumBadDecisions].floatValue
    lfmAvgCubesSpilledAuto = json[SerializationKeys.lfmAvgCubesSpilledAuto].floatValue
    lfmAvgCubesSpilledTele = json[SerializationKeys.lfmAvgCubesSpilledTele].floatValue
    lfmAvgCubesPlacedInScaleAuto = json[SerializationKeys.lfmAvgCubesPlacedInScaleAuto].floatValue
    lfmAvgCubesPlacedInScaleTele = json[SerializationKeys.lfmAvgCubesPlacedInScaleTele].floatValue
    lfmAvgAllianceSwitchCubesAuto = json[SerializationKeys.lfmAvgAllianceSwitchCubesAuto].floatValue
    lfmAvgAllianceSwitchCubesTele = json[SerializationKeys.lfmAvgAllianceSwitchCubesTele].floatValue
    lfmAvgOpponentSwitchCubesTele = json[SerializationKeys.lfmAvgOpponentSwitchCubesTele].floatValue
    lfmAvgSpeed = json[SerializationKeys.lfmAvgSpeed].floatValue
    lfmAvgDefense = json[SerializationKeys.lfmAvgDefense].floatValue
    lfmAvgAgility = json[SerializationKeys.lfmAvgAgility].floatValue
    lfmAvgDrivingAbility = json[SerializationKeys.lfmAvgDrivingAbility].floatValue
  }

  /// Generates description of the object in the form of a NSDictionary.
  ///
  /// - returns: A Key value pair containing all valid values in the object.
  public func dictionaryRepresentation() -> [String: Any] {
    var dictionary: [String: Any] = [:]
    dictionary[SerializationKeys.avgNumCubesFumbledAuto] = avgNumCubesFumbledAuto
    dictionary[SerializationKeys.avgNumHumanPortalIntakeTele] = avgNumHumanPortalIntakeTele
    dictionary[SerializationKeys.switchFailPercentageAuto] = switchFailPercentageAuto
    dictionary[SerializationKeys.avgNumElevatedPyramidIntakeAuto] = avgNumElevatedPyramidIntakeAuto
    dictionary[SerializationKeys.avgAllianceSwitchCubesTele] = avgAllianceSwitchCubesTele
    dictionary[SerializationKeys.avgAllianceSwitchCubesAuto] = avgAllianceSwitchCubesAuto
    dictionary[SerializationKeys.avgOpponentSwitchCubesTele] = avgOpponentSwitchCubesTele
    dictionary[SerializationKeys.avgOpponentSwitchCubesTele] = avgOpponentSwitchCubesAuto
    dictionary[SerializationKeys.avgAgility] = avgAgility
    dictionary[SerializationKeys.secondPickAbility] = secondPickAbility
    dictionary[SerializationKeys.avgNumGoodDecisions] = avgNumGoodDecisions
    dictionary[SerializationKeys.avgNumAlliancePlatformIntakeAuto] = avgNumAlliancePlatformIntakeAuto
    dictionary[SerializationKeys.avgNumReturnIntakeTele] = avgNumReturnIntakeTele
    dictionary[SerializationKeys.avgNumOpponentPlatformIntakeTele] = avgNumOpponentPlatformIntakeTele
    dictionary[SerializationKeys.avgNumBadDecisions] = avgNumBadDecisions
    dictionary[SerializationKeys.avgClimbTime] = avgClimbTime
    dictionary[SerializationKeys.predictedClimb] = predictedClimb
    dictionary[SerializationKeys.avgDrivingAbility] = avgDrivingAbility
    dictionary[SerializationKeys.avgNumExchangeInputTele] = avgNumExchangeInputTele
    dictionary[SerializationKeys.avgDefense] = avgDefense
    dictionary[SerializationKeys.avgCubesPlacedInScaleAuto] = avgCubesPlacedInScaleAuto
    dictionary[SerializationKeys.disabledPercentage] = disabledPercentage
    dictionary[SerializationKeys.predictedNumScaleCubesAuto] = predictedNumScaleCubesAuto
    dictionary[SerializationKeys.scaleFailPercentageTele] = scaleFailPercentageTele
    dictionary[SerializationKeys.incapacitatedPercentage] = incapacitatedPercentage
    dictionary[SerializationKeys.predictedNumAllianceSwitchCubesAuto] = predictedNumAllianceSwitchCubesAuto
    dictionary[SerializationKeys.autoRunPercentage] = autoRunPercentage
    dictionary[SerializationKeys.avgNumCubesFumbledTele] = avgNumCubesFumbledTele
    dictionary[SerializationKeys.scaleFailPercentageAuto] = scaleFailPercentageAuto
    dictionary[SerializationKeys.avgCubesSpilledAuto] = avgCubesSpilledAuto
    dictionary[SerializationKeys.avgCubesSpilledTele] = avgCubesSpilledTele
    dictionary[SerializationKeys.switchFailPercentageTele] = switchFailPercentageTele
    dictionary[SerializationKeys.avgNumAlliancePlatformIntakeTele] = avgNumAlliancePlatformIntakeTele
    dictionary[SerializationKeys.avgNumGroundIntakeTele] = avgNumGroundIntakeTele
    dictionary[SerializationKeys.climbPercentage] = climbPercentage
    dictionary[SerializationKeys.avgNumOpponentPlatformIntakeAuto] = avgNumOpponentPlatformIntakeAuto
    dictionary[SerializationKeys.canScoreBothSwitchSidesAuto] = canScoreBothSwitchSidesAuto
    dictionary[SerializationKeys.avgNumGroundPortalIntakeTele] = avgNumGroundPortalIntakeTele
    dictionary[SerializationKeys.avgNumElevatedPyramidIntakeAuto] = avgNumElevatedPyramidIntakeAuto
    dictionary[SerializationKeys.avgNumElevatedPyramidIntakeTele] = avgNumElevatedPyramidIntakeTele
    dictionary[SerializationKeys.avgNumGroundPyramidIntakeTele] = avgNumGroundPyramidIntakeTele
    if let value = numMatchesPlayed { dictionary[SerializationKeys.numMatchesPlayed] = value }
    dictionary[SerializationKeys.avgNumGroundPyramidIntakeAuto] = avgNumGroundPyramidIntakeAuto

    dictionary[SerializationKeys.avgSpeed] = avgSpeed
    dictionary[SerializationKeys.firstPickAbility] = firstPickAbility
    dictionary[SerializationKeys.actualSeed] = actualSeed
    dictionary[SerializationKeys.predictedSeed] = predictedSeed
    dictionary[SerializationKeys.predictedNumRPs] = predictedNumRPs
    dictionary[SerializationKeys.actualNumRPs] = actualNumRPs
    dictionary[SerializationKeys.dysfunctionalPercentage] = dysfunctionalPercentage
    dictionary[SerializationKeys.avgCubesPlacedInScaleTele] = avgCubesPlacedInScaleTele
    dictionary[SerializationKeys.totalNumGoodDecisions] = totalNumGoodDecisions
    dictionary[SerializationKeys.totalNumBadDecisions] = totalNumBadDecisions
    dictionary[SerializationKeys.avgNumRobotsLifted] = avgNumRobotsLifted
    dictionary[SerializationKeys.avgTimeToOwnAllianceSwitchAuto] = avgTimeToOwnAllianceSwitchAuto
    dictionary[SerializationKeys.avgTimeToOwnScaleAuto] = avgTimeToOwnScaleAuto
    dictionary[SerializationKeys.parkPercentage] = parkPercentage
    dictionary[SerializationKeys.percentSuccessOppositeSwitchSideAuto] = percentSuccessOppositeSwitchSideAuto
    dictionary[SerializationKeys.allianceSwitchSuccessPercentageAuto] = allianceSwitchSuccessPercentageAuto
    dictionary[SerializationKeys.canPlaceHighLayerCube] = canPlaceHighLayerCube
    dictionary[SerializationKeys.pitAvgDriveTime] = pitAvgDriveTime
    dictionary[SerializationKeys.pitAvgRampTime] = pitAvgRampTime
    dictionary[SerializationKeys.avgTotalCubesPlaced] = avgTotalCubesPlaced
    dictionary[SerializationKeys.avgSwitchOwnership] = avgSwitchOwnership
    dictionary[SerializationKeys.avgScaleCubesBy100s] = avgScaleCubesBy100s
    dictionary[SerializationKeys.avgScaleCubesBy110s] = avgScaleCubesBy110s
    dictionary[SerializationKeys.avgAllVaultTime] = avgAllVaultTime
    dictionary[SerializationKeys.RScoreAgility] = RScoreAgility
    dictionary[SerializationKeys.RScoreDefense] = RScoreDefense
    dictionary[SerializationKeys.RScoreDrivingAbility] = RScoreDrivingAbility
    dictionary[SerializationKeys.RScoreSpeed] = RScoreSpeed
    dictionary[SerializationKeys.avgNumCubesPlacedAuto] = avgNumCubesPlacedAuto
        dictionary[SerializationKeys.avgNumCubesPlacedTele] = avgNumCubesPlacedTele
        dictionary[SerializationKeys.avgScaleTimeAuto] = avgScaleTimeAuto
        dictionary[SerializationKeys.avgScaleTimeTele] = avgScaleTimeTele
        dictionary[SerializationKeys.avgAllianceSwitchTimeAuto] = avgAllianceSwitchTimeAuto
        dictionary[SerializationKeys.avgAllianceSwitchTimeTele] = avgAllianceSwitchTimeTele
        dictionary[SerializationKeys.avgOpponentSwitchTimeTele] = avgOpponentSwitchTimeTele
        dictionary[SerializationKeys.totalNumParks] = totalNumParks
        dictionary[SerializationKeys.totalNumRobotsLifted] = totalNumRobotsLifted
        dictionary[SerializationKeys.totalNumRobotLiftAttempts] = totalNumRobotLiftAttempts
        dictionary[SerializationKeys.totalNumRobotsGroundLifted] = totalNumRobotsGroundLifted
        dictionary[SerializationKeys.totalNumRobotGroundLiftAttempts] = totalNumRobotGroundLiftAttempts
        dictionary[SerializationKeys.totalNumHighLayerScaleCubes] = totalNumHighLayerScaleCubes
        dictionary[SerializationKeys.totalSuperNotes] = totalSuperNotes
        dictionary[SerializationKeys.numSuccessfulClimbs] = numSuccessfulClimbs
        dictionary[SerializationKeys.soloClimbPercentage] = soloClimbPercentage
        dictionary[SerializationKeys.activeAssistClimbPercentage] = activeAssistClimbPercentage
        dictionary[SerializationKeys.activeLiftClimbPercentage] = activeLiftClimbPercentage
        dictionary[SerializationKeys.activeNoClimbLiftClimbPercentage] = activeNoClimbLiftClimbPercentage
        dictionary[SerializationKeys.assistedClimbPercentage] = assistedClimbPercentage
        dictionary[SerializationKeys.predictedPark] = predictedPark
        dictionary[SerializationKeys.predictedTotalNumRPs] = predictedTotalNumRPs
        dictionary[SerializationKeys.totalNumRPs] = totalNumRPs
        dictionary[SerializationKeys.allianceSwitchSuccessPercentageTele] = allianceSwitchSuccessPercentageTele
        dictionary[SerializationKeys.opponentSwitchSuccessPercentageTele] = opponentSwitchSuccessPercentageTele
        dictionary[SerializationKeys.scaleSuccessPercentageAuto] = scaleSuccessPercentageAuto
        dictionary[SerializationKeys.scaleSuccessPercentageTele] = scaleSuccessPercentageTele
        dictionary[SerializationKeys.allianceSwitchFailPercentageAuto] = allianceSwitchFailPercentageAuto
    dictionary[SerializationKeys.allianceSwitchFailPercentageTele] = allianceSwitchFailPercentageTele
        dictionary[SerializationKeys.opponentSwitchFailPercentageTele] = opponentSwitchFailPercentageTele
        dictionary[SerializationKeys.didThreeExchangeInputPercentage] = didThreeExchangeInputPercentage
        dictionary[SerializationKeys.canGroundIntake] = canGroundIntake
        dictionary[SerializationKeys.teleopExchangeAbility] = teleopExchangeAbility
        dictionary[SerializationKeys.teleopScaleAbility] = teleopScaleAbility
        dictionary[SerializationKeys.teleopAllianceSwitchAbility] = teleopAllianceSwitchAbility
        dictionary[SerializationKeys.teleopOpponentSwitchAbility] = teleopOpponentSwitchAbility
        dictionary[SerializationKeys.maxScaleCubes] = maxScaleCubes
        dictionary[SerializationKeys.maxExchangeCubes] = maxExchangeCubes
    dictionary[SerializationKeys.avgAllianceSwitchCycleTimeAuto] = avgAllianceSwitchCycleTimeAuto
    dictionary[SerializationKeys.avgAllianceSwitchCycleTimeTele] = avgAllianceSwitchCycleTimeTele
    dictionary[SerializationKeys.avgOpponentSwitchCycleTimeTele] = avgOpponentSwitchCycleTimeTele
    dictionary[SerializationKeys.avgScaleCycleTimeAuto] = avgScaleCycleTimeAuto
    dictionary[SerializationKeys.avgScaleCycleTimeTele] = avgScaleCycleTimeTele
    dictionary[SerializationKeys.avgExchangeCycleTime] = avgExchangeCycleTime
    dictionary[SerializationKeys.avgNumCubesDroppedAuto] = avgNumCubesDroppedAuto
    dictionary[SerializationKeys.avgNumCubesDroppedTele] = avgNumCubesDroppedTele
    dictionary[SerializationKeys.lfmAvgNumRobotsLifted] = lfmAvgNumRobotsLifted
    dictionary[SerializationKeys.lfmAvgNumCubesPlacedAuto] = lfmAvgNumCubesPlacedAuto
    dictionary[SerializationKeys.lfmAvgNumCubesPlacedTele] = lfmAvgNumCubesPlacedTele
    dictionary[SerializationKeys.lfmAvgNumCubesDroppedAuto] = lfmAvgNumCubesDroppedAuto
    dictionary[SerializationKeys.lfmAvgNumCubesDroppedTele] = lfmAvgNumCubesDroppedTele
    dictionary[SerializationKeys.lfmAvgNumExchangeInputTele] = lfmAvgNumExchangeInputTele
    dictionary[SerializationKeys.lfmAvgNumGoodDecisions] = lfmAvgNumGoodDecisions
    dictionary[SerializationKeys.lfmAvgNumBadDecisions] = lfmAvgNumBadDecisions
    dictionary[SerializationKeys.lfmAvgCubesSpilledAuto] = lfmAvgCubesSpilledAuto
    dictionary[SerializationKeys.lfmAvgCubesSpilledTele] = lfmAvgCubesSpilledTele
    dictionary[SerializationKeys.lfmAvgCubesPlacedInScaleAuto] = lfmAvgCubesPlacedInScaleAuto
    dictionary[SerializationKeys.lfmAvgCubesPlacedInScaleTele] = lfmAvgCubesPlacedInScaleTele
    dictionary[SerializationKeys.lfmAvgAllianceSwitchCubesAuto] = lfmAvgAllianceSwitchCubesAuto
    dictionary[SerializationKeys.lfmAvgAllianceSwitchCubesTele] = lfmAvgAllianceSwitchCubesTele
    dictionary[SerializationKeys.lfmAvgOpponentSwitchCubesTele] = lfmAvgOpponentSwitchCubesTele
    dictionary[SerializationKeys.lfmAvgSpeed] = lfmAvgSpeed
    dictionary[SerializationKeys.lfmAvgDefense] = lfmAvgDefense
    dictionary[SerializationKeys.lfmAvgAgility] = lfmAvgAgility
    dictionary[SerializationKeys.lfmAvgDrivingAbility] = lfmAvgDrivingAbility
    return dictionary
  }

  // MARK: NSCoding Protocol
  required public init(coder aDecoder: NSCoder) {
    self.avgNumCubesFumbledAuto = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumCubesFumbledAuto)
    self.avgNumHumanPortalIntakeTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumHumanPortalIntakeTele)
    self.switchFailPercentageAuto = aDecoder.decodeFloat(forKey: SerializationKeys.switchFailPercentageAuto)
    self.avgNumElevatedPyramidIntakeAuto = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumElevatedPyramidIntakeAuto)
    self.avgAllianceSwitchCubesTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgAllianceSwitchCubesTele)
    self.avgAllianceSwitchCubesAuto = aDecoder.decodeFloat(forKey: SerializationKeys.avgAllianceSwitchCubesAuto)
    self.avgOpponentSwitchCubesTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgOpponentSwitchCubesTele)
    self.avgOpponentSwitchCubesAuto = aDecoder.decodeFloat(forKey: SerializationKeys.avgOpponentSwitchCubesAuto)
    self.avgAgility = aDecoder.decodeFloat(forKey: SerializationKeys.avgAgility)
    self.secondPickAbility = aDecoder.decodeFloat(forKey: SerializationKeys.secondPickAbility)
    self.avgNumGoodDecisions = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumGoodDecisions)
    self.avgNumAlliancePlatformIntakeAuto = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumAlliancePlatformIntakeAuto)
    self.avgNumReturnIntakeTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumReturnIntakeTele)
    self.avgNumOpponentPlatformIntakeTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumOpponentPlatformIntakeTele)
    self.avgNumBadDecisions = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumBadDecisions)
    self.avgClimbTime = aDecoder.decodeFloat(forKey: SerializationKeys.avgClimbTime)
    self.predictedClimb = aDecoder.decodeFloat(forKey: SerializationKeys.predictedClimb)
    self.avgDrivingAbility = aDecoder.decodeFloat(forKey: SerializationKeys.avgDrivingAbility)
    self.avgNumExchangeInputTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumExchangeInputTele)
    self.avgDefense = aDecoder.decodeFloat(forKey: SerializationKeys.avgDefense)
    self.avgCubesPlacedInScaleAuto = aDecoder.decodeFloat(forKey: SerializationKeys.avgCubesPlacedInScaleAuto)
    self.disabledPercentage = aDecoder.decodeFloat(forKey: SerializationKeys.disabledPercentage)
    self.predictedNumScaleCubesAuto = aDecoder.decodeFloat(forKey: SerializationKeys.predictedNumScaleCubesAuto)
    self.scaleFailPercentageTele = aDecoder.decodeFloat(forKey: SerializationKeys.scaleFailPercentageTele)
    self.incapacitatedPercentage = aDecoder.decodeFloat(forKey: SerializationKeys.incapacitatedPercentage)
    self.predictedNumAllianceSwitchCubesAuto = aDecoder.decodeFloat(forKey: SerializationKeys.predictedNumAllianceSwitchCubesAuto)
    self.autoRunPercentage = aDecoder.decodeFloat(forKey: SerializationKeys.autoRunPercentage)
    self.avgNumCubesFumbledTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumCubesFumbledTele)
    self.scaleFailPercentageAuto = aDecoder.decodeFloat(forKey: SerializationKeys.scaleFailPercentageAuto)
    self.avgCubesSpilledAuto = aDecoder.decodeFloat(forKey: SerializationKeys.avgCubesSpilledAuto)
    self.avgCubesSpilledTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgCubesSpilledTele)
    self.switchFailPercentageTele = aDecoder.decodeFloat(forKey: SerializationKeys.switchFailPercentageTele)
    self.avgNumAlliancePlatformIntakeTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumAlliancePlatformIntakeTele)
    self.avgNumGroundIntakeTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumGroundIntakeTele)
    self.climbPercentage = aDecoder.decodeFloat(forKey: SerializationKeys.climbPercentage)
    self.avgNumOpponentPlatformIntakeAuto = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumOpponentPlatformIntakeAuto)
    self.canScoreBothSwitchSidesAuto = aDecoder.decodeBool(forKey: SerializationKeys.canScoreBothSwitchSidesAuto)
    self.avgNumGroundPortalIntakeTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumGroundPortalIntakeTele)
    self.avgNumElevatedPyramidIntakeTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumElevatedPyramidIntakeTele)
    self.avgNumGroundPyramidIntakeTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumGroundPyramidIntakeTele)
    self.numMatchesPlayed = aDecoder.decodeObject(forKey: SerializationKeys.numMatchesPlayed) as? Int
    self.avgNumGroundPyramidIntakeAuto = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumGroundPyramidIntakeAuto)
    self.avgSpeed = aDecoder.decodeFloat(forKey: SerializationKeys.avgSpeed)
    self.firstPickAbility = aDecoder.decodeFloat(forKey: SerializationKeys.firstPickAbility)
    self.actualSeed = aDecoder.decodeInteger(forKey: SerializationKeys.actualSeed)
     self.predictedSeed = aDecoder.decodeInteger(forKey: SerializationKeys.predictedSeed)
    self.predictedNumRPs = aDecoder.decodeFloat(forKey: SerializationKeys.predictedNumRPs)
    self.actualNumRPs = aDecoder.decodeFloat(forKey: SerializationKeys.actualNumRPs)
    self.dysfunctionalPercentage = aDecoder.decodeFloat(forKey: SerializationKeys.dysfunctionalPercentage)
    self.avgCubesPlacedInScaleTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgCubesPlacedInScaleTele)
    self.totalNumGoodDecisions = aDecoder.decodeInteger(forKey: SerializationKeys.totalNumGoodDecisions)
    self.totalNumBadDecisions = aDecoder.decodeInteger(forKey: SerializationKeys.totalNumBadDecisions)
    self.avgNumRobotsLifted = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumRobotsLifted)
    self.avgTimeToOwnAllianceSwitchAuto = aDecoder.decodeFloat(forKey: SerializationKeys.avgTimeToOwnAllianceSwitchAuto)
    self.avgTimeToOwnScaleAuto = aDecoder.decodeFloat(forKey: SerializationKeys.avgTimeToOwnScaleAuto)
    self.parkPercentage = aDecoder.decodeFloat(forKey: SerializationKeys.parkPercentage)
    self.percentSuccessOppositeSwitchSideAuto = aDecoder.decodeFloat(forKey: SerializationKeys.percentSuccessOppositeSwitchSideAuto)
    self.allianceSwitchSuccessPercentageAuto = aDecoder.decodeFloat(forKey: SerializationKeys.percentSuccessOppositeSwitchSideAuto)
    self.canPlaceHighLayerCube = aDecoder.decodeBool(forKey: SerializationKeys.canPlaceHighLayerCube)
    self.pitAvgDriveTime = aDecoder.decodeFloat(forKey: SerializationKeys.pitAvgDriveTime)
    self.pitAvgRampTime = aDecoder.decodeFloat(forKey: SerializationKeys.pitAvgRampTime)
    self.avgTotalCubesPlaced = aDecoder.decodeFloat(forKey: SerializationKeys.avgTotalCubesPlaced)
    self.avgSwitchOwnership = aDecoder.decodeInteger(forKey: SerializationKeys.avgSwitchOwnership)
    self.avgScaleCubesBy100s = aDecoder.decodeFloat(forKey: SerializationKeys.avgScaleCubesBy100s)
    self.avgScaleCubesBy110s = aDecoder.decodeFloat(forKey: SerializationKeys.avgScaleCubesBy110s)
    self.avgAllVaultTime = aDecoder.decodeFloat(forKey: SerializationKeys.avgScaleCubesBy100s)
    self.RScoreAgility = aDecoder.decodeFloat(forKey: SerializationKeys.RScoreAgility)
    self.RScoreDefense = aDecoder.decodeFloat(forKey: SerializationKeys.RScoreDefense)
    self.RScoreDrivingAbility = aDecoder.decodeFloat(forKey: SerializationKeys.RScoreDrivingAbility)
    self.RScoreSpeed = aDecoder.decodeFloat(forKey: SerializationKeys.RScoreSpeed)
    self.avgNumCubesPlacedAuto = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumCubesPlacedAuto)
    self.avgNumCubesPlacedTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumCubesPlacedTele)
    self.avgScaleTimeAuto = aDecoder.decodeFloat(forKey: SerializationKeys.avgScaleTimeAuto)
    self.avgScaleTimeTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgScaleTimeTele)
    self.avgAllianceSwitchTimeAuto = aDecoder.decodeFloat(forKey: SerializationKeys.avgAllianceSwitchTimeAuto)
    self.avgAllianceSwitchTimeTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgAllianceSwitchTimeTele)
    self.avgOpponentSwitchTimeTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgOpponentSwitchTimeTele)
    self.totalNumParks = aDecoder.decodeInteger(forKey: SerializationKeys.totalNumParks)
    self.totalNumRobotsLifted = aDecoder.decodeInteger(forKey: SerializationKeys.totalNumRobotsLifted)
    self.totalNumRobotLiftAttempts = aDecoder.decodeInteger(forKey: SerializationKeys.totalNumRobotLiftAttempts)
    self.totalNumRobotsGroundLifted = aDecoder.decodeInteger(forKey: SerializationKeys.totalNumRobotsGroundLifted)
    self.totalNumRobotGroundLiftAttempts = aDecoder.decodeInteger(forKey: SerializationKeys.totalNumRobotGroundLiftAttempts)
    self.totalNumHighLayerScaleCubes = aDecoder.decodeInteger(forKey: SerializationKeys.totalNumHighLayerScaleCubes)
    //self.totalSuperNotes = aDecoder.decodeObject(forKey: SerializationKeys.totalSuperNotes) as? String
    self.numSuccessfulClimbs = aDecoder.decodeInteger(forKey: SerializationKeys.numSuccessfulClimbs)
    self.soloClimbPercentage = aDecoder.decodeFloat(forKey: SerializationKeys.soloClimbPercentage)
    self.activeAssistClimbPercentage = aDecoder.decodeFloat(forKey: SerializationKeys.activeAssistClimbPercentage)
    self.activeLiftClimbPercentage = aDecoder.decodeFloat(forKey: SerializationKeys.activeLiftClimbPercentage)
    self.activeNoClimbLiftClimbPercentage = aDecoder.decodeFloat(forKey: SerializationKeys.activeNoClimbLiftClimbPercentage)
    self.assistedClimbPercentage = aDecoder.decodeFloat(forKey: SerializationKeys.assistedClimbPercentage)
    self.predictedPark = aDecoder.decodeFloat(forKey: SerializationKeys.predictedPark)
    self.predictedTotalNumRPs = aDecoder.decodeInteger(forKey: SerializationKeys.predictedTotalNumRPs)
    self.totalNumRPs = aDecoder.decodeInteger(forKey: SerializationKeys.totalNumRPs)
    self.allianceSwitchSuccessPercentageTele = aDecoder.decodeFloat(forKey: SerializationKeys.allianceSwitchSuccessPercentageTele)
    self.opponentSwitchSuccessPercentageTele = aDecoder.decodeFloat(forKey: SerializationKeys.opponentSwitchSuccessPercentageTele)
    self.scaleSuccessPercentageAuto = aDecoder.decodeFloat(forKey: SerializationKeys.scaleSuccessPercentageAuto)
    self.scaleSuccessPercentageTele = aDecoder.decodeFloat(forKey: SerializationKeys.scaleSuccessPercentageTele)
    self.allianceSwitchFailPercentageAuto = aDecoder.decodeFloat(forKey: SerializationKeys.allianceSwitchFailPercentageAuto)
    self.allianceSwitchFailPercentageTele = aDecoder.decodeFloat(forKey: SerializationKeys.allianceSwitchFailPercentageTele)
    self.opponentSwitchFailPercentageTele = aDecoder.decodeFloat(forKey: SerializationKeys.opponentSwitchFailPercentageTele)
    self.didThreeExchangeInputPercentage = aDecoder.decodeFloat(forKey: SerializationKeys.didThreeExchangeInputPercentage)
    self.canGroundIntake = aDecoder.decodeFloat(forKey: SerializationKeys.canGroundIntake)
    self.teleopExchangeAbility = aDecoder.decodeFloat(forKey: SerializationKeys.teleopExchangeAbility)
    self.teleopScaleAbility = aDecoder.decodeFloat(forKey: SerializationKeys.teleopScaleAbility)
    self.teleopAllianceSwitchAbility = aDecoder.decodeFloat(forKey: SerializationKeys.teleopAllianceSwitchAbility)
    self.teleopOpponentSwitchAbility = aDecoder.decodeFloat(forKey: SerializationKeys.teleopOpponentSwitchAbility)
    self.maxScaleCubes = aDecoder.decodeInteger(forKey: SerializationKeys.maxScaleCubes)
    self.maxExchangeCubes = aDecoder.decodeInteger(forKey: SerializationKeys.maxExchangeCubes)
    self.avgAllianceSwitchCycleTimeAuto = aDecoder.decodeFloat(forKey: SerializationKeys.avgAllianceSwitchCycleTimeAuto)
    self.avgAllianceSwitchCycleTimeTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgAllianceSwitchCycleTimeTele)
    self.avgOpponentSwitchCycleTimeTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgOpponentSwitchCycleTimeTele)
    self.avgScaleCycleTimeAuto = aDecoder.decodeFloat(forKey: SerializationKeys.avgScaleCycleTimeAuto)
    self.avgScaleCycleTimeTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgScaleCycleTimeTele)
    self.avgExchangeCycleTime = aDecoder.decodeFloat(forKey: SerializationKeys.avgExchangeCycleTime)
    self.avgNumCubesDroppedAuto = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumCubesDroppedAuto)
    self.avgNumCubesDroppedTele = aDecoder.decodeFloat(forKey: SerializationKeys.avgNumCubesDroppedTele)
    self.lfmAvgNumRobotsLifted = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgNumRobotsLifted)
    self.lfmAvgNumCubesPlacedAuto = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgNumCubesPlacedAuto)
    self.lfmAvgNumCubesPlacedTele = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgNumCubesPlacedTele)
    self.lfmAvgNumCubesDroppedAuto = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgNumCubesDroppedAuto)
    self.lfmAvgNumCubesDroppedTele = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgNumCubesDroppedTele)
    self.lfmAvgNumExchangeInputTele = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgNumExchangeInputTele)
    self.lfmAvgNumGoodDecisions = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgNumGoodDecisions)
    self.lfmAvgNumBadDecisions = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgNumBadDecisions)
    self.lfmAvgCubesSpilledAuto = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgCubesSpilledAuto)
    self.lfmAvgCubesSpilledTele = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgCubesSpilledTele)
    self.lfmAvgCubesPlacedInScaleAuto = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgCubesPlacedInScaleAuto)
    self.lfmAvgCubesPlacedInScaleTele = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgCubesPlacedInScaleTele)
    self.lfmAvgAllianceSwitchCubesAuto = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgAllianceSwitchCubesAuto)
    self.lfmAvgAllianceSwitchCubesTele = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgAllianceSwitchCubesTele)
    self.lfmAvgOpponentSwitchCubesTele = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgOpponentSwitchCubesTele)
    self.lfmAvgSpeed = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgSpeed)
    self.lfmAvgDefense = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgDefense)
    self.lfmAvgAgility = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgAgility)
    self.lfmAvgDrivingAbility = aDecoder.decodeFloat(forKey: SerializationKeys.lfmAvgDrivingAbility)
  }

  public func encode(with aCoder: NSCoder) {
    aCoder.encode(avgNumCubesFumbledAuto, forKey: SerializationKeys.avgNumCubesFumbledAuto)
    aCoder.encode(avgNumHumanPortalIntakeTele, forKey: SerializationKeys.avgNumHumanPortalIntakeTele)
    aCoder.encode(switchFailPercentageAuto, forKey: SerializationKeys.switchFailPercentageAuto)
    aCoder.encode(avgNumElevatedPyramidIntakeAuto, forKey: SerializationKeys.avgNumElevatedPyramidIntakeAuto)
    aCoder.encode(avgAllianceSwitchCubesTele, forKey: SerializationKeys.avgAllianceSwitchCubesTele)
    aCoder.encode(avgAllianceSwitchCubesAuto, forKey: SerializationKeys.avgAllianceSwitchCubesAuto)
    aCoder.encode(avgOpponentSwitchCubesTele, forKey: SerializationKeys.avgOpponentSwitchCubesTele)
    aCoder.encode(avgOpponentSwitchCubesAuto, forKey: SerializationKeys.avgOpponentSwitchCubesAuto)
    aCoder.encode(avgAgility, forKey: SerializationKeys.avgAgility)
    aCoder.encode(secondPickAbility, forKey: SerializationKeys.secondPickAbility)
    aCoder.encode(avgNumGoodDecisions, forKey: SerializationKeys.avgNumGoodDecisions)
    aCoder.encode(avgNumAlliancePlatformIntakeAuto, forKey: SerializationKeys.avgNumAlliancePlatformIntakeAuto)
    aCoder.encode(avgNumReturnIntakeTele, forKey: SerializationKeys.avgNumReturnIntakeTele)
    aCoder.encode(avgNumOpponentPlatformIntakeTele, forKey: SerializationKeys.avgNumOpponentPlatformIntakeTele)
    aCoder.encode(avgNumBadDecisions, forKey: SerializationKeys.avgNumBadDecisions)
    aCoder.encode(avgClimbTime, forKey: SerializationKeys.avgClimbTime)
    aCoder.encode(predictedClimb, forKey: SerializationKeys.predictedClimb)
    aCoder.encode(avgDrivingAbility, forKey: SerializationKeys.avgDrivingAbility)
    aCoder.encode(avgNumExchangeInputTele, forKey: SerializationKeys.avgNumExchangeInputTele)
    aCoder.encode(avgDefense, forKey: SerializationKeys.avgDefense)
    aCoder.encode(avgCubesPlacedInScaleAuto, forKey: SerializationKeys.avgCubesPlacedInScaleAuto)
    aCoder.encode(disabledPercentage, forKey: SerializationKeys.disabledPercentage)
    aCoder.encode(predictedNumScaleCubesAuto, forKey: SerializationKeys.predictedNumScaleCubesAuto)
    aCoder.encode(scaleFailPercentageTele, forKey: SerializationKeys.scaleFailPercentageTele)
    aCoder.encode(incapacitatedPercentage, forKey: SerializationKeys.incapacitatedPercentage)
    aCoder.encode(predictedNumAllianceSwitchCubesAuto, forKey: SerializationKeys.predictedNumAllianceSwitchCubesAuto)
    aCoder.encode(autoRunPercentage, forKey: SerializationKeys.autoRunPercentage)
    aCoder.encode(avgNumCubesFumbledTele, forKey: SerializationKeys.avgNumCubesFumbledTele)
    aCoder.encode(scaleFailPercentageAuto, forKey: SerializationKeys.scaleFailPercentageAuto)
    aCoder.encode(avgCubesSpilledAuto, forKey: SerializationKeys.avgCubesSpilledAuto)
    aCoder.encode(avgCubesSpilledTele, forKey: SerializationKeys.avgCubesSpilledTele)
    aCoder.encode(switchFailPercentageTele, forKey: SerializationKeys.switchFailPercentageTele)
    aCoder.encode(avgNumAlliancePlatformIntakeTele, forKey: SerializationKeys.avgNumAlliancePlatformIntakeTele)
    aCoder.encode(avgNumGroundIntakeTele, forKey: SerializationKeys.avgNumGroundIntakeTele)
    aCoder.encode(climbPercentage, forKey: SerializationKeys.climbPercentage)
    aCoder.encode(avgNumOpponentPlatformIntakeAuto, forKey: SerializationKeys.avgNumOpponentPlatformIntakeAuto)
    aCoder.encode(canScoreBothSwitchSidesAuto, forKey: SerializationKeys.canScoreBothSwitchSidesAuto)
    aCoder.encode(avgNumGroundPortalIntakeTele, forKey: SerializationKeys.avgNumGroundPortalIntakeTele)
    aCoder.encode(avgNumElevatedPyramidIntakeTele, forKey: SerializationKeys.avgNumElevatedPyramidIntakeTele)
    aCoder.encode(avgNumGroundPyramidIntakeTele, forKey: SerializationKeys.avgNumGroundPyramidIntakeTele)
    aCoder.encode(numMatchesPlayed, forKey: SerializationKeys.numMatchesPlayed)
    aCoder.encode(avgNumGroundPyramidIntakeAuto, forKey: SerializationKeys.avgNumGroundPyramidIntakeAuto)
    aCoder.encode(avgSpeed, forKey: SerializationKeys.avgSpeed)
    aCoder.encode(firstPickAbility, forKey: SerializationKeys.firstPickAbility)
    aCoder.encode(actualSeed, forKey: SerializationKeys.actualSeed)
    aCoder.encode(predictedSeed, forKey: SerializationKeys.predictedSeed)
    aCoder.encode(actualNumRPs, forKey: SerializationKeys.actualNumRPs)
    aCoder.encode(predictedNumRPs, forKey: SerializationKeys.predictedNumRPs)
    aCoder.encode(dysfunctionalPercentage, forKey: SerializationKeys.dysfunctionalPercentage)
    aCoder.encode(avgCubesPlacedInScaleTele, forKey: SerializationKeys.avgCubesPlacedInScaleTele)
    aCoder.encode(totalNumGoodDecisions, forKey: SerializationKeys.totalNumGoodDecisions)
    aCoder.encode(totalNumBadDecisions, forKey: SerializationKeys.totalNumBadDecisions)
    aCoder.encode(avgNumRobotsLifted, forKey: SerializationKeys.avgNumRobotsLifted)
    aCoder.encode(avgTimeToOwnAllianceSwitchAuto, forKey: SerializationKeys.avgTimeToOwnAllianceSwitchAuto)
    aCoder.encode(avgTimeToOwnScaleAuto, forKey: SerializationKeys.avgTimeToOwnScaleAuto)
    aCoder.encode(parkPercentage, forKey: SerializationKeys.parkPercentage)
    aCoder.encode(percentSuccessOppositeSwitchSideAuto, forKey: SerializationKeys.percentSuccessOppositeSwitchSideAuto)
    aCoder.encode(allianceSwitchSuccessPercentageAuto, forKey: SerializationKeys.allianceSwitchSuccessPercentageAuto)
    aCoder.encode(canPlaceHighLayerCube, forKey: SerializationKeys.canPlaceHighLayerCube)
    aCoder.encode(avgTotalCubesPlaced, forKey: SerializationKeys.avgTotalCubesPlaced)
    aCoder.encode(avgSwitchOwnership, forKey: SerializationKeys.avgSwitchOwnership)
    aCoder.encode(avgScaleCubesBy100s, forKey: SerializationKeys.avgScaleCubesBy100s)
    aCoder.encode(avgScaleCubesBy110s, forKey: SerializationKeys.avgScaleCubesBy110s)
    aCoder.encode(avgAllVaultTime, forKey: SerializationKeys.avgAllVaultTime)
    aCoder.encode(RScoreAgility, forKey: SerializationKeys.RScoreAgility)
    aCoder.encode(RScoreDefense, forKey: SerializationKeys.RScoreDefense)
    aCoder.encode(RScoreDrivingAbility, forKey: SerializationKeys.RScoreDrivingAbility)
    aCoder.encode(RScoreSpeed, forKey: SerializationKeys.RScoreSpeed)
    aCoder.encode(avgNumCubesPlacedAuto, forKey: SerializationKeys.avgNumCubesPlacedAuto)
    aCoder.encode(avgNumCubesPlacedTele, forKey: SerializationKeys.avgNumCubesPlacedTele)
    aCoder.encode(avgScaleTimeAuto, forKey: SerializationKeys.avgScaleTimeAuto)
    aCoder.encode(avgScaleTimeTele, forKey: SerializationKeys.avgScaleTimeTele)
    aCoder.encode(avgAllianceSwitchTimeAuto , forKey: SerializationKeys.avgAllianceSwitchTimeAuto)
    aCoder.encode(avgAllianceSwitchTimeTele, forKey: SerializationKeys.avgAllianceSwitchTimeTele)
    aCoder.encode(totalNumParks, forKey: SerializationKeys.totalNumParks)
    aCoder.encode(totalNumRobotsLifted, forKey: SerializationKeys.totalNumRobotsLifted)
    aCoder.encode(totalNumRobotLiftAttempts, forKey: SerializationKeys.totalNumRobotLiftAttempts)
    aCoder.encode(totalNumRobotsGroundLifted, forKey: SerializationKeys.totalNumRobotsGroundLifted)
    aCoder.encode(totalNumRobotGroundLiftAttempts, forKey: SerializationKeys.totalNumRobotGroundLiftAttempts)
    aCoder.encode(totalNumHighLayerScaleCubes, forKey: SerializationKeys.totalNumHighLayerScaleCubes)
    aCoder.encode(totalSuperNotes, forKey: SerializationKeys.totalSuperNotes)
    aCoder.encode(numSuccessfulClimbs, forKey: SerializationKeys.numSuccessfulClimbs)
    aCoder.encode(soloClimbPercentage, forKey: SerializationKeys.soloClimbPercentage)
    aCoder.encode(activeAssistClimbPercentage, forKey: SerializationKeys.activeAssistClimbPercentage)
    aCoder.encode(activeLiftClimbPercentage, forKey: SerializationKeys.activeLiftClimbPercentage)
    aCoder.encode(activeNoClimbLiftClimbPercentage, forKey: SerializationKeys.activeNoClimbLiftClimbPercentage)
    aCoder.encode(assistedClimbPercentage, forKey: SerializationKeys.assistedClimbPercentage)
    aCoder.encode(predictedPark, forKey: SerializationKeys.predictedPark)
    aCoder.encode(predictedTotalNumRPs, forKey: SerializationKeys.predictedTotalNumRPs)
    aCoder.encode(totalNumRPs, forKey: SerializationKeys.totalNumRPs)
    aCoder.encode(allianceSwitchSuccessPercentageTele, forKey: SerializationKeys.allianceSwitchSuccessPercentageTele)
    aCoder.encode(opponentSwitchSuccessPercentageTele, forKey: SerializationKeys.opponentSwitchSuccessPercentageTele)
    aCoder.encode(scaleSuccessPercentageAuto, forKey: SerializationKeys.scaleSuccessPercentageAuto)
    aCoder.encode(scaleSuccessPercentageTele, forKey: SerializationKeys.scaleSuccessPercentageTele)
    aCoder.encode(allianceSwitchFailPercentageAuto, forKey: SerializationKeys.allianceSwitchFailPercentageAuto)
    aCoder.encode(allianceSwitchFailPercentageTele, forKey: SerializationKeys.allianceSwitchFailPercentageTele)
    aCoder.encode(opponentSwitchFailPercentageTele, forKey: SerializationKeys.opponentSwitchFailPercentageTele)
    aCoder.encode(didThreeExchangeInputPercentage, forKey: SerializationKeys.didThreeExchangeInputPercentage)
    aCoder.encode(canGroundIntake, forKey: SerializationKeys.canGroundIntake)
    aCoder.encode(teleopExchangeAbility, forKey: SerializationKeys.teleopExchangeAbility)
    aCoder.encode(teleopScaleAbility, forKey: SerializationKeys.teleopScaleAbility)
    aCoder.encode(teleopAllianceSwitchAbility, forKey: SerializationKeys.teleopAllianceSwitchAbility)
    aCoder.encode(teleopOpponentSwitchAbility, forKey: SerializationKeys.teleopOpponentSwitchAbility)
    aCoder.encode(maxScaleCubes, forKey: SerializationKeys.maxScaleCubes)
    aCoder.encode(maxExchangeCubes, forKey: SerializationKeys.maxExchangeCubes)
    aCoder.encode(avgAllianceSwitchCycleTimeAuto, forKey: SerializationKeys.avgAllianceSwitchCycleTimeAuto)
    aCoder.encode(avgAllianceSwitchCycleTimeTele, forKey: SerializationKeys.avgAllianceSwitchCycleTimeTele)
    aCoder.encode(avgOpponentSwitchCycleTimeTele, forKey: SerializationKeys.avgOpponentSwitchCycleTimeTele)
    aCoder.encode(avgScaleCycleTimeAuto, forKey: SerializationKeys.avgScaleCycleTimeAuto)
    aCoder.encode(avgScaleCycleTimeTele, forKey: SerializationKeys.avgScaleCycleTimeTele)
    aCoder.encode(avgExchangeCycleTime, forKey: SerializationKeys.avgExchangeCycleTime)
    aCoder.encode(avgNumCubesDroppedAuto, forKey: SerializationKeys.avgNumCubesDroppedAuto)
    aCoder.encode(avgNumCubesDroppedTele, forKey: SerializationKeys.avgNumCubesDroppedTele)
    aCoder.encode(lfmAvgNumRobotsLifted, forKey: SerializationKeys.lfmAvgNumRobotsLifted)
    aCoder.encode(lfmAvgNumCubesPlacedAuto, forKey: SerializationKeys.lfmAvgNumCubesPlacedAuto)
    aCoder.encode(lfmAvgNumCubesPlacedTele, forKey: SerializationKeys.lfmAvgNumCubesPlacedTele)
    aCoder.encode(lfmAvgNumCubesDroppedAuto, forKey: SerializationKeys.lfmAvgNumCubesDroppedAuto)
    aCoder.encode(lfmAvgNumCubesDroppedTele, forKey: SerializationKeys.lfmAvgNumCubesDroppedTele)
    aCoder.encode(lfmAvgNumExchangeInputTele, forKey: SerializationKeys.lfmAvgNumExchangeInputTele)
    aCoder.encode(lfmAvgNumGoodDecisions, forKey: SerializationKeys.lfmAvgNumGoodDecisions)
    aCoder.encode(lfmAvgNumBadDecisions, forKey: SerializationKeys.lfmAvgNumBadDecisions)
    aCoder.encode(lfmAvgCubesSpilledAuto, forKey: SerializationKeys.lfmAvgCubesSpilledAuto)
    aCoder.encode(lfmAvgCubesSpilledTele, forKey: SerializationKeys.lfmAvgCubesSpilledTele)
    aCoder.encode(lfmAvgCubesPlacedInScaleAuto, forKey: SerializationKeys.lfmAvgCubesPlacedInScaleAuto)
    aCoder.encode(lfmAvgCubesPlacedInScaleTele, forKey: SerializationKeys.lfmAvgCubesPlacedInScaleTele)
    aCoder.encode(lfmAvgAllianceSwitchCubesAuto, forKey: SerializationKeys.lfmAvgAllianceSwitchCubesAuto)
    aCoder.encode(lfmAvgAllianceSwitchCubesTele, forKey: SerializationKeys.lfmAvgAllianceSwitchCubesTele)
    aCoder.encode(lfmAvgOpponentSwitchCubesTele, forKey: SerializationKeys.lfmAvgOpponentSwitchCubesTele)
    aCoder.encode(lfmAvgSpeed, forKey: SerializationKeys.lfmAvgSpeed)
    aCoder.encode(lfmAvgDefense, forKey: SerializationKeys.lfmAvgDefense)
    aCoder.encode(lfmAvgAgility, forKey: SerializationKeys.lfmAvgAgility)
    aCoder.encode(lfmAvgDrivingAbility, forKey: SerializationKeys.lfmAvgDrivingAbility)
  }
}
