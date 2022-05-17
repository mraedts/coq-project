Require Import BenB.
Require Import BenB2.

(* ====================================================================== *)

(* 
   Title: 
   ======
   Authors:
   Mart Brennenraedts, s1078038
   Daan Weessies, s1063758
   Wessel van der Lans, s1084461
   Mees Ephraim, s1085936
*)

(* ====================================================================== *)

(*
   [
     This file has to be a valid script, meaning that it
     can be executed by Coq.
     Therefore, explanations in natural language have to be between
     comment markers.

     In this project template, text within square brackets (within
     comment markers) is intended to clarify what needs to be 
     written where.

     In the final version, we expect that all these blocks have been
     replaced by (your) proper content.
   ]
   
*)

(*
   Abstract:
   =========
   [
     Explain whether you managed to prove the correctness theorem.
     And how did that go: did you have to change a lot compared to
     the original model as it was before you started with the proof,
     or could you use your formalization without many modifications?
   ]

*)

(*
   Focus:

   Modeling Goal:
   ==============
   Verification model 


   Fragment of reality:
   ====================
   [ ... ]


   Perspective:
   ============
   [ ... ]

*)


(*
   Abstractions or simplifications:
   ================================
   [
     Depending on the chosen focus, you may simplify certain aspects of
     your artifact.
     If you are modeling some kind of home automation system, it is not
     unreasonable to assume that the net power is constant, although this
     is not exactly the case in reality. However, if you are modeling an
     artifact that protects against high peaks of power, these fluctuations
     should be part of the model.

     Write down explicitly which assumptions you have made to simplify
     the artifact.
   ]

*)

(* ====================================================================== *)

(* Domain model *)

Definition Time := R.
(* Time in seconds in reals*)
Definition Temp := R.
(*meaning: temperature in degrees celcius in reals*)


(* Inputs and outputs of the SmartFridge *)

