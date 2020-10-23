ESX = nil
local PlayerData              = {}

local isPlayerSpawned = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	PlayerData = ESX.GetPlayerData()
end)

local personalmenu = {}

local playerGroup = nil

local MovementType = 0

Citizen.CreateThread(function()
    while true do
		Citizen.Wait(1)
		if IsPedOnFoot(GetPlayerPed(-1)) then 
			SetRadarZoom(1100)
		elseif IsPedInAnyVehicle(GetPlayerPed(-1), true) then
			SetRadarZoom(1100)
		end
    end
end)

function SetData()
	players = {}
	for _, player in ipairs(GetActivePlayers()) do
		local ped = GetPlayerPed(player)
		table.insert( players, player )
	end
end

function startAttitude(lib, anim)
	ESX.Streaming.RequestAnimSet(lib, function()
		SetPedMovementClipset(PlayerPedId(), anim, true)
	end)
end

function startAnim(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, 9999999999, 48, 0, false, false, false)
	end)
end

function openCinematique()
	hasCinematic = not hasCinematic
	if not hasCinematic then -- show
		SendNUIMessage({openCinema = false})
		ESX.UI.HUD.SetDisplay(1.0)
		TriggerEvent('es:setMoneyDisplay', 1.0)
		TriggerEvent('esx_status:setDisplay', 1.0)
		DisplayRadar(true)
		TriggerEvent('ui:toggle', true)
	elseif hasCinematic then -- hide
		SendNUIMessage({openCinema = true})
		ESX.UI.HUD.SetDisplay(0.0)
		TriggerEvent('es:setMoneyDisplay', 0.0)
		TriggerEvent('esx_status:setDisplay', 0.0)
		DisplayRadar(false)
		TriggerEvent('ui:toggle', false)
	end
end

function startAnimAction(lib, anim)
    ESX.Streaming.RequestAnimDict(lib, function()
        TaskPlayAnim(plyPed, lib, anim, 8.0, 1.0, -1, 36, 0, false, false, false)
    end)
end

function startScenario(anim)
	TaskStartScenarioInPlace(PlayerPedId(), anim, 0, false)
end 

-- Hide/Show HUD
local interface = false
local source = true

local interface = true
function openInterface()
	interface = not interface
	if not interface then -- hide
		TriggerEvent('esx_status:setDisplay', 0.0)
	elseif interface then -- show
		TriggerEvent('esx_status:setDisplay', 1.0)
	end
end


function setRagdoll(flag)
	ragdoll = flag
end
  
Citizen.CreateThread(function()
while true do
  Citizen.Wait(0)
  if ragdoll then
	SetPedToRagdoll(GetPlayerPed(-1), 1000, 1000, 0, 0, 0, 0)
  end
end
end)

ragdol = true

RegisterNetEvent("Ragdoll")
AddEventHandler("Ragdoll", function()
  if (ragdol) then
	  setRagdoll(true)
	  ragdol = false
  else
	  setRagdoll(false)
	  ragdol = true
  end
end)

function Text(text)
	SetTextColour(186, 186, 186, 255)
	SetTextFont(0)
	SetTextScale(0.378, 0.378)
	SetTextWrap(0.0, 1.0)
	SetTextCentre(false)
	SetTextDropshadow(0, 0, 0, 0, 255)
	SetTextEdge(1, 0, 0, 0, 205)
	SetTextEntry("STRING")
	AddTextComponentString(text)
	DrawText(0.017, 0.977)
end

local name = GetPlayerName(PlayerId())
local id = GetPlayerServerId(PlayerId())
local isPlayerSpawned = false

local demarches = {
	"Normal",
	"Blessé(e)",
	"Arrogant(e)",
	"Arrogant(e) 2",
	"Arrogant(e) Abusé",
	"Déterminé(e)",
	"Marche Ralenti bras écartés",
	"Marche Ralenti",
	"Marche Lente",
	"Marche Lente bras écartés",
	"Marche Moyenne",
	"Marche Moyenne bras écartés",
	"Marche Rapide",
	"Trottiner",
	"Constipé(e)",
	"Police Gainé",
	"Police Rapide",
	"Légèrement Bourré(e)",
	"Bourré(e)",
	"Défoncé(e)",
	"Femme",
	"Femme Difficile",
	"Sexi",
	"Feu",
	"Feu 1",
	"Feu 2",
	"Franklin",
	"Lamar",
	"Lester",
	"Lester 2",
	"Michael",
	"Shady",
	"Gangster",
	"Gangster 1",
	"Gangster 2",
	"Gangster 3",
	"Gangster 4",
	"Garde Armé",
	"Menotté(e)",
	"Hipster",
	"Désespéré(e)",
	"Brute",
	"Brute 2",
	"Argent",
	"Triste",
	"Travailleur",
	"Insolent",
--[[ 	"Insolent 2", ]]
	"Effrayé(e)",
	"Swag",
	"Difficile",
	"Trainer",
	"Trainer 2",
	"Large"
}

