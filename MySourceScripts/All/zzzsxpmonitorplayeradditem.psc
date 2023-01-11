Scriptname zzzSXPMonitorPlayerAddItem extends Quest

zzzSXPController Property XPC Auto
zzzSXPPAlias Property XPAlias Auto
zzzSXPConfig Property XPConfig Auto
zzzSXPGainExpStatPolling Property XPoll Auto

Event OnStoryAddToPlayer( ObjectReference akOwner, ObjectReference akContainer, Location akLocation, Form akItemBase, int aiAcquireType )
	
	if ( akItemBase == None )
		Stop()
		return
	endif
	
	;; Steal ;;
	if ( aiAcquireType == 1 )
		int i_value = akItemBase.GetGoldValue()
		i_value = (XPoll.SXPGameStats[51] * Math.Sqrt(i_value)) as Int
		XPC.IncreaseStealRecord(i_value)
	;; Pickpocket ;;
	elseif ( aiAcquireType == 3 )
		int i_value = XPAlias.GetStealRecordPickpocket()
		XPAlias.ClearStealRecord()
		XPC.GainXPMessage(50, i_value)
	;; from Container ;;
	elseif ( aiAcquireType == 5 )
		if XPConfig.SXPGameStatsContainerToggle
			int i_value = XPAlias.GetStealRecord(akOwner, akContainer)
			XPAlias.ClearStealRecord()
			XPC.GainXPMessage(50, i_value)
		endif
	endif
	
	Stop()
EndEvent