Variable PowerIn: Time -> Prop.
(* power is supplied to the smartfridge's powersupply *)
Variable FridgeDoorROpen: Time -> Prop.
(* the right fridge door is opened *)
Variable FridgeDoorLOpen: Time -> Prop.
(* the left fridge door is opened *)
Variable FreezerDoorROpen: Time -> Prop.
(* the right freezer door is opened *)
Variable FreezerDoorLOpen: Time -> Prop.
(* the left freezer door is opened *)
Variable ColdWater: Time -> Prop.
(* cold water is dispensed by the dispenser *)
Variable CubedIce: Time -> Prop.
(* ice cubes are dispensed by the dispenser *)
Variable CrushedIce: Time -> Prop.
(* crushed ice is dispensed by the dispenser *)
Variable WaterIn: Time -> Prop.
(* water is supplied to the IceMakerTray and to the WaterCooler *)
Variable FridgeLightOn: Time -> Prop.
(* the light inside the fridge is emitting *)
Variable WaterButtonIn: Time -> Prop.
(* The option to receive cold water is selected on the ControlPanel *)
Variable CrushedIceButtonIn: Time -> Prop.
(* The option to receive crushed ice is selected on the ControlPanel *)
Variable CubedIceButton: Time -> Prop.
(* The option to receive cubed ice is selected on the ControlPanel *)


(* Internal components for the SmartFridge *)

Variable Pow1: Time -> Prop.
(* Power flows between the Powersupply and the FridgePowerHub *)
Variable Pow2: Time -> Prop.
(* Power flows between the Powersupply and the FreezerPowerHub *)


(* Internal IceMaker variables *)

Variable PowIceMakerTray: Time -> Prop.
(* Power flows between the icemaker and the icemaker powerhub *)
Variable ReservoirFull: Time -> Prop.
(* The ice reservoir is full *)
Variable PowIceReservoir: Time -> Prop.
(* Power is flowing between the ice reservoir and the icemaker powerhub *)
Variable CrushIce: Time -> Prop.
(* There is ice that needs to be crushed*)
Variable PowIceMakerTray: Time -> Prop.
(* Power is flowing between the IceMakerPowerHub and the IceMaker tray *)
Variable FillReservoir: Time -> Prop.
(* There is room in the IceReservoir*)
Variable DispenceIce: Time -> Prop.
(* The dispenser requires ice *)
Variable PowIceCrusher: Time -> Prop.
(* Power flows between the IceCrusher and the IceMakerPowerHub *)
Variable DispenseWater: Time -> Prop.
(* The dispenser requires ice from the WaterCooler *)
Variable PowWaterCooler: Time -> Prop.
(* Power flows between the WaterCooler and the IceMakerPowerHub *)
Variable DispenseCrushedIce: Time -> Prop.
(* The dispenser requires crushed ice *)


(* FridgeDoorL variables *)

Variable PowIceMaker: Time -> Prop.
(* Power flows between the FridgeDoorLPowerHub and IceMaker *)
Variable PowControlPanel: Time -> Prop.
(* power is supplied to the ControlPanelPowerHub if and only if power is supplied to the FridgeDoorLPowerHub *)
Variable ColdWaterSignal: Time -> Prop.
(* WaterButton is being pressed *)
Variable CrushedIceSignal: Time -> Prop.
(* CrushedIceButton is being pressed *)
Variable CubedIceSignal: Time -> Prop.
(* CubedIceButton is being pressed *)
Variable PowFridgeDoorSensorL: Time -> Prop.
(* The Sensor in FridgeDoorL is supplied with power *)



(* Internal components of ControlPanel *)

Variable PowWaterButton: Time -> Prop. 
(* power is supplied to the button for selecting water if and only if power is supplied to the ControlPanelPowerHub *)
Variable PowCrushedIceButton: Time -> Prop. 
(* power is supplied to the button for selecting crushed ice if and only if power is supplied to the ControlPanelPowerHub *)
Variable PowCubedIceButton: Time -> Prop. 
(* power is supplied to the button for selecting cubed ice if and only if power is supplied to the ControlPanelPowerHub *)


(* Internal components of the freezer *)

Variable FreezerDoorSignalL: Time -> Prop.
(* The sensor in the freezerdoor senses that the left door is open *)
Variable FreezerDoorSignalR: Time -> Prop.
(* The sensor in the freezerdoor senses that the right door is open *)
Variable FreezerTempTooHigh: Time -> Prop.
(* The temperature near the freezer sensor is higher than MaximumFreezerTemp *)
Variable PowF: Time -> Prop.
(* Power is flowing between the FreezerPowerHub and FreezerDoorL *)
Variable PowG: Time -> Prop.
(* Power is flowing between the FreezerPowerHub and FreezerCooler *)
Variable PowH: Time -> Prop.
(* Power is flowing between the FreezerPowerHub and FreezerLight *)
Variable PowI: Time -> Prop.
(* Power is flowing between the FreezerPowerHub and FreezerTempSensor *)
Variable PowJ: Time -> Prop.
(* Power is flowing between the FreezerPowerHub and FreezerDoorR *)
Variable FreezerCoolerOn: Time -> Prop.
(* The freezer is actively cooling *)


(* Internal components of the fridge *)

Variable FridgeDoorSignalL: Time -> Prop.
(* The sensor in the Fridgedoor senses that the left door is open *)
Variable FridgeDoorSignalR: Time -> Prop.
(* The sensor in the Fridgedoor senses that the right door is open *)
Variable FridgeTempTooHigh: Time -> Prop.
(* The temperature near the Fridge sensor is higher than MaximumFridgeTemp *)
Variable PowA: Time -> Prop.
(* Power is flowing between the FridgePowerHub and FridgeDoorL *)
Variable PowB: Time -> Prop.
(* Power is flowing between the FridgePowerHub and FridgeCooler *)
Variable PowC: Time -> Prop.
(* Power is flowing between the FridgePowerHub and FridgeLight *)
Variable PowD: Time -> Prop.
(* Power is flowing between the FridgePowerHub and FridgeTempSensor *)
Variable PowE: Time -> Prop.
(* Power is flowing between the FridgePowerHub and FridgeDoorR *)
Variable FridgeCoolerOn: Time -> Prop.
(* The fridge is actively cooling *)




(* Internal components of FreezerDoorL *)


Variable PowFreezerDoorSensorL: Time -> Prop.
(* power is supplied to FreezerDoorSensorL if and only if power is supplied to FreezerDoorLPowerhub *)


(* Internal components of FreezerDoorR*)

Variable PowFreezerDoorSensorR: Time -> Prop.
(* power is supplied to FreezerDoorSensorR if and only if power is supplied to FreezerDoorRPowerHub *)

(* Internal components of FridgeDoorR *)

Variable PowFridgeDoorSensorR: Time -> Prop.
(* power is supplied to FridgeDoorSensorR if and only if power is supplied to FridgeDoorRPowerhub *)


(* Constants (including their meaning) *)

Definition MaximumFridgeTemp := 4.  
(* The minimum temperature at which the FridgeTempSensor gives off the FridgeTempTooHigh signal *)
Definition MaximumFreezerTemp := -5.
(* The minimum temperature at which the FreezerTempSensor gives off the FreezerTempTooHigh signal *)



(* Functions *)
Variable TimeToTemp: Time -> Temp. 




(* Predicates (including their meaning and measurements) *)






(* ====================================================================== *)

(* Auxiliary predicates (including their meaning) *)

(*
   [
     At this place within this template you may define as many
     auxiliary predicates as you want, but do not forget to include
     their meaning.
   ]
*)

(* ====================================================================== *)

(* Components *)

(*
   [
     For each component you have to specify the following information:
    
     OUTSIDE comment markers:
     - The 'Definition' to be read by Coq, in a readable layout that
       matches the mathematical structure of the formula.

     WITHIN comment markers:
     - The specification of the component in natural language. Obviously,
       this specification should be consistent with the formula used
       by Coq.
     - If appropriate, a short explanation in natural language about
       the choices that have been made.
   ]
*)

(* Specifications of devices in ControlPanel *)

Definition WaterButton := 
      WaterButtonIn
    /\
      PowWaterButton
  <->
    ColdWaterSignal
.
(* meaning: if and only if the button to select cold water is pressed and power is supplied to the button to select cold water then the signal for cold water is sent *)

Definition CrushedIceButton :=
      CrushedIceButtonIn
    /\
      PowCrushedIceButton
  <->
    CrushedIceSignal
.
(* meaning: if and only if the button to select crushed ice is pressed and power is supplied to the button to select crushed ice then the signal for crushed ice is sent *) *)

