Scriptname HH_QEUST_B09 extends Quest  
Event OnInIt()
if !(Game.GetPlayer().HasPerk(PickSteel))
Game.GetPlayer().AddPerk(PickSteel)
endif
if !(Game.GetPlayer().HasPerk(PickELV))
Game.GetPlayer().AddPerk(PickELV)
endif
if !(Game.GetPlayer().HasPerk(PickGlass))
Game.GetPlayer().AddPerk(PickGlass)
endif
if !(Game.GetPlayer().HasPerk(PickDW))
Game.GetPlayer().AddPerk(PickDW)
endif
if !(Game.GetPlayer().HasPerk(PickORC))
Game.GetPlayer().AddPerk(PickORC)
endif
if !(Game.GetPlayer().HasPerk(PickEbony))
Game.GetPlayer().AddPerk(PickEbony)
endif
if !(Game.GetPlayer().HasPerk(Nerf))
Game.GetPlayer().AddPerk(Nerf)
endif
if !(Game.GetPlayer().HasPerk(PickSilver))
Game.GetPlayer().AddPerk(PickSilver)
endif
if !(Game.GetPlayer().HasPerk(PickSilver_t2))
Game.GetPlayer().AddPerk(PickSilver_t2)
endif
if !(Game.GetPlayer().HasPerk(PickDaedric))
Game.GetPlayer().AddPerk(PickDaedric)
endif
if !(Game.GetPlayer().HasPerk(PickDB))
Game.GetPlayer().AddPerk(PickDB)
endif
if !(Game.GetPlayer().HasPerk(HH_PR_Perk_on_Player))
Game.GetPlayer().AddPerk(HH_PR_Perk_on_Player)
endif
if !(Game.GetPlayer().HasPerk(Ench_1))
Game.GetPlayer().AddPerk(Ench_1)
endif
if !(Game.GetPlayer().HasPerk(Ench_2))
Game.GetPlayer().AddPerk(Ench_2)
endif
EndEvent

Perk Property PickSteel  Auto
Perk Property PickELV  Auto
Perk Property PickGlass  Auto
Perk Property PickDW  Auto
Perk Property PickORC  Auto
Perk Property PickEbony  Auto
Perk Property Nerf  Auto
Perk Property HH_PR_Perk_on_Player  Auto
Perk Property PickSilver  Auto
Perk Property PickSilver_t2  Auto
Perk Property PickDaedric  Auto
Perk Property PickDB  Auto
Perk Property Ench_1  Auto
Perk Property Ench_2  Auto