-- Created by Deziel0495 --

-- NOTICE
-- This script is licensed under "No License". https://choosealicense.com/no-license/
-- You are allowed to: Download, Use and Edit the Script. 
-- You are not allowed to: Copy, re-release, re-distribute it without my written permission.

------------------------------------
-- DROP WEAPON
------------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
			local ped = PlayerPedId()
			local wep = GetSelectedPedWeapon(ped)
			SetPedDropsWeaponsWhenDead(ped, true)
			RequestAnimDict("mp_weapon_drop")
			if DoesEntityExist(ped) and not IsEntityDead(ped) and not IsPedInAnyVehicle(ped, true) and not IsPauseMenuActive() and IsPedArmed(ped, 7) and IsControlJustPressed(1, 56) then -- INPUT_DROP_WEAPON (F9)
			TaskPlayAnim(ped, "mp_weapon_drop", "drop_bh", 8.0, 2.0, -1, 0, 2.0, 0, 0, 0 )
			SetPedDropsInventoryWeapon(ped, wep, 0, 2.0, 0, -1)
			SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
			ShowNotification("~r~Weapon Dropped")
        end
    end
end)

---------------------------------
-- DISABLE MELEE (PISTOL WHIP)
---------------------------------
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
		local ped = PlayerPedId()
            	if IsPedArmed(ped, 6) then
	    	DisableControlAction(1, 140, true)
            	DisableControlAction(1, 141, true)
            	DisableControlAction(1, 142, true)
        end
    end
end)

-----------------------------------
-- NOTIFICATIONS
-----------------------------------
function ShowNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)	
	DrawNotification(false, false)
end

----------------------------------------
-- MELEE DAMAGE MODIFIER
----------------------------------------
Citizen.CreateThread(function()
    while true do
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_UNARMED"), 0.1)  	
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_NIGHTSTICK"), 0.1) 	
        N_0x4757f00bc6323cfe(GetHashKey("WEAPON_FLASHLIGHT"), 0.1)
	Wait(0)
    end
end)

Citizen.CreateThread(function()
    while true do
        Wait(5)
        SetPedSuffersCriticalHits(PlayerPedId(), false)
    end
end)