Definition CubedIceButton :=
      CubedIceButtonIn
    /\
      PowCubedIceButton
  <->
    CubedIceSignal
.
(* meaning: if and only if the button to select cubed ice is pressed and power is supplied to the button to select cubed ice then the signal for cubed ice is sent *) *)

Definition ControlPanelPowerHub :=
    PowControlPanel
  <->
    (
        PowWaterButton
      /\
        PowCrushedIceButton
      /\
        PowCubedIceButton
    )
.
(* meaning: if and only if power is supplied to the control panel then power is supplied to the water button, crushed ice button, and cubed ice button *)




(* specification of devices in FridgeDoorL *)

Definition FridgeDoorLPowerHub :=
      PowIceMaker
    /\
      PowControlPanel
    /\
      PowFridgeDoorSensorL
  <->
    PowA
.
(* meaning: power is supplied to PowIceMaker, PowControlPanel and PowFridgeDoorSensorL if and only if power is supplied to PowA *)


Definition FridgeDoorSensorL :=
    FridgeDoorLOpen
  /\
    PowFridgeDoorSensorL
<->
  FridgeDoorSignalL
.
(* meaning: The signal FridgeDoorSignalL is send if and only if FridgeDoorLOpen and PowFridgeDoorSensorL are received *)


    
    

(* Specifications of devices in IceMaker *)

Definition IceMakerTray :=
      WaterIn
    /\
      PowIceMakerTray
    /\
      ~ReservoirFull
  <->
    FillReservoir    
