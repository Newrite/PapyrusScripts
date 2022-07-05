[<RequireQualifiedAccess>]
type Element =
  | Fire
  | Frost
  | Shock
  | Poison
  | Absorb

[<RequireQualifiedAccess>]
  type Level =
    | Novice
    | Apperiance
    | Adept
    | Expert
    | Master

type Spell =
  {
    Magnitude: float list
    Duration : float list
    Element  : Element
    Level    : Level
  }

let multiplayActorValue value actorValue mode = value * (1. + (actorValue * mode))

let spellUpdateMagnitude spell actorValue mode =
    { spell with Magnitude = List.map (fun x ->  multiplayActorValue x actorValue mode ) spell.Magnitude }

[<RequireQualifiedAccess>]
module OldDestruction =

  let scalingPerValue level =
    match level with
    | Level.Novice     -> 0.0050
    | Level.Apperiance -> 0.0100
    | Level.Adept      -> 0.0150
    | Level.Expert     -> 0.0200
    | Level.Master     -> 0.0125

  let spellAfterMastery sp destractionValue =
    spellUpdateMagnitude sp destractionValue (scalingPerValue sp.Level)

  let FirstPerkOne spell destractionValue =
    let flat, scale =
      match spell.Element with
      | Element.Fire   ->
        let FireFlat  = 1.150
        let FireScale = 0.002
        (FireFlat, FireScale)
      | Element.Frost  ->
        let FrostFlat  = 1.150
        let FrostScale = 0.002
        (FrostFlat, FrostScale)
      | Element.Shock  ->
        let ShockFlat  = 1.200
        let ShockScale = 0.002
        (ShockFlat, ShockScale)
      | Element.Poison ->
        let PoisonFlat  = 1.150
        let PoisonScale = 0.002
        (PoisonFlat, PoisonScale)
      | Element.Absorb ->
        let AbsorbFlat  = 1.150
        let AbsorbScale = 0.002
        (AbsorbFlat, AbsorbScale)
    let spellFlatBust =
      { spell with Magnitude = List.map (fun x -> x * flat) spell.Magnitude }
    spellUpdateMagnitude spellFlatBust destractionValue scale

  let FirstPerkTwo spell destractionValue =
    let flat, scale =
      match spell.Element with
      | Element.Fire   ->
        let FireFlat  = 1.300
        let FireScale = 0.004
        (FireFlat, FireScale)
      | Element.Frost  ->
        let FrostFlat  = 1.300
        let FrostScale = 0.004
        (FrostFlat, FrostScale)
      | Element.Shock  ->
        let ShockFlat  = 1.400
        let ShockScale = 0.004
        (ShockFlat, ShockScale)
      | Element.Poison ->
        let PoisonFlat  = 1.300
        let PoisonScale = 0.004
        (PoisonFlat, PoisonScale)
      | Element.Absorb ->
        let AbsorbFlat  = 1.300
        let AbsorbScale = 0.004
        (AbsorbFlat, AbsorbScale)
    let spellFlatBust =
      { spell with Magnitude = List.map (fun x -> x * flat) spell.Magnitude }
    spellUpdateMagnitude spellFlatBust destractionValue scale

  let ExpertPerk spell destractionValue =
    let flat, scale =
      match spell.Element with
      | Element.Fire   ->
        let FireFlat  = 1.000
        let FireScale = 0.001
        (FireFlat, FireScale)
      | Element.Frost  ->
        let FrostFlat  = 1.000
        let FrostScale = 0.001
        (FrostFlat, FrostScale)
      | Element.Shock  ->
        let ShockFlat  = 1.150
        let ShockScale = 0.001
        (ShockFlat, ShockScale)
      | Element.Poison ->
        let PoisonFlat  = 1.000
        let PoisonScale = 0.001
        (PoisonFlat, PoisonScale)
      | Element.Absorb ->
        let AbsorbFlat  = 1.000
        let AbsorbScale = 0.001
        (AbsorbFlat, AbsorbScale)        
    let spellFlatBust =
      if spell.Element = Element.Poison then
        { spell with
           Magnitude = List.map (fun x -> x * flat) spell.Magnitude
           Duration  = List.map (fun x -> x * 1.1) spell.Duration }
      else { spell with Magnitude = List.map (fun x -> x * flat) spell.Magnitude }
    spellUpdateMagnitude spellFlatBust destractionValue scale

  let MasterPerk spell =
    let flat =
      match spell.Element with
      | Element.Fire   ->
        1.050
      | Element.Frost  ->
        1.050
      | Element.Shock  ->
        1.050
      | Element.Poison ->
        1.050
      | Element.Absorb ->
        1.050      
    { spell with Magnitude = List.map (fun x -> x * flat) spell.Magnitude }