local function OnSelected(self, _, btn, PMenu, menuData, currentButton, currentBtn, currentSlt, result, slide)
	local slide = btn.slidenum
	local btn = btn.name
	local check = btn.unkCheckbox
	if btn == "Options" then -- Ouvre le menu Actions
		OpenMenu("Options")
	elseif btn == "Informations								→" then -- Ouvre le menu Information
		ESX.ShowColoredNotification("~r~Votre steam : ~w~" .. GetPlayerName(PlayerId()) .. " \n ~r~Bon jeux", 40)
		ESX.ShowHelpNotification("ID ".. id .. " | Linked ", true, false, 50)
		-- print("[PMenu] notification started")
	elseif btn == "Réglage des filtres" then --Ouvre le menu des filtres
		OpenMenu("Filtres")
	elseif btn == "Violet & Bleu" then -- Filtre
		SetTimecycleModifier('PPPurple01')
	elseif btn == "Couleur Amplifiée" then	 -- Filtre
		SetTimecycleModifier('BombCamFlash')
	elseif btn == "Vue normal" then	-- Filtre
		SetTimecycleModifier('default')
	end


	if btn == "Optimisation FiveM" then -- Menu Optimisation
		OpenMenu("Optimisation")
	elseif btn == "Optimiser son client FiveM" then -- Menu Optimisation
		DoScreenFadeIn(2000)
		--LoadingPrompt("Optimisation en cours...", 3)
		--exports['progressBars']:startUI(4000, "Optimisation en cours...")
		DoScreenFadeOut(2000)
		exports["a_loadingbar"]:StartDelayedFunction("Optimisation en cours...", 4000, function()
		--Citizen.Wait(2000)
		DoScreenFadeIn(1500)
		ClearAllBrokenGlass()
		ClearAllHelpMessages()
		LeaderboardsReadClearAll()
		ClearBrief()
		ClearGpsFlags()
		ClearPrints()
		ClearSmallPrints()
		ClearReplayStats()
		LeaderboardsClearCacheData()
		ClearFocus()
		ClearHdArea()
		ClearHelp()
		ClearNotificationsPos()
		ClearPedInPauseMenu()
		ClearFloatingHelp()
		ClearGpsPlayerWaypoint()
		ClearGpsRaceTrack()
		ClearReminderMessage()
		ClearThisPrint()
		
		
		--Citizen.Wait(2090)
		
		-- print('Client FiveM optimisé.')
		ESX.ShowColoredNotification("✅ Optimisation effectuée.", 25)
		RemoveLoadingPrompt()
		Citizen.Wait(100)
		PlaySoundFrontend(-1, "Boss_Message_Orange", "GTAO_Boss_Goons_FM_Soundset", 0)
		end)

	elseif btn == "Conseil FiveM" then -- Menu Optimisation
		ESX.ShowHelpNotification('Conseil N°1: Dans les paramètres de votre jeu, baissez au maximum la densité & variété des PNJ.')
		Citizen.Wait(12000)
		ESX.ShowHelpNotification('Conseil N°2: Videz régulièrement le cache de votre FiveM.')
		Citizen.Wait(8000)
		ESX.ShowHelpNotification('Conseil N°3: Inutile de mettre vos paramètres au maximum, privilègiez la performance.')
		Citizen.Wait(11000)
		ESX.ShowHelpNotification('Conseil N°4: De temps en temps, allez sur le menu F5, puis Optimisation et Optimiser votre FiveM.')
		Citizen.Wait(11000)
		--ESX.ShowHelpNotification('Conseil N°5: Un bon processeur et minimum 8GO de ram sont requis pour profiter de l\'experience RP.')
		--Citizen.Wait(12000)
		ESX.ShowHelpNotification('Profitez-bien, bon jeu à vous sur Addiction !')
		Citizen.Wait(5000)
		ESX.ShowHelpNotification('Séquence de tutoriel terminée.')
		PlaySoundFrontend(-1, "Boss_Message_Orange", "GTAO_Boss_Goons_FM_Soundset", 0)
	end


	if btn == "Animations" then 
		OpenMenu("Animations")
	elseif btn == "Debug									→" then 
		ESX.ShowColoredNotification("Ta position à été debug avec succès.", 25)
	elseif btn == "Dormir/se réveiller" then 
		--TriggerEvent("Ragdoll", plyPed)
		while true do 
			Wait(0)
			local myPed = GetPlayerPed(-1)
			SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
			ESX.ShowHelpNotification ("Appuyez sur ~INPUT_CONTEXT~ ou ~INPUT_JUMP~ pour ~b~vous relever")
			ResetPedRagdollTimer(myPed)
			-- _menuPool:CloseAllMenus()
			if IsControlJustPressed(0, 22) or IsControlJustPressed(0, 46) then 
				break
			end
		end
	elseif btn == "Être Sonné" then
		--startAnims("misscarsteal4@actor", "stumble")
		ExecuteCommand('e Stumble')
	elseif btn == "Utils 										→" then
		OpenMenu("personnage")
	elseif btn == "Listes des Carte SIMS						→" then
		openCarteSIM()
	elseif btn == "Mes Clefs						 			→" then
		TriggerEvent("esx_menu:key")
	elseif btn == "Portefeuil									→" then 
		OpenMenu("Portefeuil")
	elseif btn == "Montrer sa carte d'identitée					→" then 
		personalmenu.closestPlayer, personalmenu.closestDistance = ESX.Game.GetClosestPlayer()							
		if personalmenu.closestDistance ~= -1 and personalmenu.closestDistance <= 3.0 then
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(personalmenu.closestPlayer))
		else
			ESX.ShowColoredNotification("Personne à côté de vous", 5)
		end
	elseif btn == "Voir sa carte d'identitée						→" then
		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()))
	elseif btn == "Montrer son permis de conduire				→" then
		if personalmenu.closestDistance ~= -1 and personalmenu.closestDistance <= 3.0 then
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(personalmenu.closestPlayer), 'driver')
		else
			ESX.ShowColoredNotification("Personne à côté de vous", 5)
		end
	elseif btn == "Voir son permis de conduire					→" then 
		TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(PlayerId()), 'driver')
	elseif btn == "Montrer son permis d'armes					→" then 
		if personalmenu.closestDistance ~= -1 and personalmenu.closestDistance <= 3.0 then
			TriggerServerEvent('jsfour-idcard:open', GetPlayerServerId(PlayerId()), GetPlayerServerId(personalmenu.closestPlayer), 'weapon')
		else
			ESX.ShowColoredNotification("Personne à côté de vous", 5)
		end
	end
	--------------------------------------------------------------------------
	--------------------------------------------------------------------------
	--------------------------------------------------------------------------
	--------------------------------------------------------------------------
	----------------------------------Animations------------------------------
	--------------------------------------------------------------------------
	--------------------------------------------------------------------------
	--------------------------------------------------------------------------
	--------------------------------------------------------------------------
	--------------------------------------------------------------------------
	if btn == "S'asseoir" then
		OpenMenu("Assis")
	elseif btn == "Menu Animations" then
		TriggerEvent("yzklife:open_menu")
		CloseMenu(force)
	elseif btn == "Attente" then
		OpenMenu("Attente")
	elseif btn == "Contre un Mur" then
		--startAnims("amb@world_human_leaning@male@wall@back@foot_up@idle_a", "idle_a", 9)
		ExecuteCommand('e lean4')
	elseif btn == "Contre un Mur 2" then
		--startAnims("amb@world_human_leaning@male@wall@back@legs_crossed@base", "base")
	elseif btn == "Contre un Mur 3" then
		--startAnims("amb@world_human_leaning@male@wall@back@hands_together@idle_a", "idle_b")
	elseif btn == "Contre un Mur 4" then
		--startAnims("misstrvram_4", "thugs_idle_b")
	elseif btn == "Contre un Mur (Aléatoire)" then
		startScenario("world_human_leaning")
	elseif btn == "Attendre" then 
		--startAnim("missbigscore2aig_3", "wait_for_van_c", 9)
	elseif btn == "Blessé" then
		--startAnims("amb@world_human_stupor@male@base", "base", 9)
	elseif btn == "Siège" then 
		--startAnims("timetable@ron@ig_3_couch", "base", 9)
		ExecuteCommand('e sitchair4')
	elseif btn == "Par Terre" then 
		--startAnims("anim@heists@fleeca_bank@ig_7_jetski_owner", "owner_idle", 9)
		ExecuteCommand('e sit5')
	elseif btn == "S'acouder 1" then 
		startScenarios("PROP_HUMAN_BUM_SHOPPING_CART", 9)
	elseif btn == "S'acouder 2" then 
		startAnims("missheistdockssetup1ig_12@base", "talk_gantry_idle_base_worker2")
	elseif btn == "S'acouder 3" then 
		startAnims("missheistdockssetup1ig_12@base", "talk_gantry_idle_base_worker4")
	elseif btn == "Accolades" then
		OpenMenu("Accolades")
	elseif btn == "Tchek Gang" then
		startAnims("mp_ped_interaction", "hugs_guy_a")
	elseif btn == "Calin" then 
		startAnims("mp_ped_interaction", "kisses_guy_a")
	elseif btn == "Calin Proche" then 
		startAnims("mp_ped_interaction", "kisses_guy_b")
	elseif btn == "Armes" then
		OpenMenu("Armes")
	elseif btn == "Arme Gang" then
		ExecuteCommand('gang')
	elseif btn == "S'Allonger" then
		OpenMenu("S'Allonger")
	elseif btn == "Droit" then
		--startAnims("anim@gangops@morgue@table@", "body_search")
		ExecuteCommand('e passout3')
	elseif btn == "Bras écartés" then
		--startAnims("mini@cpr@char_b@cpr_def", "cpr_pumpchest_idle")
		ExecuteCommand('e passout4')
	elseif btn == "Sur le ventre" then
		--startAnims("missarmenian2", "drunk_loop")
		ExecuteCommand('e passout')
	elseif btn == "Méditer" then 
		--startAnims("rcmcollect_paperleadinout@", "meditiate_idle")
		ExecuteCommand('e meditate')
	elseif btn == "Ceinture" then 
		startAnim("amb@code_human_wander_idles_cop@male@static", "static")
	elseif btn == "Croiser les Bras" then 
		--startAnim("anim@amb@nightclub@peds@", "rcmme_amanda1_stand_loop_cop")
		ExecuteCommand('e cop2')
	elseif btn == "Danses" then 
		OpenMenu("Danses")
	elseif btn == "Danse 1" then 
		startAnims("anim@amb@nightclub@dancers@podium_dancers@", "hi_dance_facedj_17_v2_male^5")
	elseif btn == "Danse 2" then 
		startAnims("anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_down")
	elseif btn == "Danse 3" then 
		startAnims("anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "high_center")
	elseif btn == "Danse 4" then 
		startAnims("anim@amb@nightclub@mini@dance@dance_solo@male@var_b@", "high_center_up")
	elseif btn == "Danse 5" then 
		startAnims("anim@amb@casino@mini@dance@dance_solo@female@var_a@", "med_center")
	elseif btn == "Danse 6" then 
		startAnims("misschinese2_crystalmazemcs1_cs", "dance_loop_tao")
	elseif btn == "Danse 7" then 
		startAnims("misschinese2_crystalmazemcs1_ig", "dance_loop_tao")
	elseif btn == "Danse 8" then 
		startAnims("missfbi3_sniping", "dance_m_default")
	elseif btn == "Danse 9" then 
		startAnims("anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "med_center_up")
	elseif btn == "Danse 10" then 
		startAnims("anim@amb@nightclub@dancers@solomun_entourage@", "mi_dance_facedj_17_v1_female^1")
	elseif btn == "Danse 11" then 
		startAnims("anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center")
	elseif btn == "Danse 12" then 
		startAnims("anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up")
	elseif btn == "Danse 13" then 
		startAnims("anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^1")
	elseif btn == "Danse 14" then 
		startAnims("anim@amb@nightclub@dancers@crowddance_facedj@hi_intensity", "hi_dance_facedj_09_v2_female^3")
	elseif btn == "Danse 15" then 
		startAnims("anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "high_center_up")
	elseif btn == "Danse Tranquille 1" then 
		startAnims("anim@amb@nightclub@mini@dance@dance_solo@male@var_a@", "low_center")
	elseif btn == "Danse Tranquille 2" then 
		startAnims("anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center_down")
	elseif btn == "Danse Tranquille 3" then 
		startAnims("move_clown@p_m_zero_idles@", "fidget_short_dance")
	elseif btn == "Danse Tranquille 4" then 
		startAnims("move_clown@p_m_two_idles@", "fidget_short_dance")
	elseif btn == "Danse Tranquille 5" then 
		startAnims("timetable@tracy@ig_8@idle_b", "idle_d")
	elseif btn == "Danse Tranquille 6" then 
		startAnims("anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center")
	elseif btn == "Danse Tranquille 7" then 
		startAnims("anim@amb@nightclub@mini@dance@dance_solo@female@var_a@", "low_center_down")
	elseif btn == "Danse Tranquille 8" then 
		startAnims("anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "low_center")
	elseif btn == "Danse Active 1" then 
		startAnims("special_ped@mountain_dancer@monologue_3@monologue_3a", "mnt_dnc_buttwag")
	elseif btn == "Danse Active 2" then 
		startAnims("anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_11_buttwiggle_b_laz")
	elseif btn == "Danse Active 3" then 
		startAnims("timetable@tracy@ig_5@idle_a", "idle_a")
	elseif btn == "Danse Active 4" then 
		startAnims("anim@amb@casino@mini@dance@dance_solo@female@var_b@", "high_center")
	elseif btn == "Danse Active 5" then 
		startAnims("anim@mp_player_intcelebrationfemale@the_woogie", "the_woogie")
	elseif btn == "Danse Active 6" then 
		startAnims("anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center")
	elseif btn == "Danse Active 7" then 
		startAnims("anim@amb@nightclub@mini@dance@dance_solo@female@var_b@", "high_center_up")
	elseif btn == "Danse Active 8" then 
		startAnims("anim@mp_player_intcelebrationmale@uncle_disco", "uncle_disco")
	elseif btn == "Danse Active 9" then 
		startAnims("timetable@tracy@ig_5@idle_a", "idle_a")
	elseif btn == "Danse Active 10" then 
		startAnims("timetable@tracy@ig_5@idle_a", "idle_b")
	elseif btn == "Danse Active 11" then 
		startAnims("timetable@tracy@ig_5@idle_b", "idle_e")
	elseif btn == "Danse Active 12" then 
		startAnims("timetable@tracy@ig_5@idle_b", "idle_d")
	elseif btn == "Danse Active 13" then 
		startAnims("anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_15_shimmy_laz")
	elseif btn == "Danse Active 14" then 
		startAnims("anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_17_smackthat_laz")
	elseif btn == "Danse Active 15" then 
		startAnims("anim@amb@nightclub@lazlow@hi_podium@", "danceidle_hi_17_spiderman_laz")
	elseif btn == "Danse Active 16" then 
		startAnims("anim@mp_player_intcelebrationmale@salsa_roll", "salsa_roll")
	elseif btn == "Danse Active 17" then 
		startAnims("anim@amb@nightclub@lazlow@hi_podium@", "danceidle_trans_07_hi_to_mi_laz")
	elseif btn == "Danse Active 18" then 
		startAnims("anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_13_enticing_laz")
	elseif btn == "Danse Active 19" then 
		startAnims("anim@amb@nightclub@lazlow@hi_podium@", "danceidle_mi_11_simplepoint_laz")
	elseif btn == "Danse Active 20" then 
		startAnims("anim@amb@nightclub@djs@black_madonna@", "dance_b_idle_a_blamadon")
	elseif btn == "Se sentir Mal" then 
		startAnims("missfam5_blackout", "pass_out")
	elseif btn == "Arme Gang 2" then 
		startAnim("oddjobs@suicide", "bystander_pointinto")
	elseif btn == "Regarder l'arme" then 
		startAnim("mp_corona@single_team", "single_team_intro_one")
	elseif btn == "Suicide" then 
		--startAnims("mp_suicide", "pistol")
		ExecuteCommand('e fallover2')
	end


	if btn == "Réglage Hud" then 
		OpenMenu("Réglage Hud")
	elseif btn == "Afficher le mode cinématique" then 
		openCinematique()
	elseif btn == "Enlever HUD faim/soif" then 
		openInterface()
	elseif btn == "Informations Personnages" then 
		OpenMenu("Informations Personnages")
	elseif btn == "Mes Informations" then 
		ESX.ShowNotification("~g~Votre Nom Steam : ~w~" .. GetPlayerName(PlayerId()) .. " \n~g~Votre Id : ~w~" .. id .."")
	elseif btn == "Changer de Personnages" then 
		CloseMenu(force)
		NetworkSetVoiceActive(0)
		ESX.ShowColoredNotification("Veuillez patienter...", 120)
		Citizen.Wait(500)
		--TriggerServerEvent("kashactersS:SetupCharacters")
		--TriggerEvent("kashactersC:SetupCharacters")
		TriggerEvent('kashactersC:ReloadCharacters')
	end

	if btn == "Contrastes" then 
		OpenMenu("Contraste")
	elseif btn == "Eclaircissement" then 
		SetTimecycleModifier('canyon_mission')
	elseif btn == "Contraste" then 
		SetTimecycleModifier('player_transition_no_scanlines')
	elseif btn == "Fin du Monde" then 
		OpenMenu("Fin du Monde")
	elseif btn == "Fin du Monde 1" then 
		SetTimecycleModifier('New_sewers')
	elseif btn == "Gris Fin du Monde" then 
		SetTimecycleModifier('NG_filmic20')
	elseif btn == "Grésillement" then 
		OpenMenu("Grésillement")
	elseif btn == "Grésillement 1" then 
		SetTimecycleModifier('BeastIntro01')
	elseif btn == "Grésillement 2" then 
		SetTimecycleModifier('spectator2')
	elseif btn == "Brouillard" then 
		OpenMenu("Brouillard")
	elseif btn == "Brouillard 1" then 
		SetTimecycleModifier('v_abattoir')
	elseif btn == "Brouillard Eclairci" then 
		SetTimecycleModifier('v_bahama')
	elseif btn == "Gros Brouillard" then 
		SetTimecycleModifier('v_cashdepot')
	elseif btn == "Vue / Couleur Amplifié" then 
		OpenMenu("Vue / Couleur Amplifié")
	elseif btn == "Vue & lumières améliorées" then 
		SetTimecycleModifier('Tunnel')
	elseif btn == "Couleurs amplifiées" then 
		SetTimecycleModifier('rply_saturation')
	elseif btn == "Couleurs amplifiées 2" then 
		SetTimecycleModifier('BombCamFlash')
	elseif btn == "Couleurs" then 
		OpenMenu("Couleurs")
	elseif btn == "Noir & Blanc" then 
		SetTimecycleModifier('rply_saturation_neg')
	elseif btn == "Violet et Bleu" then 
		SetTimecycleModifier('PPPurple01')
	elseif btn == "Rouge" then 
		SetTimecycleModifier('li')
	elseif btn == "Sous l'Eau" then 
		SetTimecycleModifier('SALTONSEA')
	end


	if btn == "Divers" then 
		OpenMenu("Divers")
	elseif btn == "Synchroniser mon personnage" then 
		--TriggerEvent('skinchanger:modelSaved')
		TriggerServerEvent('SavellPlayer')
		PlaySoundFrontend(-1, "Boss_Message_Orange", "GTAO_Boss_Goons_FM_Soundset", 0)
	elseif btn == "Mes Clés" then 
		CloseMenu(force)
		TriggerEvent('nwx:openKeysMenu')
	elseif btn == "Mes Animaux" then 
		CloseMenu(force)
		TriggerEvent("pet:open")
	end


	if btn == "Genoux sur le sol" then 
		startAnims("amb@medic@standing@kneel@base", "base")
	elseif btn == "Chill" then 
		startAnims("missheistpaletoscoresetupleadin", "rbhs_mcs_1_leadin")
	elseif btn == "Posay" then 
		startAnims("missfam2leadinoutmcs3", "onboat_leadin_pornguy_a")
	elseif btn == "Insolent" then 
		OpenMenu("Insolent")
	elseif btn == "J'en Peu Plus" then 
		--startAnims("anim@arena@celeb@flat@solo@no_props@", "giggle_a_player_a")
		ExecuteCommand('e clapangry')
	elseif btn == "Nettoyer le nez" then 
		startAnims("anim@mp_player_intcelebrationmale@nose_pick", "nose_pick")
	elseif btn == "Baise mon doigt" then 
		startAnims("anim@mp_player_intcelebrationmale@finger", "finger")
	elseif btn == "Prend mon doigt" then 
		--startAnims("random@shop_gunstore", "_negative_goodbye")
		ExecuteCommand('e crossarms6')
	elseif btn == "Nananere" then 
		startAnims("anim@mp_player_intcelebrationmale@thumb_on_ears", "thumb_on_ears")
	elseif btn == "Vomir" then 
		startAnims("missfam5_blackout", "vomit")
	elseif btn == "Chuuuuute" then 
		startAnims("anim@mp_player_intcelebrationmale@shush", "shush")
	elseif btn == "Poule Mouillé" then 
		startAnims("anim@mp_player_intcelebrationmale@chicken_taunt", "chicken_taunt")
	elseif btn == "Doigt Simple" then 
		--startAnims("anim@mp_player_intselfiethe_bird", "enter")
		ExecuteCommand('e finger')
	elseif btn == "Doigt Double" then 
		--startAnim("mp_player_int_upperfinger", "mp_player_int_finger_01")
		ExecuteCommand('e finger2')
	elseif btn == "Uriner" then 
		startAnims("misscarsteal2peeing", "peeing_intro")
	elseif btn == "Pluie d\'argent" then 
		startAnims("anim@mp_player_intcelebrationmale@raining_cash", "raining_cash")
	elseif btn == "Pluie d\'argent CLP" then 
		startAnims("anim@arena@celeb@flat@solo@props@", "make_it_rain_b_player_b")
	elseif btn == "Montrer ses Seins" then 
		startAnim("mini@strip_club@backroom@", "stripper_b_backroom_idle_b")
	elseif btn == "Coeur" then 
		startAnims("mini@hookers_spvanilla", "idle_a")
	elseif btn == "Gratter ses Couilles" then 
		startAnim("mp_player_int_uppergrab_crotch", "mp_player_int_grab_crotch")
	elseif btn == "Gratter son Cul" then 
		startAnim("mp_player_int_upperarse_pick", "mp_player_int_arse_pick")
	elseif btn == "Dans ton Cul" then 
		startAnims("anim@mp_player_intcelebrationmale@dock", "dock")
	elseif btn == "Poses" then 
		OpenMenu("Poses")
	elseif btn == "Dormir sur place" then 
		--startAnim("mp_sleep", "sleep_loop")
		ExecuteCommand('e fallasleep')
	elseif btn == "PLS" then 
		--startAnims("timetable@tracy@sleep@", "idle_c")
		ExecuteCommand('e sleep')
	elseif btn == "Rouler par terre" then 
		startAnims("missfinale_a_ig_2", "trevor_death_reaction_pt")
	elseif btn == "Blessé au sol" then 
		startAnims("combat@damage@rb_writhe", "rb_writhe_loop")
	elseif btn == "Desespéré" then 
		startAnims("rcmnigel1c", "idle_d")
	elseif btn == "Haleine" then 
		--startAnims("re@construction", "out_of_breath")
		ExecuteCommand('e outofbreath')
	elseif btn == "Zombie" then 
		startAnims("special_ped@zombie@monologue_1@monologue_1c", "iamundead_2")
	elseif btn == "Pataugeoire" then 
		startAnims("move_m@wading", "walk")
	elseif btn == "Prêt à ce battre" then 
		--startAnims("anim@heists@heist_corona@single_team", "single_team_intro_two")
		ExecuteCommand('e crossarms3')
	elseif btn == "Faire le mec" then 
		startScenarios("WORLD_HUMAN_MUSCLE_FLEX", 9)
	elseif btn == "Faire la statue" then 
		startScenarios("WORLD_HUMAN_HUMAN_STATUE", 9)
	elseif btn == "Se Rendre" then 
		--startAnims("random@arrests@busted", "idle_c")
		ExecuteCommand("e surrender")
	elseif btn == "Se Rendre Debout" then 
		startAnim("random@arrests@busted", "idle_c")
	elseif btn == "Hanche" then 
		startAnims("special_ped@impotent_rage@base", "base")
	elseif btn == "Expressions" then 
		OpenMenu("Expressions")
	elseif btn == "Pouces" then 
		startAnims("anim@arena@celeb@flat@solo@no_props@", "thumbs_down_a_player_a")
	elseif btn == "Mort de rire" then 
		startAnims("anim@arena@celeb@flat@solo@no_props@", "taunt_d_player_b")
	elseif btn == "Stressé" then 
		--startAnims("rcmme_tracey1", "nervous_loop")
		ExecuteCommand('e nervous3')
	elseif btn == "Paix" then 
		startAnims("anim@mp_player_intcelebrationmale@peace", "peace")
	elseif btn == "Mains sur la Tête" then 
		startAnims("anim@mp_player_intcelebrationmale@face_palm", "face_palm")
	elseif btn == "Respect" then 
		startAnim("mp_player_int_upperbro_love", "mp_player_int_bro_love_fp")
	elseif btn == "Respect 2" then 
		startAnims("anim@mp_player_intcelebrationmale@bro_love", "bro_love")
	elseif btn == "Reflexion" then 
		--startAnims("misscarsteal4@aliens", "rehearsal_base_idle_director")
		ExecuteCommand('e think')
	elseif btn == "Victoire" then 
		startAnims("mini@tennisexit@", "tennis_outro_win_01_female")
	elseif btn == "T'a Dead ça Chakal" then 
		startAnims("anim@mp_player_intcelebrationmale@thumbs_up", "thumbs_up")
	elseif btn == "Craquer ses Poings" then 
		startAnims("anim@mp_player_intcelebrationmale@knuckle_crunch", "knuckle_crunch")
	elseif btn == "Salut Militaire" then 
		--startAnim("anim@mp_player_intuppersalute", "idle_a")
		ExecuteCommand('e salute3')
	elseif btn == "Vagos" then 
		startAnim("amb@code_human_in_car_mp_actions@v_sign@std@rds@base", "idle_a")
	elseif btn == "Families" then 
		--startAnim("mp_player_int_uppergang_sign_a", "mp_player_int_gang_sign_a")
		ExecuteCommand('e gangsign')
	elseif btn == "Ballas" then 
		--startAnim("mp_player_int_uppergang_sign_b", "mp_player_int_gang_sign_b")
		ExecuteCommand('e gangsign2')
	elseif btn == "GG !" then 
		--startAnims("random@street_race", "_streetracer_accepted")
		ExecuteCommand('e crossarms4')
	elseif btn == "Stop" then 
		--startAnim("anim@heists@ornate_bank@chat_manager", "fail")
		ExecuteCommand('e no')
	end


	if btn == "Débug" then 
		TriggerEvent("playerSpawned")
		ESX.ShowNotification("~g~Débug : \n~w~Dernière Position.", 25)
	end 

	if slide == 1 and btn == "Démarches" then 
		ResetPedMovementClipset(PlayerPedId()) return
	elseif slide == 2 and btn == "Démarches" then 
		WalkMenuStart("move_m@injured")
	elseif slide == 3 and btn == "Démarches" then 
		WalkMenuStart("move_f@arrogant@a")
	elseif slide == 4 and btn == "Démarches" then 
		WalkMenuStart("move_f@chichi")
	elseif slide == 5 and btn == "Démarches" then 
		WalkMenuStart("move_f@maneater")
	elseif slide == 6 and btn == "Démarches" then 
		WalkMenuStart("move_m@brave")
	elseif slide == 7 and btn == "Démarches" then 
		WalkMenuStart("move_characters@jimmy@slow@")
	elseif slide == 8 and btn == "Démarches" then 
		WalkMenuStart("move_m@casual@d")
	elseif slide == 9 and btn == "Démarches" then 
		WalkMenuStart("move_m@casual@a")
	elseif slide == 10 and btn == "Démarches" then 
		WalkMenuStart("move_m@casual@e")
	elseif slide == 11 and btn == "Démarches" then 
		WalkMenuStart("move_m@casual@b")
	elseif slide == 12 and btn == "Démarches" then 
		WalkMenuStart("move_m@casual@f")
	elseif slide == 13 and btn == "Démarches" then 
		WalkMenuStart("move_m@casual@c")
	elseif slide == 14 and btn == "Démarches" then 
		WalkMenuStart("move_m@quick")
	elseif slide == 15 and btn == "Démarches" then 
		WalkMenuStart("move_m@confident")
	elseif slide == 16 and btn == "Démarches" then 
		WalkMenuStart("move_m@business@a")
	elseif slide == 17 and btn == "Démarches" then 
		WalkMenuStart("move_m@business@c")
	elseif slide == 18 and btn == "Démarches" then 
		WalkMenuStart("move_m@business@b")
	elseif slide == 19 and btn == "Démarches" then 
		WalkMenuStart("move_m@buzzed")
	elseif slide == 20 and btn == "Démarches" then 
		WalkMenuStart("move_m@drunk@a")
	elseif slide == 21 and btn == "Démarches" then 
		WalkMenuStart("move_f@femme@")
	elseif slide == 22 and btn == "Démarches" then 
		WalkMenuStart("move_f@tough_guy@")
	elseif slide == 23 and btn == "Démarches" then 
		WalkMenuStart("move_f@sexy@a")
	elseif slide == 24 and btn == "Démarches" then 
		WalkMenuStart("move_characters@franklin@fire")
	elseif slide == 25 and btn == "Démarches" then 
		WalkMenuStart("move_characters@michael@fire")
	elseif slide == 26 and btn == "Démarches" then  
		WalkMenuStart("move_m@fire")
	elseif slide == 27 and btn == "Démarches" then 
		WalkMenuStart("move_p_m_one")
	elseif slide == 28 and btn == "Démarches" then 
		WalkMenuStart("anim_group_move_lemar_alley")
	elseif slide == 29 and btn == "Démarches" then 
		WalkMenuStart("move_heist_lester")
	elseif slide == 30 and btn == "Démarches" then 
		WalkMenuStart("move_lester_caneup")
	elseif slide == 31 and btn == "Démarches" then 
		WalkMenuStart("move_ped_bucket")
	elseif slide == 32 and btn == "Démarches" then 
		WalkMenuStart("move_m@shadyped@a")
	elseif slide == 33 and btn == "Démarches" then 
		WalkMenuStart("move_m@gangster@generic")
	elseif slide == 34 and btn == "Démarches" then 
		WalkMenuStart("move_m@gangster@ng")
	elseif slide == 35 and btn == "Démarches" then 
		WalkMenuStart("move_m@gangster@var_e")
	elseif slide == 36 and btn == "Démarches" then 
		WalkMenuStart("move_m@gangster@var_f")
	elseif slide == 37 and btn == "Démarches" then 
		WalkMenuStart("move_m@gangster@var_i")
	elseif slide == 38 and btn == "Démarches" then 
		WalkMenuStart("move_m@prison_gaurd")
	elseif slide == 39 and btn == "Démarches" then 
		WalkMenuStart("move_m@prisoner_cuffed")
	elseif slide == 40 and btn == "Démarches" then 
		WalkMenuStart("move_m@hipster@a")
	elseif slide == 41 and btn == "Démarches" then 
		WalkMenuStart("move_m@hobo@a")
	elseif slide == 42 and btn == "Démarches" then 
		WalkMenuStart("move_p_m_zero_janitor")
	elseif slide == 43 and btn == "Démarches" then 
		WalkMenuStart("move_p_m_zero_slow")
	elseif slide == 44 and btn == "Démarches" then 
		WalkMenuStart("move_m@money")
	elseif slide == 45 and btn == "Démarches" then 
		WalkMenuStart("move_m@sad@a")
	elseif slide == 46 and btn == "Démarches" then 
		WalkMenuStart("move_m@sassy")
	elseif slide == 47 and btn == "Démarches" then 
		WalkMenuStart("move_f@sassy")
	elseif slide == 48 and btn == "Démarches" then 
		WalkMenuStart("move_f@scared")
	elseif slide == 49 and btn == "Démarches" then 
		WalkMenuStart("move_m@swagger")
	elseif slide == 50 and btn == "Démarches" then 
		WalkMenuStart("move_m@tough_guy@")
	elseif slide == 51 and btn == "Démarches" then
		WalkMenuStart("clipset@move@trash_fast_turn")
	elseif slide == 52 and btn == "Démarches" then
		WalkMenuStart("missfbi4prepp1_garbageman")
	elseif slide == 53 and btn == "Démarches" then
		WalkMenuStart("move_m@bag")
	elseif slide == 54 and btn == "Démarches" then
		startAttitude("move_m@tool_belt@a","move_m@tool_belt@a")
	end

	if btn == "Tricks (Moto)" then 
		OpenMenu("Tricks (Moto)")
	elseif btn == "Moto - Jambe droite" then 
		startAnims("rcmextreme2atv", "idle_b")
	elseif btn == "Moto - Jambe gauche" then 
		startAnims("rcmextreme2atv", "idle_c")
	elseif btn == "Moto - Droite et Gauche" then 
		startAnims("rcmextreme2atv", "idle_d")
	elseif btn == "Moto - Debout" then 
		startAnims("rcmextreme2atv", "idle_e")
	end

	if btn == "Poses" then 
		OpenMenu("Poses")
	elseif btn == "Se rendre" then
		--startAnims("random@arrests@busted", "idle_c")
		ExecuteCommand('e surrender')
	elseif btn == "Pêcheur" then
		startScenarios("world_human_stand_fishing", 9)
	elseif btn == "Police : Enquêter" then
		startAnims("amb@code_human_police_investigate@idle_b", "idle_f")
	elseif btn == "Police : Parler à la radio" then
		startAnim("random@arrests", "generic_radio_chatter")
	elseif btn == "Police : Circulation" then
		startScenarios("WORLD_HUMAN_CAR_PARK_ATTENDANT", 9)
	elseif btn == "Police : Jumelles" then
		startScenarios("WORLD_HUMAN_BINOCULARS", 9)
	elseif btn == "Agriculture : Récolter" then
		startScenarios("world_human_gardener_plant", 9)
	elseif btn == "Dépanneur : Réparer le moteur" then
		startAnim("mini@repair", "fixing_a_ped")
	elseif btn == "Médecin : Observer" then
		startScenarios("CODE_HUMAN_MEDIC_KNEEL", 9)
	elseif btn == "Taxi : Parler au client" then
		startAnim("oddjobs@taxi@driver", "leanover_idle")
	elseif btn == "Taxi : Donner la facture" then
		startAnim("oddjobs@taxi@cyi", "std_hand_off_ps_passenger")
	elseif btn == "Epicier : Donner les courses" then
		startAnim("mp_am_hold_up", "purchase_beerbox_shopkeeper")
	elseif btn == "Barman : Servir un shot" then
		startAnim("mini@drinking", "shots_barman_b")
	elseif btn == "Journaliste : Prendre une photo" then
		startScenarios("WORLD_HUMAN_PAPARAZZI", 9)
	elseif btn == "Tout : Prendre des notes" then
		startScenarios("WORLD_HUMAN_CLIPBOARD", 9)
	elseif btn == "Tout : Coup de marteau" then
		startScenarios("WORLD_HUMAN_HAMMERING", 9)
	elseif btn == "SDF : Faire la manche" then
		startScenarios("WORLD_HUMAN_BUM_FREEWAY", 9)
	end

	if btn == "Souffrance" then 
		startAnims("anim@heists@prison_heistig_5_P1_rashkovsky_idle", "idle_180")
	elseif btn == "Sports" then 
		OpenMenu("Sports")
	elseif btn == "Montrer ses muscles" then 
		startAnim("amb@world_human_muscle_flex@arms_at_side@base", "base")
	elseif btn == "Barre de musculation" then 
		startAnim("amb@world_human_muscle_free_weights@male@barbell@base", "base")
	elseif btn == "Faire des pompes" then 
		startAnims("amb@world_human_push_ups@male@base", "base")
	elseif btn == "Faire des abdos" then 
		startAnims("amb@world_human_sit_ups@male@base", "base")
	elseif btn == "Faire du yoga" then 
		startAnims("amb@world_human_yoga@male@base", "base_a")
	elseif btn == "Annuler Animations" then 
		local ped = GetPlayerPed(-1);
		if ped then
			ClearPedTasks(ped);
		end
	end

	if btn == "Actions anim" then 
		OpenMenu("Actions anim")
	elseif btn == "Glisser" then
		--startAnims("anim@arena@celeb@flat@solo@no_props@", "slide_a_player_a")
		ExecuteCommand('e slide')
	elseif btn == "Reverence" then
		--startAnim("anim@arena@celeb@podium@no_prop@", "regal_c_1st")
		ExecuteCommand('e bow')
	elseif btn == "Pleurer sur les genoux" then
		startAnims("mp_bank_heist_1", "f_cower_01")
	elseif btn == "Jeter votre carnet" then
		startScenario("CODE_HUMAN_MEDIC_TIME_OF_DEATH")
	elseif btn == "Notes" then
		startScenario("WORLD_HUMAN_CLIPBOARD")
	elseif btn == "Siffler" then
		startAnim("rcmnigel1c", "hailing_whistle_waive_a")
	elseif btn == "Locoooo" then
		startAnims("anim@mp_player_intcelebrationmale@you_loco", "you_loco")
	elseif btn == "Branlette" then
		startAnims("anim@mp_player_intcelebrationmale@wank", "wank")
	elseif btn == "Laché moi" then
		startAnims("anim@mp_player_intcelebrationmale@freakout", "freakout")
	elseif btn == "Mendier" then
		startScenario("WORLD_HUMAN_BUM_FREEWAY")
	elseif btn == "Applaudir" then
		startScenario("WORLD_HUMAN_CHEERING")
	elseif btn == "Auplaudir lentement" then
		startAnim("anim@mp_player_intcelebrationmale@slow_clap", "slow_clap")
	elseif btn == "Appel" then 
		startAnim("cellphone@", "cellphone_call_listen_base")
	elseif btn == "Encouragement" then 
		startAnims("mini@triathlon", "male_one_handed_a")
	elseif btn == "Prendre une photo" then 
		startScenario("WORLD_HUMAN_MOBILE_FILM_SHOCKING")
	elseif btn == "Same" then 
		startAnim("special_ped@mime@monologue_5@monologue_5a", "10_ig_1_wa_0")
	elseif btn == "Jeter votre carte" then 
		startScenario("WORLD_HUMAN_TOURIST_MAP")
	elseif btn == "Acrobatie 1" then 
		--startAnims("anim@arena@celeb@flat@solo@no_props@", "cap_a_player_a")
		ExecuteCommand('e flip2')
	elseif btn == "Acrobatie 2" then 
		--startAnims("anim@arena@celeb@flat@solo@no_props@", "flip_a_player_a")
		ExecuteCommand('e flip')
	elseif btn == "Acrobatie 3" then 
		startAnims("anim@arena@celeb@flat@solo@no_props@", "pageant_a_player_a")
	elseif btn == "Actions" then 
		OpenMenu("Actions")
	elseif btn == "~r~Se Déconnecter" then 
		TriggerServerEvent('SavellPlayer')
		ESX.ShowNotification("Addiction\n~r~Vous allez être déconnecté.")
		Citizen.Wait(3000)
		TriggerServerEvent("clippy:deconnection")
	elseif btn == "Arme Tendu" then 
		startAnim("random@arrests", "cop_gunaimed_door_open_idle")
	elseif btn == "Melée 1" then 
		startAnims("anim@deathmatch_intros@melee@2h", "intro_male_melee_2h_b")
	elseif btn == "Melée 2" then 
		startAnims("anim@deathmatch_intros@melee@1h", "intro_male_melee_1h_b")
	elseif btn == "Melée 3" then 
		startAnims("anim@deathmatch_intros@melee@1h", "intro_male_melee_1h_c")
	elseif btn == "Melée 4" then 
		startAnims("mp_deathmatch_intros@melee@2h", "intro_male_melee_2h_d")
	elseif btn == "Melée 5" then 
		startAnim("mp_deathmatch_intros@melee@2h", "intro_male_melee_2h_a_gclub")
	elseif btn == "Melée 6" then 
		startAnims("mp_deathmatch_intros@melee@1h", "intro_male_melee_1h_b")
	elseif btn == "Melée 7" then 
		startAnims("anim@deathmatch_intros@unarmed", "intro_male_unarmed_e")
	elseif btn == "Melée 8" then 
		startAnims("anim@deathmatch_intros@unarmed", "intro_male_unarmed_d")
	elseif btn == "Melée 9" then 
		startAnims("anim@deathmatch_intros@unarmed", "intro_male_unarmed_b")
	elseif btn == "Du sex lo" then 
		OpenMenu("Du sex lo")
	elseif btn == "Homme se faire su*** en voiture" then 
		startAnims("oddjobs@towing", "m_blow_job_loop")
	elseif btn == "Femme faire une gaterie en voiture" then 
		startAnims("oddjobs@towing", "f_blow_job_loop")
	elseif btn == "Homme bais** en voiture" then 
		startAnims("mini@prostitutes@sexlow_veh", "low_car_sex_loop_player")
	elseif btn == "Femme bais** en voiture" then 
		startAnims("mini@prostitutes@sexlow_veh", "low_car_sex_loop_female")
	elseif btn == "Faire du charme" then 
		startAnims("mini@strip_club@idles@stripper", "stripper_idle_02")
	elseif btn == "Pose michto" then 
		startScenario("WORLD_HUMAN_PROSTITUTE_HIGH_CLASS")
	elseif btn == "Se gratter les couilles" then 
		startAnim("mp_player_int_uppergrab_crotch", "mp_player_int_grab_crotch")
	elseif btn == "Se gratter le cul" then 
		startAnim("mp_player_int_upperarse_pick", "mp_player_int_arse_pick")
	elseif btn == "Strip Tease 1" then 
		startAnims("mini@strip_club@lap_dance@ld_girl_a_song_a_p1", "ld_girl_a_song_a_p1_f")
	elseif btn == "Strip Tease 2" then 
		startAnims("mini@strip_club@private_dance@part2", "priv_dance_p2")
	elseif btn == "Strip Tease au sol" then 
		startAnims("mini@strip_club@private_dance@part3", "priv_dance_p3")
	elseif btn == "Gestures" then 
		OpenMenu("Gestures")
	elseif btn == "Féliciter" then 
		startScenario("WORLD_HUMAN_CHEERING")
	elseif btn == "Super" then 
		startAnim("mp_action", "thanks_male_06")
	elseif btn == "Toi" then 
		startAnim("gestures@m@standing@casual", "gesture_point")
	elseif btn == "Viens" then 
		startAnim("gestures@m@standing@casual", "gesture_come_here_soft")
	elseif btn == "Keskya ?" then 
		startAnims("gestures@m@standing@casual", "gesture_bring_it_on")
	elseif btn == "A moi" then 
		startAnim("gestures@m@standing@casual", "gesture_me")
	elseif btn == "Je le savais, putain" then 
		startAnims("anim@am_hold_up@male", "shoplift_high")
	elseif btn == "Être épuisé" then 
		startAnims("amb@world_human_jog_standing@male@idle_b", "idle_d")
	elseif btn == "Je suis dans la merde" then 
		startAnims("amb@world_human_bum_standing@depressed@idle_a", "idle_a")
	elseif btn == "Facepalm" then 
		startAnim("anim@mp_player_intcelebrationmale@face_palm", "face_palm")
	elseif btn == "Calme-toi" then 
		startAnim("gestures@m@standing@casual", "gesture_easy_now")
	elseif btn == "Qu'est ce que j'ai fait ?" then 
		startAnims("oddjobs@assassinate@multi@", "react_big_variations_a")
	elseif btn == "Avoir peur" then 
		startAnims("amb@code_human_cower_stand@male@react_cowering", "base_right")
	elseif btn == "Fight ?" then 
		startAnims("anim@deathmatch_intros@unarmed", "intro_male_unarmed_e")
	elseif btn == "C'est pas Possible !" then 
		startAnim("gestures@m@standing@casual", "gesture_damn")
	elseif btn == "Doigt d'honneur" then 
		startAnim("mp_player_int_upperfinger", "mp_player_int_finger_01_enter")
	elseif btn == "Tchek" then 
		startAnims("mp_ped_interaction", "handshake_guy_a")
	elseif btn == "Festives" then 
		OpenMenu("Festives")

	elseif btn == "Bouger 01" then 
		startAnims("anim@mp_player_intupperuncle_disco", "idle_a")
	elseif btn == "Bouger 02" then 
		startAnims("anim@mp_player_intuppersalsa_roll", "idle_a")
	elseif btn == "Bouger 03" then 
		startAnims("anim@mp_player_intupperraise_the_roof", "idle_a")
	elseif btn == "Bouger 04" then 
		startAnims("anim@mp_player_intupperoh_snap", "idle_a")
	elseif btn == "Bouger 05" then 
		startAnims("anim@mp_player_intupperheart_pumping", "idle_a")
	elseif btn == "Bouger 06" then 
		startAnims("anim@mp_player_intupperfind_the_fish", "idle_a")
	elseif btn == "Bouger 07" then 
		startAnims("anim@mp_player_intuppercats_cradle", "idle_a")
	elseif btn == "Bouger 08" then 
		startAnims("anim@mp_player_intupperbanging_tunes", "idle_a")
	elseif btn == "Bouger 09" then 
		startAnims("anim@mp_player_intupperbanging_tunes_right", "idle_a")
	elseif btn == "Bouger 10" then 
		startAnims("anim@mp_player_intupperbanging_tunes_left", "idle_a")
	elseif btn == "Coincé" then
		startAnims("anim@amb@nightclub@dancers@black_madonna_entourage@", "li_dance_facedj_15_v2_male^2") 
	elseif btn == "DJ" then 
		startAnims("anim@mp_player_intcelebrationmale@dj", "dj")
	elseif btn == "Enchainé" then 
		startAnims("anim@amb@nightclub@dancers@black_madonna_entourage@", "hi_dance_facedj_09_v2_male^5")
	elseif btn == "Hey mec" then 
		startAnims("anim@amb@nightclub@dancers@club_ambientpeds@", "mi-hi_amb_club_09_v1_male^1")
	elseif btn == "Fausse Guitare" then 
		startAnims("anim@mp_player_intcelebrationmale@air_guitar", "air_guitar")
	elseif btn == "Jazz" then 
		startAnims("anim@mp_player_intcelebrationfemale@jazz_hands", "jazz_hands")
	elseif btn == "Rock'n roll" then 
		startAnims("anim@mp_player_intcelebrationmale@rock", "rock")
	elseif btn == "Suspense" then 
		startAnims("anim@amb@nightclub@dancers@black_madonna_entourage@", "li_dance_facedj_11_v1_male^1")
	end

	if btn == "Enlever le GPS" then 
		openmapgps()
	elseif btn == "Prendre en otage" then 
		ExecuteCommand('otage')
	elseif btn == "Porter" then 
		ExecuteCommand('porter')
	end 
end







local MyMenus = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 0, 0}, Title = 'Paramètres'},
	Data = { currentMenu = "Catégories"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Catégories"] = {
			b = {
				{name = "Animations",ask = "→", askX = true},
				{name = "Options",ask = "→", askX = true},
				{name = "Actions",ask = "→", askX = true},
			}
		},

		
		["Actions"] = {
			b = { 
				{name = "Synchroniser mon personnage"},
				{name = "~r~Se Déconnecter"},
				{name = "Optimiser son client FiveM"},
			}
		},

		["Options"] = {
			b = { 
				{name = "Réglage Hud",ask = "→", askX = true},
				{name = "Réglage des filtres",ask = "→", askX = true},
			}
		},

		["personnage"] = {
			b = { 
				{name = "Listes des Carte SIMS						→"},
				{name = "Mes Clefs						 			→"}
			}
		},

		["Informations Personnages"] = {
			b = { 
				{name = "Synchroniser mon personnage"},
				{name = "~r~Se Déconnecter"},
				{name = "Changer de Personnages"},
				{name = "Débug"}
			}
		},
		
		["Filtres"] = {
			b = { 
				{name = "Vue normal"},
				{name = "Contrastes",ask = "→", askX = true},
				{name = "Fin du Monde",ask = "→", askX = true},
				{name = "Grésillement",ask = "→", askX = true},
				{name = "Brouillard",ask = "→", askX = true},
				{name = "Vue / Couleur Amplifié",ask = "→", askX = true},
				{name = "Couleurs",ask = "→", askX = true}
			}
		},

		["Contraste"] = {
			b = { 
				{name = "Contraste"},
				{name = "Eclaircissement"}
			}
		},

		["Brouillard"] = {
			b = { 
				{name = "Brouillard 1"},
				{name = "Brouillard Eclairci"},
				{name = "Gros Brouillard"}
			}
		},

		["Couleurs"] = {
			b = { 
				{name = "Noir & Blanc"},
				{name = "Violet et Bleu"},
				{name = "Rouge"},
				{name = "Sous l'Eau"}
			}
		},

		["Vue / Couleur Amplifié"] = {
			b = { 
				{name = "Vue & lumières améliorées"},
				{name = "Couleurs amplifiées"},
				{name = "Couleurs amplifiées 2"}
			}
		},

		["Fin du Monde"] = {
			b = { 
				{name = "Fin du Monde 1"},
				{name = "Gris Fin du Monde"}
			}
		},

		["Grésillement"] = {
			b = { 
				{name = "Grésillement 1"},
				{name = "Grésillement 2"}
			}
		},

		
		["Optimisation"] = {
			b = { 
				--{name = "Optimiser son client FiveM"},
				{name = "Conseil FiveM"}
			}
		},

		
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
----------------------------------Animations------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
--------------------------------------------------------------------------
		
		

		["Animations"] = {
			b = {
				{name = "Annuler Animations"},
				{name = "Dormir/se réveiller"},
				{name = "Actions anim",ask = "→", askX = true},
				{name = "Armes",ask = "→", askX = true},
				{name = "Danses",ask = "→", askX = true},
				{name = "Du sex lo",ask = "→", askX = true},
				{name = "Expressions",ask = "→", askX = true},
				{name = "Festives",ask = "→", askX = true},
				{name = "Gestures",ask = "→", askX = true},
				{name = "Attente",ask = "→", askX = true},
				{name = "Insolent",ask = "→", askX = true},
				{name = "Poses",ask = "→", askX = true},
				{name = "S'asseoir",ask = "→", askX = true},
				{name = "Sports",ask = "→", askX = true},
				-- {name = "Tricks (Moto)",ask = "→", askX = true},
				--{name = "Accolades",ask = "→", askX = true},
				{name = "Démarches",slidemax = demarches},
				-- {name = "Menu Animations",ask = "→", askX = true}
			}
		},

		["Festives"] = {
			useFilter = true,
			b = { 
				{name = "Bouger 01"},
				{name = "Bouger 02"},
				{name = "Bouger 03"},
				{name = "Bouger 04"},
				{name = "Bouger 05"},
				{name = "Bouger 06"},
				{name = "Bouger 07"},
				{name = "Bouger 08"},
				{name = "Bouger 09"},
				{name = "Bouger 10"},
				{name = "Coincé"},
				{name = "DJ"},
				{name = "Enchainé"},
				{name = "Hey mec"},
				{name = "Fausse Guitare"},
				{name = "Jazz"},
				{name = "Rock'n roll"},
				{name = "Suspense"}
			}
		},

		["Actions anim"] = {
			useFilter = true,
			b = { 
				{name = "Acrobatie 1"},
				{name = "Acrobatie 2"},
				{name = "Acrobatie 3"},
				{name = "Applaudir"},
				{name = "Auplaudir lentement"},
				{name = "Appel"},
				{name = "Être Sonné"},
				{name = "Encouragement"},
				{name = "Glisser"},
				{name = "Jeter votre carnet"},
				{name = "Jeter votre carte"},
				{name = "Locoooo"},
				{name = "Laché moi"},
				{name = "Notes"},
				{name = "Mendier"},
				{name = "Pleurer sur les genoux"},
				{name = "Prendre une photo"},
				{name = "Reverence"},
				{name = "Se sentir Mal"},
				{name = "Siffler"},
				{name = "Same"}
			}
		},

		["Gestures"] = {
			useFilter = true,
			b = { 
				{name = "A moi"},
				{name = "Branlette"},
				{name = "Calme-toi"},
				{name = "C'est pas Possible !"},
				{name = "Doigt d'honneur"},
				{name = "Être épuisé"},
				{name = "Féliciter"},
				{name = "Je le savais, putain"},
				{name = "Je suis dans la merde"},
				{name = "Keskya ?"},
				{name = "Facepalm"},
				{name = "Qu'est ce que j'ai fait ?"},
				{name = "Avoir peur"},
				{name = "Fight ?"},
				{name = "Super"},
				{name = "Toi"},
				{name = "Viens"}
			}
		},

		["Du sex lo"] = {
			useFilter = true,
			b = { 
				{name = "Dans ton Cul"},
				{name = "Femme faire une gaterie en voiture"},
				{name = "Femme bais** en voiture"},
				{name = "Homme se faire su*** en voiture"},
				{name = "Homme bais** en voiture"},
				{name = "Faire du charme"},
				{name = "Montrer ses Seins"},
				{name = "Pose michto"},
				{name = "Se gratter les couilles"},
				{name = "Se gratter le cul"},
				{name = "Strip Tease 1"},
				{name = "Strip Tease 2"},
				{name = "Strip Tease au sol"}
			}
		},

		["Poses"] = {
			useFilter = true,
			b = { 
				{name = "Agriculture : Récolter"},
				{name = "Barman : Servir un shot"},
				{name = "Dépanneur : Réparer le moteur"},
				{name = "Epicier : Donner les courses"},
				{name = "Journaliste : Prendre une photo"},
				{name = "Médecin : Observer"},
				{name = "Pêcheur"},
				{name = "Police : Enquêter"},
				{name = "Police : Parler à la radio"},
				{name = "Police : Circulation"},
				{name = "Police : Jumelles"},
				{name = "SDF : Faire la manche"},
				{name = "Se rendre"},
				{name = "Se Rendre Debout"},
				{name = "Taxi : Parler au client"},
				{name = "Taxi : Donner la facture"},
				{name = "Tout : Prendre des notes"},
				{name = "Tout : Coup de marteau"}
			}
		},


		["Tricks (Moto)"] = {
			b = { 
				{name = "Moto - Debout"},
				{name = "Moto - Droite et Gauche"},
				{name = "Moto - Jambe droite"},
				{name = "Moto - Jambe gauche"}
			}
		},


		["Expressions"] = {
			useFilter = true,
			b = {
				{name = "Ballas"},
				{name = "Craquer ses Poings"},
				{name = "Families"},
				{name = "GG !"},
				{name = "Mains sur la Tête"},
				{name = "Mort de rire"},
				{name = "Paix"},
				{name = "Pouces"},
				{name = "Reflexion"},
				{name = "Respect"},
				{name = "Respect 2"},
				{name = "Salut Militaire"},
				{name = "Stop"},
				{name = "Stressé"},
				{name = "T'a Dead ça Chakal"},
				{name = "Vagos"},
				{name = "Victoire"}
			}
		},

		["Poses"] = {
			useFilter = true,
			b = {
				{name = "Blessé au sol"},
				{name = "Desespéré"},
				{name = "Dormir sur place"},
				{name = "Faire le mec"},
				{name = "Faire la statue"},
				{name = "Haleine"},
				{name = "Pataugeoire"},
				{name = "PLS"},
				{name = "Prêt à ce battre"},
				{name = "Se Rendre"},
				{name = "Se Rendre Debout"},
				{name = "Rouler par terre"},
				{name = "Zombie"},
				{name = "-------------------------------Sports-------------------------------"},
				{name = "Barre de musculation"},
				{name = "Faire des pompes"},
				{name = "Faire des abdos"},
				{name = "Faire du yoga"},
				{name = "-------------------------------Travail-------------------------------"},
				{name = "Montrer ses muscles"},
				{name = "Agriculture : Récolter"},
				{name = "Barman : Servir un shot"},
				{name = "Dépanneur : Réparer le moteur"},
				{name = "Epicier : Donner les courses"},
				{name = "Journaliste : Prendre une photo"},
				{name = "Médecin : Observer"},
				{name = "Pêcheur"},
				{name = "Police : Enquêter"},
				{name = "Police : Parler à la radio"},
				{name = "Police : Circulation"},
				{name = "Police : Jumelles"},
				{name = "SDF : Faire la manche"},
				{name = "Taxi : Parler au client"},
				{name = "Taxi : Donner la facture"},
				{name = "Tout : Prendre des notes"},
				{name = "Tout : Coup de marteau"}
			}
		},

		["Assis"] = {
			useFilter = true,
			b = {
				{name = "Blessé"},
				{name = "Chill"},
				{name = "Genoux sur le sol"},
				{name = "Méditer"},
				{name = "Par Terre"},
				{name = "Posay"},
				{name = "Siège"},
				{name = "Souffrance"},
				{name = "------------------------------Allonger------------------------------"},
				{name = "Bras écartés"},
				{name = "Droit"},
				{name = "Sur le ventre"},
				{name = "------------------------------Attente-------------------------------"},
				{name = "Attendre"},
				{name = "Ceinture"},
				{name = "Contre un Mur"},
				--{name = "Contre un Mur 2"},
				--{name = "Contre un Mur 3"},
				--{name = "Contre un Mur 4"},
				--{name = "Contre un Mur (Aléatoire)"},
				{name = "Croiser les Bras"},
				{name = "Hanche"},
				{name = "S'acouder 1"},
				{name = "S'acouder 2"},
				{name = "S'acouder 3"},
				{name = "----------------------------Accolades-----------------------------"},
				{name = "Calin"},
				{name = "Calin Proche"},
				{name = "Tchek"},
				{name = "Tchek Gang"}
			}
		},

		["Insolent"] = {
			useFilter = true,
			b = {
				{name = "Baise mon doigt"},
				{name = "Coeur"},
				{name = "Chuuuuute"},
				{name = "Doigt Simple"},
				{name = "Doigt Double"},
				{name = "J'en Peu Plus"},
				{name = "Nettoyer le nez"},
				{name = "Nananere"},
				{name = "Pluie d\'argent"},
				{name = "Pluie d\'argent CLP"},
				{name = "Prend mon doigt"},
				{name = "Poule Mouillé"},
				{name = "Uriner"},
				{name = "Vomir"}
			}
		},

		["Armes"] = {
			useFilter = true,
			b = {
				{name = "Arme Gang"},
				{name = "Arme Gang 2"},
				{name = "Arme Tendu"},
				{name = "Melée 1"},
				{name = "Melée 2"},
				{name = "Melée 3"},
				{name = "Melée 4"},
				{name = "Melée 5"},
				{name = "Melée 6"},
				{name = "Melée 7"},
				{name = "Melée 8"},
				{name = "Melée 9"},
				{name = "Regarder l'arme"},
				{name = "Suicide"}
			}
		},

		["Attente"] = {
			useFilter = true,
			b = {
				{name = "Contre un Mur 1"},
				{name = "Contre un Mur 2"},
				{name = "Contre un Mur 3"},
				{name = "Contre un Mur 4"},
				{name = "Contre un Mur (Aléatoire)"},
				{name = "Attendre"},
				{name = "S'acouder 1"},
				{name = "S'acouder 2"},
				{name = "S'acouder 3"},
				{name = "Ceinture"},
				{name = "Hanche"},
				{name = "Croiser les Bras"}
			}
		},

		["Accolades"] = {
			b = {
				{name = "Tchek Gang"},
				{name = "Calin"},
				{name = "Calin Proche"}
			}
		},

		["Danses"] = {
			useFilter = true,
			b = {
				{name = "Danse 1"},
				{name = "Danse 2"},
				{name = "Danse 3"},
				{name = "Danse 4"},
				{name = "Danse 5"},
				{name = "Danse 6"},
				{name = "Danse 7"},
				{name = "Danse 8"},
				{name = "Danse 9"},
				{name = "Danse 10"},
				{name = "Danse 11"},
				{name = "Danse 12"},
				{name = "Danse 13"},
				{name = "Danse 14"},
				{name = "Danse 15"},
				{name = "Danse Tranquille 1"},
				{name = "Danse Tranquille 2"},
				{name = "Danse Tranquille 3"},
				{name = "Danse Tranquille 4"},
				{name = "Danse Tranquille 5"},
				{name = "Danse Tranquille 6"},
				{name = "Danse Tranquille 7"},
				{name = "Danse Tranquille 8"},
				{name = "Danse Active 1"},
				{name = "Danse Active 2"},
				{name = "Danse Active 3"},
				{name = "Danse Active 4"},
				{name = "Danse Active 5"},
				{name = "Danse Active 6"},
				{name = "Danse Active 7"},
				{name = "Danse Active 8"},
				{name = "Danse Active 9"},
				{name = "Danse Active 10"},
				{name = "Danse Active 11"},
				{name = "Danse Active 12"},
				{name = "Danse Active 13"},
				{name = "Danse Active 14"},
				{name = "Danse Active 15"},
				{name = "Danse Active 16"},
				{name = "Danse Active 17"},
				{name = "Danse Active 18"},
				{name = "Danse Active 19"},
				{name = "Danse Active 20"}
			}
		},

		["S'Allonger"] = {
			b = {
				{name = "Droit"},
				{name = "Bras écartés"},
				{name = "Sur le ventre"}
			}
		},

		["Sports"] = {
			b = { 
				{name = "Montrer ses muscles"},
				{name = "Barre de musculation"},
				{name = "Faire des pompes"},
				{name = "Faire des abdos"},
				{name = "Faire du yoga"}
			}
		},

--[[ 		["Démarches"] = {
			b = { 
				{name = "Normal"},
				{name = "Blessé(e)"},
				{name = "Arrogant(e)"},
				{name = "Arrogant(e) 2"},
				{name = "Arrogant(e) Abusé"},
				{name = "Déterminé(e)"},
				{name = "Marche Ralenti bras écartés"},
				{name = "Marche Ralenti"},
				{name = "Marche Lente"},
				{name = "Marche Lente bras écartés"},
				{name = "Marche Moyenne"},
				{name = "Marche Moyenne bras écartés"},
				{name = "Marche Rapide"},
				{name = "Trottiner"},
				{name = "Constipé(e)"},
				{name = "Police Gainé"},
				{name = "Police Rapide"},
				{name = "Légèrement Bourré(e)"},
				{name = "Bourré(e)"},
				{name = "Défoncé(e)"},
				{name = "Femme"},
				{name = "Femme Difficile"},
				{name = "Sexi"},
				{name = "Feu"},
				{name = "Feu 1"},
				{name = "Feu 2"},
				{name = "Franklin"},
				{name = "Lamar"},
				{name = "Lester"},
				{name = "Lester 2"},
				{name = "Michael"},
				{name = "Shady"},
				{name = "Gangster"},
				{name = "Gangster 1"},
				{name = "Gangster 2"},
				{name = "Gangster 3"},
				{name = "Gangster 4"},
				{name = "Garde Armé"},
				{name = "Menotté(e)"},
				{name = "Hipster"},
				{name = "Désespéré(e)"},
				{name = "Brute"},
				{name = "Brute 2"},
				{name = "Argent"},
				{name = "Triste"},
				{name = "Travailleur"},
				{name = "Insolent"},
				{name = "Insolent 2"},
				{name = "Effrayé(e)"},
				{name = "Swag"},
				{name = "Difficile"},
				{name = "Trainer"},
				{name = "Trainer 2"},
				{name = "Large"}
			}
		}, ]]

		["Réglage Hud"] = {
			b = {
				{name = "Enlever le GPS", checkbox = false},
				{name = "Enlever HUD faim/soif", checkbox = false},
				{name = "Afficher le mode cinématique", checkbox = false}
			}
		}
	}
}