.
(* meaning: iff there's water pressure on the water line, and power is being supplied to the IceMakerTray, and the IceReservoir  is not full, then the IceReservoir is being filled *)


Definition Watercooler :=
      PowWaterCooler
    /\
      WaterIn
    /\
      ColdWaterSignal
  <->
    DispenseWater
.
(* meaning: iff power is being supplied to the WaterCooler, and there is water pressure on the water line, and WaterCooler is receiving a cold water signal from WaterButton, then water flows from the WaterCooler to the Dispenser*)

Definition IceReservoir :=
        PowIceReservoir
      /\
        CrushedIceSignal
    <->
      CrushIce
  /\
        PowIceReservoir
      /\
        CubedIceSignal
    <->
      CubedIce    
.

(* meaning: *)




(* Specifications of devices in FridgeDoorR *)

Definition FridgeDoorSensorR :=
      FridgeDoorROpen
    /\
      PowFridgeDoorSensorR
  <->
    FridgeDoorSignalR
.
(* meaning: if and only if power is supplied to the sensor in the right-side fridge door and the right-side fridge door is opened, then a signal is sent from the right-side fridge door *)



Definition FridgeDoorRPowerHub :=
      PowE
    <->
      PowFridgeDoorSensorR
.
(* meaning: iff power is being supplied to FridgeDoorRPowerHub, then it is supplying power to FridgeDoorSensorR *)

    



(* Specifications of devices in FreezerDoorR *)

Definition FreezerDoorSensorR :=
      FreezerDoorROpen
    /\
      PowFreezerDoorSensorR
  <->
    FreezerDoorSignalR
.
(* meaning: if and only if power is supplied to the sensor in the right-side freezer door and the right-side freezer door is opened, then a signal is sent from the right-side freezer door *)


Definition FreezerDoorRPowerHub :=
    PowJ
  <->
    PowFreezerDoorSensorR
.
(* meaning: iff power is supplied to PowJ, then power is supplied to the right-side freezer door sensor *)




(* Specifications of devices in FreezerDoorL *)

Definition FreezerDoorSensorL :=
      FreezerDoorLOpen
    /\
      PowFreezerDoorSensorL
  <->
    FreezerDoorSignalL
.
(* meaning: iff power is supplied to the sensor in the left-side freezer door and the left-side freezer door is opened, then a signal is sent from the left-side freezer door *)

Definition FreezerDoorLPowerhub :=
    PowF
  <->
    PowFreezerDoorSensorL
.
(* meaning: iff power is supplied to PowF, then power is supplied to the left-side freezer door sensor *)




(* Specifications of devices in SmartFridge *)

Definition Powersupply :=
      PowerIn
  <->
      Pow1
    /\
      Pow2
.
(* Meaning: DC Power is supplied to FridgePowerhub and FreezerPowerhub iff AC Power is supplied to the Powersupply *)





(* Specifications of devices in Fridge *)

Definition FridgeLight :=
        FridgeDoorSignalL
      \/
        FridgeDoorSignalR
    /\
      PowC
  <->
    FridgeLightOn
.
(* Meaning: The light of the fridge is turned on if and only if it receives power through PowC and one or more of its doors is open *)

Definition FridgeCooler :=
      FridgeTempTooHigh
    /\
      PowB
  <->
    FridgeCoolerOn
.
(* Meaning: When both power is delivered through PowB and the FridgeTempTooHigh signal is received, then the cooler will turn on *)

Definition FridgeTempSensor :=
    forall t:Time,
          TimeToTemp( t ) > MaximumFridgeTemp
        /\
          PowD
      <->
        FridgeTempTooHigh  
.
(* Meaning: For any moment in time if and only if the temperature is greater than the MaximumFridgeTemp and PowD supplies power then the signal FridgeTempTooHigh is send *)

Definition FridgePowerHub :=
    Pow1
  <->
      PowA
    /\
      PowB
    /\
      PowC
    /\
      PowD
    /\
      PowE
.
(* Meaning: if and only if power is supplied to Pow1, then power is supplied to PowA, PowB, PowC, PowD and PowE *)



(* Specifications of devices in Freezer *)

Definition FreezerPowerhub :=
    Pow2
  <->
      PowF
    /\
      PowG
    /\
      PowH
    /\
      PowI
    /\
      PowJ
.
(* meaning: iff power is supplied to Pow2, then power is supplied to PowF, PowG, PowH, PowI, and PowJ *)

Definition FreezerCooler := 
      PowG
    /\
      FreezerTempTooHigh
  <->
    FreezerCoolerOn
.
(* Iff power is supplied to PowG and the temperature inside the freezer is too high, then the cooler inside the freezer will turn on *)

Definition FreezerTempSensor :=
  forall t:Time,
        TimeToTemp(t) > MaximumFreezerTemp
      /\
        PowI
    <->
      FreezerTempTooHigh
.


(* ====================================================================== *)

(* Specification of the overall system *)

(*
   [
     Here you have to specify:

     OUTSIDE comment markers:
     - The 'Definition' to be read by Coq, in a readable layout that
       matches the mathematical structure of the formula.

     WITHIN comment markers:
     - The specification of the overall system in natural language.
       Obviously, this specification should be consistent with the
       formula used by Coq.
     - If appropriate, a short explanation in natural language about
       the choices that have been made.
   ]
*)

(* ====================================================================== *)

(* Extras *)

(*
   [
     It is very likely that you do not need any extras!

     However, if it turns out during your proof that you have to prove
     several times (almost) the same, then you may define a 'Lemma' at
     this place, followed by its proof. And in the proof of the correctness
     theorem, you may apply this lemma several times.
     Note that it is always allowed to add lemmas to this script!

     Sometimes it happens that Coq has troubles with 'trivial' properties
     of numbers, that cannot be solve easily using 'lin_solve'.
     In such situations, you may contact your supervisor and discuss 
     whether this may be solved by adding an 'Axiom', which can also be
     applied later on within the proof of the correctness theorem.
   ]
*)

(* Correctness theorem *) 

(* ====================================================================== *)

(*
   [
     Write down your correctness theorem in the usual notation:
     Theorem CorTheorem:
     Component1 /\ Component2 /\ ... /\ ComponentN -> SpecOfTheOverallSystem.

     Note that as long as you don't know what natural deduction is
     and you cannot start with the proof yet, you should keep this
     theorem within comment markers, otherwise you will get a red cross
     for stating a theorem without a proof.
   
     For the final version you obviously have to remove these comment
     markers and provide a real proof!

     Note that even if your proof is correct, you won't be able to
     get a green check mark, but only an orange flag, for technical
     reasons. But that is no problem.
   ]
*)

(* 
Theorem CorTheorem:

*)   
