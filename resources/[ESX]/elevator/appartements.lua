------- Add appartments and their positions here

appartements = {
	{ 
		ext = {name = "1 Étage - Accueil", x = -435.99969482422, y = -359.802734375, z = 34.949619293213-0.98, h = 39.06},
		appts = {
			{name = "-1 Étage - Parking public/privé", x = -418.90725708008, y = -344.75177001953, z = 24.231494903564-0.98, h = 39.06},
			{name = "2 Étage - Bureau", x = -490.70501708984, y = -327.82006835938, z = 42.306934356689-0.98, h = 39.06},
			{name = "3 Étage - Operation", x = -452.8098449707, y = -288.46969604492, z = -130.84094238281-0.98, h = 39.06},
			{name = "4 Étage - Chambre", x = -490.84606933594, y = -327.87350463867, z = 69.504379272461-0.98, h = 39.06}
		}
	},
	{ 
		ext = {name = "1 Étage - Hall principal", x = -1096.3503417969, y = -850.11041259766, z = 19.001203536987-0.98, h = 39.06},
		appts = {
			{name = "-1 Étage - Cellules/Garage", x = -1096.4840087891, y = -850.0830078125, z = 4.8841795921326-0.98, h = 39.06},
			{name = "-2 Étage - Salles des preuves/Laboratoire", x = -1096.3061523438, y = -850.20513916016, z = 10.276628494263-0.98, h = 39.06},
			{name = "-3 Étage - Vestiaires/Armurerie", x = -1096.3273925781, y = -850.12567138672, z = 13.687370300293-0.98, h = 39.06},
			{name = "2 Étage - Café", x = -1096.3275146484, y = -850.13134765625, z = 23.038642883301-0.98, h = 39.06},
			{name = "3 Étage - Gym/Bureau", x = -1096.3118896484, y = -850.04034423828, z = 26.827590942383-0.98, h = 39.06},
			{name = "4 Étage - Bureau des Lieutenants", x = -1096.2993164063, y = -850.07202148438, z = 30.757154464722-0.98, h = 39.06},
			{name = "5 Étage - Bureau du Capitaine", x = -1096.3863525391, y = -849.93432617188, z = 34.360733032227-0.98, h = 39.06},
			{name = "6 Étage - Héliport", x = -1096.4581298828, y = -849.95629882813, z = 38.243228912354-0.98, h = 39.06}
		}
	},
	{ 
		ext = {name = "1 Étage - Accueil", x = -442.23495483398, y = -343.259765625, z = 35.005168914795-0.98, h = 39.06},
		appts = {
			{name = "2 Étage - Bureau", x = -442.16943359375, y = -343.24713134766, z = 42.532529449463-0.98, h = 39.06}
		}
	}
}



local nameTimer = 0
local nameOnScreen = false
local nameText = ""

function ShowHelp(text)
	Citizen.InvokeNative(0x8509B634FBE7DA11, "STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayHelp(0, false, 1, 0)
end

function DrawSub(text)
	SetTextFont(1)
	SetTextScale(0.7, 0.7)
	SetTextColour(255, 255, 255, 255)
	SetTextWrap(0.2,  0.8)
	SetTextCentre(1)
	SetTextOutline(true)
	BeginTextCommandDisplayText("STRING")
	AddTextComponentSubstringPlayerName(text)
	EndTextCommandDisplayText(0.8, 0.9)
end

function Teleport(x, y, z, h)
	local e = GetPlayerPed(-1)
	DoScreenFadeOut(800)
	while not IsScreenFadedOut() do
		Wait(10)
	end
	SetEntityCoordsNoOffset(e, x + 0.0, y + 0.0, z + 1.5, 0, 0, 1)
	SetEntityHeading(e, h + 0.0)
	Wait(500)
	DoScreenFadeIn(800)
	while not IsScreenFadedIn() do
		Wait(10)
	end
end

function ShowName(name)
	nameText = name
	nameTimer = GetGameTimer() + 5000
	nameOnScreen = true
end


AddEventHandler("appt:teleport", function(apid, id)
	Teleport(appartements[apid].appts[id].x, appartements[apid].appts[id].y, appartements[apid].appts[id].z, appartements[apid].appts[id].h)
	ShowName(appartements[apid].appts[id].name)
end)

Citizen.CreateThread(function()

	while true do
		Citizen.Wait(1)
		local pedPos = GetEntityCoords(GetPlayerPed(-1), 0)
		for id=1, #appartements do

			-- Immeuble

			local dist_ext = GetDistanceBetweenCoords(appartements[id].ext.x + 0.0, appartements[id].ext.y + 0.0, appartements[id].ext.z + 0.5, pedPos, true)
			if dist_ext < 15 then-- Test de distance pour afficher le marqueur. (Qu'on ne le voit pas de loin)
				if dist_ext <= 0.9 then -- Distance Interne Marqueur pour déclencher la téléportation
					ShowHelp("Appuyez sur ~INPUT_VEH_HORN~ pour prendre l'ascenceur")
					if IsControlJustReleased(0, 86) then
						if #appartements[id].appts == 1 then
							Teleport(appartements[id].appts[1].x, appartements[id].appts[1].y, appartements[id].appts[1].z, appartements[id].appts[1].h)
							ShowName(appartements[id].appts[1].name)
						else
							ShowMenu(id, appartements[id].appts)
						end
					end
				end
				-- Affiche le marqueur. (A commenter si pas besoin du marqueur affiché.)
				DrawMarker(1, appartements[id].ext.x + 0.0, appartements[id].ext.y + 0.0, appartements[id].ext.z + 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 160, 255, 60, 0, 0, 2, 0, 0, 0, 0)
			end

			if dist_ext < 1.9 and dist_ext > 1.2 then
				CloseMenu()
			end
			-- Etages d'immeuble

			local appts = appartements[id].appts
			for appt=1, #appts do
				local dist_in = GetDistanceBetweenCoords(appts[appt].x + 0.0, appts[appt].y + 0.0, appts[appt].z + 0.5, pedPos, true)
				if dist_in < 8 then -- Test de distance pour afficher le marqueur. (Qu'on ne le voit pas de loin)
					if dist_in <= 1.3 then -- Distance Interne Marqueur pour déclencher la téléportation
						ShowHelp("Appuyez sur ~INPUT_VEH_HORN~ pour aller dans le hall")
						if IsControlJustReleased(0, 86) then
							Teleport(appartements[id].ext.x, appartements[id].ext.y, appartements[id].ext.z, appartements[id].ext.h)
							ShowName(appartements[id].ext.name)
						end
					end
					-- Affiche le marqueur. (A commenter si pas besoin du marqueur affiché.)
					DrawMarker(1, appts[appt].x + 0.0, appts[appt].y + 0.0, appts[appt].z + 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.5, 1.5, 0.5, 0, 160, 255, 90, 0, 0, 2, 0, 0, 0, 0)
				end
			end
		end

		if nameOnScreen then
			if GetGameTimer() < nameTimer then
				DrawSub(nameText)
			else
				nameOnScreen = false
			end
		end

	end

end)