--[[ 
Citizen.CreateThread(function()
	while true do
		Wait(1)
		if IsControlJustReleased(0, 244) and GetLastInputMethod(2) then
			CreateMenu(MyMenus)
		end
	end
end) ]]



RegisterKeyMapping('+dormir1', 'Dormir/se réveiller', 'keyboard', '')

RegisterCommand("+dormir1", function()
	while true do 
		Wait(0)
		local myPed = GetPlayerPed(-1)
		SetPedToRagdoll(myPed, 1000, 1000, 0, 0, 0, 0)
		ESX.ShowHelpNotification ("Appuyez sur ~INPUT_CONTEXT~ ou ~INPUT_JUMP~ pour ~b~vous relever")
		ResetPedRagdollTimer(myPed)
		if IsControlJustPressed(0, 22) or IsControlJustPressed(0, 46) then 
			break
		end
	end
end)

RegisterKeyMapping('+cinematique1', 'Activer le mode cinématique', 'keyboard', '')

RegisterCommand("+cinematique1", function()
	while true do 
		Wait(0)
			openCinematique()
	end
end)

RegisterKeyMapping('menuf5divers', 'Ouvrir le menu divers', 'keyboard', 'M')

RegisterCommand("menuf5divers", function()
	CreateMenu(MyMenus)
end)