[<RequireQualifiedAccess>]
module NewDestruction =

  let scalingPerValue level =
    match level with
    | Level.Novice     -> 0.0050
    | Level.Apperiance -> 0.0100
    | Level.Adept      -> 0.0150
    | Level.Expert     -> 0.0200
    | Level.Master     -> 0.0250

  let spellAfterMastery sp destractionValue =
    spellUpdateMagnitude sp destractionValue (scalingPerValue sp.Level)

  let FirstPerk spell destractionValue =
    let flat, scale =
      match spell.Element with
      | Element.Fire   ->
        let FireFlat  = 1.150
        let FireScale = 0.002
        (FireFlat, FireScale)
      | Element.Frost  ->
        let FrostFlat  = 1.150
        let FrostScale = 0.002
        (FrostFlat, FrostScale)
      | Element.Shock  ->
        let ShockFlat  = 1.150
        let ShockScale = 0.002
        (ShockFlat, ShockScale)
      | Element.Poison ->
        let PoisonFlat  = 1.150
        let PoisonScale = 0.002
        (PoisonFlat, PoisonScale)
      | Element.Absorb ->
        let AbsorbFlat  = 1.150
        let AbsorbScale = 0.002
        (AbsorbFlat, AbsorbScale)
    let spellFlatBust =
      if spell.Element = Element.Poison then
        { spell with
           Magnitude = List.map (fun x -> x * flat) spell.Magnitude
           Duration  = List.map (fun x -> multiplayActorValue x destractionValue 0.003 ) spell.Duration }
      else { spell with Magnitude = List.map (fun x -> x * flat) spell.Magnitude }
    spellUpdateMagnitude spellFlatBust destractionValue scale

  let ExpertPerk spell destractionValue =
    let flat, scale =
      match spell.Element with
      | Element.Fire   ->
        let FireFlat  = 1.000
        let FireScale = 0.001
        (FireFlat, FireScale)
      | Element.Frost  ->
        let FrostFlat  = 1.000
        let FrostScale = 0.001
        (FrostFlat, FrostScale)
      | Element.Shock  ->
        let ShockFlat  = 1.000
        let ShockScale = 0.001
        (ShockFlat, ShockScale)
      | Element.Poison ->
        let PoisonFlat  = 1.000
        let PoisonScale = 0.001
        (PoisonFlat, PoisonScale)
      | Element.Absorb ->
        let AbsorbFlat  = 1.000
        let AbsorbScale = 0.001
        (AbsorbFlat, AbsorbScale)        
    let spellFlatBust =
      if spell.Element = Element.Poison then
        { spell with
           Magnitude = List.map (fun x -> x * flat) spell.Magnitude
           Duration  = List.map (fun x -> x * 1.1) spell.Duration }
      else { spell with Magnitude = List.map (fun x -> x * flat) spell.Magnitude }
    spellUpdateMagnitude spellFlatBust destractionValue scale

  let MasterPerk spell =
    let flat =
      match spell.Element with
      | Element.Fire   ->
        1.050
      | Element.Frost  ->
        1.050
      | Element.Shock  ->
        1.050
      | Element.Poison ->
        1.050
      | Element.Absorb ->
        1.050      
    { spell with Magnitude = List.map (fun x -> x * flat) spell.Magnitude }

let sp =
  {
    Magnitude = [ 30.; 7.5; 15.; 3.75 ]
    Duration  = [ 10.; 20.; 10.; 20. ]
    Element   = Element.Poison
    Level     = Level.Master
  }

let spSh =
  {
    Magnitude = [ 150. ]
    Duration  = [ 1. ]
    Element   = Element.Shock
    Level     = Level.Master
  }

let sun =
  {
    Magnitude = [ 250. ]
    Duration  = [ 1. ]
    Element   = Element.Fire
    Level     = Level.Master
  }

let lightStorm =
  {
    Magnitude = [ 150. ]
    Duration  = [ 1. ]
    Element   = Element.Shock
    Level     = Level.Master
  }

let blizzard =
  {
    Magnitude = [ 90. ]
    Duration  = [ 1. ]
    Element   = Element.Frost
    Level     = Level.Master
  }

let virturSteam =
  {
    Magnitude = [ 80. ]
    Duration  = [ 3. ]
    Element   = Element.Frost
    Level     = Level.Master
  }

let virturSteam2 =
  {
    Magnitude = [ 375. ]
    Duration  = [ 3. ]
    Element   = Element.Frost
    Level     = Level.Master
  }

let desctruction = 100.

let spellMaster = OldDestruction.spellAfterMastery virturSteam desctruction

let first = OldDestruction.FirstPerkTwo spellMaster desctruction
printfn "OLD %A" <| first

let expert = OldDestruction.ExpertPerk first desctruction
printfn "OLD %A" <| expert

let master = OldDestruction.MasterPerk expert
printfn "OLD %A" <| master

let spellMaster1 = NewDestruction.spellAfterMastery virturSteam2 desctruction

let first1 = NewDestruction.FirstPerk spellMaster1 desctruction
printfn "OLD %A" <| first1

let expert1 = NewDestruction.ExpertPerk first1 desctruction
printfn "OLD %A" <| expert1

let master1 = NewDestruction.MasterPerk expert1
printfn "OLD %A" <| master1