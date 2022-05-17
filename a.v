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


 ____ ___ ____   _____ ____  _____ ____  _   _   ________  _   _ _____ 
| __ )_ _/ ___| |  ___|  _ \| ____/ ___|| | | | |__  / _ \| \ | | ____|
|  _ \| | |  _  | |_  | |_) |  _| \___ \| |_| |   / / | | |  \| |  _|  
| |_) | | |_| | |  _| |  _ <| |___ ___) |  _  |  / /| |_| | |\  | |___ 
|____/___\____| |_|   |_| \_\_____|____/|_| |_| /____\___/|_| \_|_____|

/%%&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%%%%% %%%%%%%%%%%###############((((/////****
(&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&
(&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%*/%%((&&&
(&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&
(&&&&&&&&&&&%&&%%%%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%%%%%%%%&&&&&&&&&&&&&&&@@@@@@&&&&
(&&&/**/(%&&&&&%%%%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%#((((((((((####(########@@@@&&&&
(&&&%*/.@%&&&&%%%%%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%(..... . ...............@@@@&&&&
(&&&*,*(.%&&&&%%%%%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%(...,*****,,,,,,*****,*.&@@@&&&&
(&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%/....................,,.&@@@&&&&
(&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%/.,,      . ....      ..&@@@&&&&
(&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%(,.........,...,.,,,,,,,@@@@&&&&
(&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%%*,,,,,***,,,,,,*****,,,@@@@&&&&
(&&&&&&&&&&&&&&&%&%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%/      .................@@@@&&&&
(&&&&&&&&&&&&&&&%&&%%%%%%%%%%%%%%%%%%%%%@%%%%%%%/    ...................&@@@&&&&
(&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%/   ...  ...,......,,,..&@@@&&&&
(&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%/ .**,**,.*/,,**.,/*,*/,@@@@&&&&
(&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%/,,**,//*/**,,//.,/**//*&@@@&&&&
(&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%/............... .,....,@@@@&&&&
(&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%/.............., .,....,@@@@&&&&
(&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%%%%%%%@%%%%%%%/ ......,......, .,....,@@@@&&&&
(&&&&&&&&&%%%%%%%%(##%########%%%%%%%%%%@%%%%%%%(,,..,,,,,,,,,,,,,,,,*,,@@@@&&&&
(&&&&&&&@@%%%%%%%%%%%%%#######%@@%%%%%%%@%%%%%%%(... .  .,.............,&@@@&&&&
(&&&&&&&@@%#%%%%%%%%%%########%@@%%%%%%%@%%%%%%%#,..    .,.....,..,,,..,&@@@&&&&
(&&&&&&&@@%%%%%%%%%%%%#####((#&@@%%%%%%%@%%%%%%%#/  .....,,. ..,..,,  ..@@@@&&&&
(&&&&&&&@@@@@@&&%%%%%%%%%&%%&&&@@%%%%%%%@%%%%%%%(........ ,....,..,,,...@@@@&&&&
(&&&&&&&@@@@@&&&&%%%%%%%&&%%&&&@@%%%%%%%@%%%%%%%#**,,////(,[*[***//[**[*&@@@&&&&
(&&&&&&&@@@@@&&&&#(/////&&&%%@@@@%%%%%%%@%%%%%%%((/,**/(###///(//*//(/#(@@@@&&&
(&&&&&&&@@@@@&&%%%&&&&&&%&%%%@@@@%%%%%%%@%%%%%%%#*, .****/[*,**[*/*[*.*/@@@@&&&&
(&&&&&&&@@@@@&&%%%%%%%%%%&%%%&&&&%%%%%%%@%%%%%%%[*. ,,/,/**,..,**/*/,..*@@@@&&&&
(&&&&&&&@@@@@&&%%%%%%%%%%%%%#&&&&%%%%%%%@%%%%%%%#*. ,,*.//*,..,/.*//,..*@@@@&&&&
(&&&&&&&@@@@@%%%%%&&%%%%&%%%#&&&&%%%%%%%@%%%%%%%#*. ,,*,//,. .,/.*//,..*@@@@&&&&
(&&&&&&&@@@@@&%%%%%%%%%%%%%%#&&&&%%%%%%%@%%%%%%%(                       @@@@&&&&
(&&&&&&&@@@@@&%%%%%%%%%%%%%%#&&&&%%%%%%%@%%%%%%%%%%%%&&&&&&&&&&&&&@@@@@@@@@@&&&&
(&&&&&&&@@@@@&%%%%%%%%%%%%%%#&&&&%%%%%%%@%%%%%%%%%%%%&&&&&&&&&&&&&&@@@@@@@@@&&&&
(&&&&&&&@@&&@&&&&&&&&&&&&&&&%&&&&%%%%%%%@%%%%%%%#%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&&&%&&&&&
 &%@@#&&@&%&&@@@@@@@@@@@@@@@@@@@@@@@@@@@@%##&@@@@@@@@@@@@@@@@@@@@@@&@&%&&@@@&&#%
(@&&#&&&&&&&&&&&&&&&&%%%&%&%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&&@#&&&
(&&&###((((////****,,,,,,,..............@.............,,,,,,,*****///(((((##%&&&
(&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%%&&&%%%&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&%&%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%%&%&&%&&&&&&&&&&&&
(@&&&&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%%&%&&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%&@%%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%&%%&&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%%%%%%%%@%%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%&%%%%%%%%@%%%%%%%%%%%%%%%%%%&%&%&&&&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&%&&%%%%%@%%%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&@%%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&&&&&&&
(@&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&@%%%%%%%%%%%%%%%%%&&&&&&&&&&&&&&&&&&&&&&
(@&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&@%%%%%%%%%&&%&%%%&&&&&&&&&&&&&&&&&&&&&&&
(@&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&@%%%%%%%%&%%&&%%&&&&&&&&&&&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&@&&&&&&&%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&@&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&@&&&&%%&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&@&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
(&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&@&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
(@&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
  @@@@                                                                    /@@@#





                                                                                                                        


  As accurately pictured above, the fragment of reality is an LG smart fridge. Even more accurate pictures can be found in 
  the pdf file.

   

   Perspective:
   ============
   We focus on the cooling of the food, the light in the fridge and the creation of ice.
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
Definition Food := Set.
(* Set of all food *)


(* Constants (including their meaning) *)

Definition MaximumFridgeTemp := 4.  
(* The minimum temperature at which the FridgeTempSensor gives off the FridgeTempTooHigh signal *)
Definition MaximumFreezerTemp := -5.
(* The minimum temperature at which the FreezerTempSensor gives off the FreezerTempTooHigh signal *)



(* Functions *)
Variable TimeToTemp: Time -> Temp. 




(* Predicates (including their meaning and measurements) *)

Variable FoodPutInFreezer: Food -> Time -> Prop.
(* meaning: food x is put in the freezer at time y *)
(* measurement: look in the freezer *)
Variable FoodPutInFridge: Food -> Time -> Prop.
(* meaning: food x is put in the fridge at time y *)
(* measurement : look in the fridge *)
Variable FoodIsCool: Food -> Time -> Prop.
(* meaning: the temperature of food x is within a margin of error of the MaximumFridgeTemp *)
(* measurement: measure the food's temperature with a thermometer *)
Variable FoodIsFrozen: Food -> Time -> Prop.
(* meaning: the temperature of food x is within a margin of error of the MaximumFreezerTemp *)
(* measurement: measure the food's temperature with a thermometer *)


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
Variable CubedIceButtonIn: Time -> Prop.
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
(* There is ice that needs to be crushed *)
Variable FillReservoir: Time -> Prop.
(* There is room in the IceReservoir*)
Variable DispenceIce: Time -> Prop.
(* The dispenser requires ice *)
Variable PowDispenser: Time -> Prop.
(* Power is flowing between the IceMakerPowerHub and the Dispenser *)
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
Variable FreezerRightTemp: Time -> Prop.
(* The freezer is actively cooling *)
Variable FreezerLightOn: Time -> Prop.
(* The freezer light is turned on *)


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
Variable FridgeRightTemp: Time -> Prop.
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
  forall t:Time,
        WaterButtonIn t
      /\
        PowWaterButton t
    <->
      ColdWaterSignal t
.
(* meaning: if and only if the button to select cold water is pressed and power is supplied to the button to select cold water then the signal for cold water is sent *)

Definition CrushedIceButton :=
  forall t:Time,
        CrushedIceButtonIn t
      /\
        PowCrushedIceButton t
    <->
      CrushedIceSignal t
.
(* meaning: if and only if the button to select crushed ice is pressed and power is supplied to the button to select crushed ice then the signal for crushed ice is sent *)

Definition CubedIceButton :=
  forall t:Time,
        CubedIceButtonIn t
      /\
        PowCubedIceButton t
    <->
        CubedIceSignal t
.
(* meaning: if and only if the button to select cubed ice is pressed and power is supplied to the button to select cubed ice then the signal for cubed ice is sent *)

Definition ControlPanelPowerHub :=
  forall t:Time,
      PowControlPanel t
    <->
        PowWaterButton t
      /\
        PowCrushedIceButton t
      /\
        PowCubedIceButton t
      
.
(* meaning: if and only if power is supplied to the control panel then power is supplied to the water button, crushed ice button, and cubed ice button *)




(* specification of devices in FridgeDoorL *)

Definition FridgeDoorLPowerHub :=
  forall t:Time,
        PowIceMaker t
      /\
        PowControlPanel t
      /\
        PowFridgeDoorSensorL t
    <->
      PowA t
.
(* meaning: power is supplied to PowIceMaker, PowControlPanel and PowFridgeDoorSensorL if and only if power is supplied to PowA *)


Definition FridgeDoorSensorL :=
  forall t:Time,
      FridgeDoorLOpen t
    /\
      PowFridgeDoorSensorL t
  <->
    FridgeDoorSignalL t
.
(* meaning: The signal FridgeDoorSignalL is sent if and only if FridgeDoorLOpen and PowFridgeDoorSensorL are received *)


    
    

(* Specifications of devices in IceMaker *)

Definition IceMakerTray :=
  forall t:Time,
        WaterIn t
      /\
        PowIceMakerTray t
      /\
        ~ReservoirFull t
    <->
      FillReservoir t    
.
(* meaning: iff there's water pressure on the water line, and power is being supplied to the IceMakerTray, and the IceReservoir  is not full, then the IceReservoir is being filled *)


Definition WaterCooler :=
  forall t:Time,
        PowWaterCooler t
      /\
        WaterIn t
      /\
        ColdWaterSignal t
    <->
      DispenseWater t
.
(* meaning: iff power is being supplied to the WaterCooler, and there is water pressure on the water line, and WaterCooler is receiving a cold water signal from WaterButton, then water flows from the WaterCooler to the Dispenser*)

Definition IceReservoir :=
  forall t:Time,
          PowIceReservoir t
        /\
          CrushedIceSignal t
      <->
        CrushIce t
    /\
          PowIceReservoir t
        /\
          CubedIceSignal t
      <->
        CubedIce t   
.
(* meaning: *)

Definition IceMakerPowerHub :=
  forall t:Time,
      PowIceMaker t
    <->
        PowIceMakerTray t
      /\
        PowIceCrusher t
      /\
        PowWaterCooler t
      /\
        PowIceReservoir t
      /\
        PowDispenser t
.
(* iff power is supplied to the IceMakerPowerHub, then power is supplied to the IceMakerTray, 
IceCrusher, WaterCooler, IceReservoir and Dispenser *)

Definition IceCrusher :=
  forall t:Time,
        PowIceCrusher t
      /\
        CrushedIce t
    <->
      DispenseCrushedIce t
.
(* iff power is supplied to the IceCrusher and ice is received, then it will send crushed ice to the dispenser  *)


Definition Dispenser :=
  forall t:Time,
      (
            PowDispenser t
          /\
            DispenseWater t
        <->
          ColdWater t
      )  
    /\
      (
            PowDispenser t
          /\
            DispenceIce t
        <->
          CubedIce t
      )
    /\
      (
            PowDispenser t
          /\
            DispenseCrushedIce t
        <->
          CrushedIce t
      )
.
(*  iff power is supplied to the Dispenser and water is received from the WaterCooler, then ColdWater is dispensed
and iff power is supplied to the Dispenser and cubed ice is received from the IceReservoir, then CubedIce is dispensed 
and iff power is supplied to the Dispenser and crushed ice is received from the IceCrusher, then CrushedIce is dispensed*)




(* Specifications of devices in FridgeDoorR *)

Definition FridgeDoorSensorR :=
  forall t:Time,
        FridgeDoorROpen t
      /\
        PowFridgeDoorSensorR t
    <->
      FridgeDoorSignalR t
.
(* meaning: if and only if power is supplied to the sensor in the right-side fridge door and the right-side fridge door is opened, then a signal is sent from the right-side fridge door *)



Definition FridgeDoorRPowerHub :=
  forall t:Time,
        PowE t
      <->
        PowFridgeDoorSensorR t
.
(* meaning: iff power is being supplied to FridgeDoorRPowerHub, then it is supplying power to FridgeDoorSensorR *)

    



(* Specifications of devices in FreezerDoorR *)

Definition FreezerDoorSensorR :=
  forall t:Time,
        FreezerDoorROpen t
      /\
        PowFreezerDoorSensorR t
    <->
      FreezerDoorSignalR t
.
(* meaning: if and only if power is supplied to the sensor in the right-side freezer door and the right-side freezer door is opened, then a signal is sent from the right-side freezer door *)


Definition FreezerDoorRPowerHub :=
  forall t:Time,
      PowJ t
    <->
      PowFreezerDoorSensorR t
.
(* meaning: iff power is supplied to PowJ, then power is supplied to the right-side freezer door sensor *)




(* Specifications of devices in FreezerDoorL *)

Definition FreezerDoorSensorL :=
  forall t:Time,
        FreezerDoorLOpen t
      /\
        PowFreezerDoorSensorL t
    <->
      FreezerDoorSignalL t
.
(* meaning: iff power is supplied to the sensor in the left-side freezer door and the left-side freezer door is opened, then a signal is sent from the left-side freezer door *)

Definition FreezerDoorLPowerhub :=
  forall t:Time,
      PowF t
    <->
      PowFreezerDoorSensorL t
.
(* meaning: iff power is supplied to PowF, then power is supplied to the left-side freezer door sensor *)




(* Specifications of devices in SmartFridge *)

Definition Powersupply :=
  forall t:Time,
        PowerIn t
    <->
        Pow1 t
      /\
        Pow2 t
.
(* Meaning: DC Power is supplied to FridgePowerhub and FreezerPowerhub iff AC Power is supplied to the Powersupply *)





(* Specifications of devices in Fridge *)

Definition FridgeLight :=
  forall t:Time,
          FridgeDoorSignalL t
        \/
          FridgeDoorSignalR t
      /\
        PowC t
    <->
      FridgeLightOn t
.
(* Meaning: The light of the fridge is turned on if and only if it receives power through PowC and one or more of its doors is open *)

Definition FridgeCooler :=
  forall t:Time,
        FridgeTempTooHigh t
      /\
        PowB t
    <->
      (
        exists d:Time,
          FridgeRightTemp (t + d) 
      )   
.
(* Meaning: When both power is delivered through PowB and the FridgeTempTooHigh signal is received, then the cooler will turn on *)

Definition FridgeTempSensor :=
    forall t:Time,
          TimeToTemp( t ) > MaximumFridgeTemp
        /\
          PowD t
      <->
        FridgeTempTooHigh t
.
(* Meaning: For any moment in time if and only if the temperature is greater than the MaximumFridgeTemp and PowD supplies power then the signal FridgeTempTooHigh is send *)

Definition FridgePowerHub :=
  forall t:Time,
      Pow1 t
    <->
        PowA t
      /\
        PowB t
      /\
        PowC t
      /\
        PowD t
      /\
        PowE t
.
(* Meaning: if and only if power is supplied to Pow1, then power is supplied to PowA, PowB, PowC, PowD and PowE *)

Definition FridgeStorage :=
  forall t:Time,
    forall f:Food,
          FoodPutInFridge f t
        /\
          FridgeRightTemp t
      <->
        (
          exists d:Time,
            FoodIsCool f (t+d)
        )
          
.
(* Iff a certain food f is in the fridge and the fridge cooler has been turned on at time t, then the food wil be cool at time t+d *)




(* Specifications of devices in Freezer *)

Definition FreezerPowerHub :=
  forall t:Time,
      Pow2 t
    <->
        PowF t
      /\
        PowG t
      /\
        PowH t
      /\
        PowI t
      /\
        PowJ t
.
(* meaning: iff power is supplied to Pow2, then power is supplied to PowF, PowG, PowH, PowI, and PowJ *)

Definition FreezerCooler := 
  forall t:Time,
          PowG t
        /\
          FreezerTempTooHigh t
      <->
        (
          exists d:Time, 
            FreezerRightTemp ( t + d )
        )
.
(* Iff power is supplied to PowG and the temperature inside the freezer is too high, then the cooler inside the freezer will turn on *)

Definition FreezerTempSensor :=
  forall t:Time,
        TimeToTemp t > MaximumFreezerTemp
      /\
        PowI t
    <->
      FreezerTempTooHigh t
.
(* Iff the temperature at time t is higher than the maximum allowed freezer temperature and power is supplied to PowI, then a signal is sent that the freezer temperature is too high *)

Definition FreezerLight :=
  forall t:Time,
        PowH t
      /\
        FreezerDoorSignalL t
    <->
      FreezerLightOn t 
.
(* Iff power is supplied to PowH at time t and there is a signal coming from the left-side freezer door at time t, then the freezer light will be turned on at time t *)

Definition FreezerStorage :=
  forall t:Time,
      forall f:Food,
          FoodPutInFreezer f t
        /\
          FreezerRightTemp t
      <->
        (
          exists d:Time,
            FoodIsFrozen f ( t + d )
        )
.
(* For any moment in time if and only if food is in the freezer and the freezer is at the right temp, then the food is frozen at some later moment of time *)


Definition FridgeDoorR :=
    forall t: Time,
            PowE t
          /\
            FridgeDoorROpen t
      <->
          FridgeDoorSignalR t
.
(* For any moment in time iff power is supplied to PowE and the right-side fridge door is opened at time t, then a signal is sent from the right-side
fridge door *)

Definition FreezerDoorR :=
  forall t:Time,
        PowJ t
      /\
        FreezerDoorROpen t
    <->
      FreezerDoorSignalR t
.
(* For any moment in time iff power is supplied to PowJ and the right-side freezer door is opened at time t, then a signal is sent from the right-side
freezer door *)

Definition FreezerDoorL :=
  forall t:Time,
          FreezerDoorLOpen t
        /\
          PowF t
      <->
        FreezerDoorSignalL t
.
(* For any moment in time iff power is supplied to PowF and the left-side freezer door is opened at time t, then a signal is sent from the left-side
freezer door *)

Definition ControlPanel :=
  forall t:Time,
      (    
            PowControlPanel t
          /\
            WaterButtonIn t
        <-> 
          ColdWaterSignal t
      )
    /\
      (
            PowControlPanel t
          /\
            CrushedIceButtonIn t
        <-> 
          CrushedIceSignal t
      )
    /\
      (
            PowControlPanel t
          /\
            CubedIceButtonIn t
        <-> 
          CubedIceSignal t
      )
.
(* For any moment in time, iff power is supplied to PowControlPanel and the button to select water is pressed, then a cold-water signal is sent, and
iff power is supplied to PowControlPanel and the button to select crushed ice is pressed, then a crushed-ice signal is sent, and
iff power is supplied to PowControlPanel and the button to select cubed ice is pressed, then a cubed-ice signal is sent *)

Definition FridgeDoorL :=
  forall t:Time,
        (
            FridgeDoorLOpen t
          /\
            PowA t
        <->
          FridgeDoorSignalL t
        )
    /\
      (
            PowA t
          /\
            WaterIn t
          /\
            WaterButtonIn t
        <->
          ColdWater t
      )
    /\
      (
            PowA t
          /\
            WaterIn t
          /\
            CrushedIceButtonIn t
        <->
          CrushedIce t
      )
    /\
      (
            PowA t
          /\
            WaterIn t
          /\
            CubedIceButtonIn t
        <->
          CubedIce t
      )   
.
(* For any moment in time, if and only if power is supplied to PowA and the fridgedoor is open then, FridgeDoorSignalL is send.
And for any moment in time, if and only if power is supplied to PowA and waterpressure is supplied to WaterIn and the WaterButton is pressed then, ColdWater is delivered to the dispenser.
And for any moment in time, if and only if power is supplied to PowA and waterpressure is supplied to WaterIn and the CrushedIceButton is pressed then, crushed ice is dispensed.
And for any moment in time, if and only if power is supplied to PowA and waterpressure is supplied to WaterIn and the CubedIceButton is pressed then, cubed ice is dispensed. *)


Definition IceMaker :=
  forall t:Time,
      (
            PowIceMaker t
          /\
            WaterIn t
          /\
            ColdWaterSignal t
        <->
          ColdWater t
      )
    /\
      (
            PowIceMaker t
          /\
            WaterIn t
          /\
            CrushedIceSignal t
        <->
          CrushedIce t
      )
    /\
      (
            PowIceMaker t
          /\
            WaterIn t
          /\
            CubedIceSignal t
        <->
          CubedIce t
      )
.

(* 
   iff power is being supplied to the IceMaker and there's water pressure and there's a signal coming from the WaterButton
   then cold water is flowing out of the dispenser.
   
   iff power is being supplied to the IceMaker and there's water pressure and there's a signal coming frm the CrushedIceButton,
   then crushed ice is being dispensed.
   
   iff power is being supplied to the IceMaker and there's water pressure and there's a signal coming from the CubedIceButton,
   then CubedIce is being dispensed.
*)

Definition Freezer :=
  forall t: Time,
    forall f:Food,
        (
              Pow2 t
            /\
              FoodPutInFreezer f t
          <->
              (
                exists d: Time,
                  FoodIsFrozen f (d+t)
              )
        )
      /\
        (
              Pow2 t
            /\
              (
                  FreezerDoorLOpen t
                \/
                  FreezerDoorROpen t
              )
          <->
            FreezerLightOn t
        )
.
(* For any moment in time, it holds that iff power is supplied to the freezer 
   and food is put in the freezer, then at a later moment in time, that food wil be frozen. 
   And iff power is supplied to the freezer and either the right or the left door is open,
   then the freezer light will be on.*)

Definition Fridge :=
  forall t:Time,
    forall f:Food,
        (
              Pow1 t
            /\
                FridgeDoorROpen t
              \/
                FridgeDoorLOpen t
          <->
            FridgeLightOn t
        )
      /\
        (
              Pow1 t
            /\
              FoodPutInFreezer f t
          <->
            (
              exists d:Time,
                FoodIsCool f (t+d)
            )
        )
      /\
        (
              Pow1 t
            /\
              WaterButtonIn t
            /\
              WaterIn t 
          <->
            ColdWater t
        )
      /\  
        (
              Pow1 t
            /\
              CrushedIceButtonIn t
            /\
              WaterIn t
          <->
            CrushedIce t
        )
      /\
        (
              Pow1 t
            /\
              CubedIceButtonIn t
            /\
              WaterIn t
          <->
            CubedIce t
        )
.
(* for any moment in time, 
iff power is supplied to Pow1 at time t and either the right-side or the left-side fridge door is opened at time t, then the fridge light is on at time t, and 
iff power is supplied to Pow1 at time t and food has been put in the freezer at time t, then the food will be cool at time (t+d), and 
iff power is supplied to Pow1 at time t, and the button to select water is pressed at time t, and the waterline is connected at time t, then cold water is dispensed at time t, and 
iff power is supplied to Pow1 at time t, and the button to select crushed ice is pressed at time t, and the waterline is connected at time t, then crushed ice is dispensed at time t, and 
iff power is supplied to Pow1 at time t, and the button to select cubed ice is pressed at time t, and the waterline is connected at time t, then cubed ice is dispensed at time t
 *)


    
      

    

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

(*
Outputs:
    ColdWater
      WaterIn
      PowerIn
      WaterButtonIn
    CubedIce
      WaterIn
      PowerIn
      CubedIceButtonIn
    CrushedIce
      WaterIn
      PowerIn
      CrushedIceButtonIn
    FoodIsFrozen
      PowerIn
      FoodPutInFreezer
    FoodIsCool
      PowerIn
      FoodPutInFridge
    FreezerLightOn
      PowerIn
      FreezerDoorROpen \/ FreezerDoorLOpen
    FridgeLightOn
      PowerIn
      FridgeDoorROpen \/ FridgeDoorLOpen


Inputs:
    WaterIn
    PowerIn
    FreezerDoorROpen
    FreezerDoorLOpen
    WaterButtonIn
    CrushedIceButtonIn
    CubedIceButtonIn
    FridgeDoorLOpen
    FridgeDoorROpen 
    FoodPutInFridge
    FoodPutInFreezer
*)

Definition SmartFridge :=
  forall t:Time,
      (
            WaterIn t
          /\
            PowerIn t
          /\
            WaterButtonIn t
        ->
          ColdWater t
      ) 
    /\
      (
            WaterIn t
          /\
            PowerIn t
          /\
            CubedIceButtonIn t
        ->
          CubedIce t
      )
    /\
      (
            WaterIn t
          /\
            PowerIn t
          /\
            CrushedIceButtonIn t
        ->
          CrushedIce t
      )
    /\
      (
        forall f:Food,
          exists d:Time,
                PowerIn t
              /\
                FoodPutInFreezer f t
            ->
              FoodIsFrozen f ( t + d )
      )
    /\
      (
        forall f:Food,
          exists d:Time,
                PowerIn t
              /\
                FoodPutInFridge f t
            ->
              FoodIsCool f ( t + d )
      )
    /\
      (
            (
                FreezerDoorROpen t
              \/
                FreezerDoorLOpen t
            )
          /\
            PowerIn t
        ->
          FreezerLightOn t
      )
    /\
      (
            (
                FridgeDoorROpen t
              \/
                FridgeDoorLOpen t
            )
          /\
            PowerIn t
        ->
          FridgeLightOn t
      )
.

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

(*

Theorem CorFreezerDoorR :
      FreezerDoorSensorR
    /\
      FreezerDoorRPowerHub
  ->
    FreezerDoorR
.

Theorem CorFreezerDoorL :
      FreezerDoorLPowerhub
    /\
      FreezerDoorSensorL
  ->
    FreezerDoorL
.

Theorem CorFridgeDoorR :
      FridgeDoorSensorR
    /\
      FridgeDoorRPowerHub
  ->
    FridgeDoorR
.

Theorem CorFridgeDoorL :
      FridgeDoorLPowerHub
    /\
      FridgeDoorSensorL
    /\
      ControlPanel
    /\
      IceMaker
  ->
    FridgeDoorL
.

Theorem CorControlpanel :
      WaterButton
    /\
      CrushedIceButton
    /\
      CubedIceButton
    /\
      ControlPanelPowerHub
  ->
    ControlPanel    
.

Theorem CorFridge :
      FridgeStorage
    /\
      FridgeLight
    /\
      FridgeDoorL
    /\
      FridgeCooler
    /\
      FridgeTempSensor
    /\
      FridgeDoorR
    /\
      FridgePowerHub
  ->
    Fridge
.

Theorem CorFreezer :
      FreezerTempSensor
    /\
      FreezerPowerHub
    /\
      FreezerCooler
    /\
      FreezerDoorL
    /\
      FreezerDoorR
    /\
      FreezerLight
    /\
      FreezerStorage
  ->
    Freezer
.

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





Theorem CorTheorem :
        Freezer 
      /\ 
        Powersupply
      /\
         Fridge
    ->
      SmartFridge
.


Proof.
unfold WaterButton. 
unfold CrushedIceButton. 
unfold CubedIceButton.
unfold ControlPanelPowerHub.
unfold FridgeDoorLPowerHub. 
unfold FridgeDoorSensorL.
unfold IceMakerTray.
unfold WaterCooler.
unfold IceReservoir.
unfold IceMakerPowerHub.
unfold IceCrusher. 
unfold Dispenser.
unfold FridgeDoorSenso rR.
unfold FridgeDoorRPowerHub.
unfold FreezerDoorSensorR. 
unfold FreezerDoorRPowerHub.
unfold FreezerDoorSensorL.
unfold FreezerDoorLPowerhub.
unfold Powersupply.
unfold FridgeLight.
unfold FridgeCooler.
unfold FridgeTempSensor.
unfold FridgePowerHub.
unfold FridgeStorage.
unfold FreezerPowerHub.
unfold FreezerCooler.
unfold FreezerTempSensor.
unfold FreezerLight.
unfold FreezerStorage.
tauto.
Qed.
*)


(*
  
*)