RegisterCommand("save", function()
	TriggerServerEvent('SavellPlayer')
	PlaySoundFrontend(-1, "Boss_Message_Orange", "GTAO_Boss_Goons_FM_Soundset", 0)
end)

RegisterCommand("opti", function()
	DoScreenFadeIn(2000)
--LoadingPrompt("Optimisation en cours...", 3)
--exports['progressBars']:startUI(4000, "Optimisation en cours...")
DoScreenFadeOut(2000)
exports["a_loadingbar"]:StartDelayedFunction("Optimisation en cours...", 4000, function()
--Citizen.Wait(2000)
DoScreenFadeIn(1500)
ClearAllBrokenGlass()
ClearAllHelpMessages()
LeaderboardsReadClearAll()
ClearBrief()
ClearGpsFlags()
ClearPrints()
ClearSmallPrints()
ClearReplayStats()
LeaderboardsClearCacheData()
ClearFocus()
ClearHdArea()
ClearHelp()
ClearNotificationsPos()
ClearPedInPauseMenu()
ClearFloatingHelp()
ClearGpsPlayerWaypoint()
ClearGpsRaceTrack()
ClearReminderMessage()
ClearThisPrint()


--Citizen.Wait(2090)

-- print('Client FiveM optimisé.')
ESX.ShowColoredNotification("✅ Optimisation effectuée.", 25)
RemoveLoadingPrompt()
Citizen.Wait(100)
PlaySoundFrontend(-1, "Boss_Message_Orange", "GTAO_Boss_Goons_FM_Soundset", 0)
end)
end)

RegisterCommand("debug", function()
	TriggerEvent("playerSpawned")
	ESX.ShowNotification("~g~Débug : \n~w~Dernière Position.", 25)
end)


RegisterCommand('perso', function(source, args)
	local plyData = ESX.GetPlayerData()
	if plyData and plyData.job and plyData.job.label and plyData.job.grade_label then
        ESX.ShowNotification("Job : ~g~"..plyData.job.label.."~s~\nGrade : ~g~"..plyData.job.grade_label.."~s~\nNom Steam : ~g~" .. GetPlayerName(PlayerId()) .. " \n~s~Votre Id : ~g~" ..GetPlayerServerId(PlayerId()).. "")
	else 
        ESX.ShowNotification("Données introuvables.")
	end
end)


function startAnims(lib, anim)
	local lib, anim = lib,anim
	ESX.Streaming.RequestAnimDict(lib)
	TaskPlayAnim(GetPlayerPed(-1), lib, anim, 8.0, 8.0, -1, 1, 1, 0, 0, 0)
	--ESX.Streaming.RequestAnimDict(lib, function()
		--TaskPlayAnim(PlayerPedId(), lib, anim, 8.0, 8.0, -1, 1, 1, 0, 0, 0)
	--end)
end

function startScenarios(anim, flag)
    local lFlag = false

	if flag ~= nil then
		lFlag = true
	end

	TaskStartScenarioInPlace(GetPlayerPed(-1), anim, 0, lFlag)
end


local interface = true
 function openInterface()
	interface = not interface
	if not interface then -- hide
		TriggerEvent('esx_status:setDisplay', 0.0)
	elseif interface then -- show
		TriggerEvent('esx_status:setDisplay', 1.0)
	end
end

local map = true
 function openmapgps()
	map = not map
	if not map then -- hide
		DisplayRadar(false)
	elseif map then -- show
		DisplayRadar(true)
	end
end

local hasCinematic = false
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		if IsPauseMenuActive() then
			ESX.UI.HUD.SetDisplay(0.0)
		elseif hasCinematic == true then
			ESX.UI.HUD.SetDisplay(0.0)
		end
	end
end)



function WalkMenuStart(name)
	RequestWalking(name)
	SetPedMovementClipset(PlayerPedId(), name, 0.2)
	RemoveAnimSet(name)
  end
  
  function RequestWalking(set)
	RequestAnimSet(set)
	while not HasAnimSetLoaded(set) do
	  Citizen.Wait(1)
	end 
  end
  
  function WalksOnCommand(source, args, raw)
	local WalksCommand = ""
	for a in pairsByKeys(DP.Walks) do
	  WalksCommand = WalksCommand .. ""..string.lower(a)..", "
	end
	EmoteChatMessage(WalksCommand)
	EmoteChatMessage("To reset do /walk reset")
  end
  
  function WalkCommandStart(source, args, raw)
	local name = firstToUpper(args[1])
  
	if name == "Reset" then
		ResetPedMovementClipset(PlayerPedId()) return
	end
  
	local name2 = table.unpack(DP.Walks[name])
	if name2 ~= nil then
	  WalkMenuStart(name2)
	else
	  EmoteChatMessage("'"..name.."' is not a valid walk")
	end
  end

RegisterCommand('lastpos', function()
	TriggerServerEvent("c_menu:lastpos")
end)

RegisterNetEvent("c_menu:lastpos")
AddEventHandler("c_menu:lastpos", function(position) 
	coords = position
	SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z+2.0, 0.0, 0.0, 0.0, false)
end)
