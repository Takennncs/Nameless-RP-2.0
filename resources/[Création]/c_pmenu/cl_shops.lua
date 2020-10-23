ESX = nil
local PlayerData              = {}

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

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)

function IsJobTrue()
    if PlayerData ~= nil then
        local IsJobTrue = false
        if PlayerData.job ~= nil and PlayerData.job.name == 'burgershot' then
            IsJobTrue = true
        end
        return IsJobTrue
    end
end

RegisterNetEvent('arretvendre')
AddEventHandler('arretvendre', function()
	ClearPedTasks(GetPlayerPed(-1))
end)

RegisterNetEvent('test:notamred')
AddEventHandler('test:notamred', function()
	ESX.ShowColoredNotification('Vous avez déjà cette arme.', 8)
end)

local function OnSelected(self, _, button, slt)
--	PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET", 1)
--	ESX.ShowHelpNotification("test", true, false, 50)
	local btn = button.name
	if btn == "Boissons" then -- Ouvre le menu Actions
		--TriggerServerEvent("InteractSound_SV:PlayWithinDistance", 1.0, "its_over_for_you", 0.6)
		OpenMenu("Boissons")
	elseif btn == "Nourritures" then -- Ouvre le menu Information
		OpenMenu("Nourritures")
	end

-------------------------------------------------------------Boissons-------------------------------------------------------------

	if btn == "Eau" then --Ouvre le menu des filtres
		TriggerServerEvent('eau')
	elseif btn == "IceTea" then -- Filtre
		TriggerServerEvent('icetea')
	elseif btn == "Orangina" then	 -- Filtre
		TriggerServerEvent('orangina')
	elseif btn == "Seven Up" then	-- Filtre
		TriggerServerEvent('sevenup')
	elseif btn == "Sprite" then	-- Filtre
		TriggerServerEvent('sprite')
	elseif btn == "Sirop" then	-- Filtre
		TriggerServerEvent('sirop')
	elseif btn == "Mojito" then	-- Filtre
		TriggerServerEvent('mojito')
	end

	if btn == "20G de Weed" then
		TriggerServerEvent('acehet20weed')
	elseif btn == "10G de Cocaïne" then
		TriggerServerEvent('acehet10coke')
	elseif btn == "10G de Meth" then
		TriggerServerEvent('acehet10meth')
	end
	
	if btn == "Armes de Mêlée" then
		OpenMenu("Armes de Mêlée")
	elseif btn == "Nourritures" then
		OpenMenu("Nourritures")
	end

	if btn == "Acheter" then
		TriggerServerEvent('buyLicense')
		ESX.ShowNotification('Vous vennez ~g~d\'acheter le PPA')
		self:CloseMenu()
	elseif btn == "Annuler" then
		self:CloseMenu()
	end

	if btn == "Couteau" then --Ouvre le menu des filtres
		TriggerServerEvent('knife')
	elseif btn == "Poignard" then 
		TriggerServerEvent('dagger')
	elseif btn == "Batte de baseball" then	 
		TriggerServerEvent('bat')
	elseif btn == "Bouteille cassée" then
		TriggerServerEvent('bottle')
	elseif btn == "Pied de biche" then
		TriggerServerEvent('crowbar')
	elseif btn == "Katana" then
		TriggerServerEvent('golf')
	elseif btn == "Marteau" then
		TriggerServerEvent('hammer')
	elseif btn == "Hachette" then 
		TriggerServerEvent('hatchet')
	elseif btn == "Poing américain" then 
		TriggerServerEvent('knuckle')
	elseif btn == "Lampe torche" then 
		TriggerServerEvent('flashlight')
	elseif btn == "Machette" then 
		TriggerServerEvent('machette')
	elseif btn == "Cran d'arrêt" then 
		TriggerServerEvent('crantdarret')
	elseif btn == "Clé à molette" then 
		TriggerServerEvent('wrench')
	elseif btn == "Hache de combat" then 
		TriggerServerEvent('battleaxe')
	elseif btn == "Hache en pierre" then 
		TriggerServerEvent('stonehatchet')
	elseif btn == "Queue de billard" then 
		TriggerServerEvent('poolcue')
	end

-----------------------------------------------------------Nourritures-----------------------------------------------------------
	
	if btn == "Pain" then 
		TriggerServerEvent('pain')
	elseif btn == "Hamburger" then 
		TriggerServerEvent('hamburger')
	elseif btn == "Frites" then 
		TriggerServerEvent('frites')
	elseif btn == "Pizza" then 
		TriggerServerEvent('pizza')
	elseif btn == "Accessoires" then 
		OpenMenu("Accessoires")
	elseif btn == "Chargeur" then 
		TriggerServerEvent('clip')
	elseif btn == "Chargeur Basique" then 
		TriggerServerEvent('ChargeurBasique')
	elseif btn == "Chargeur Long" then 
		TriggerServerEvent('ChargeurLong')
	elseif btn == "Chargeur Drum" then 
		TriggerServerEvent('ChargeurDrum')
	elseif btn == "Lampe" then 
		TriggerServerEvent('lampe')
	elseif btn == "Lampe de Billy" then 
		TriggerServerEvent('lampe1')
	elseif btn == "Silencieux" then 
		TriggerServerEvent('silencieux')
	elseif btn == "Silencieux de Billy" then
		TriggerServerEvent('Silencieuxdebilly')
	elseif btn == "Grand Chargeur" then 
		TriggerServerEvent('grandchargeur')
	elseif btn == "Poignée" then 
		TriggerServerEvent('poignée')
	elseif btn == "Multimédia" then 
		OpenMenu("Multimédia")
	elseif btn == "Téléphone" then 
		TriggerServerEvent('tel')
	elseif btn == "Carte sim" then 
		TriggerServerEvent('simadd')
	elseif btn == "Graines" then 
		OpenMenu("Graines")
	elseif btn == "Graines Weed" then 
		TriggerServerEvent('graines')
	elseif btn == "Outils" then 
		OpenMenu("Outils")
	elseif btn == "Pelle" then 
		TriggerServerEvent('pelle')
	elseif btn == "Radio" then 
		TriggerServerEvent('Radioadd')
	elseif btn == "Obtenir sa carte d'identité" then 
		TriggerServerEvent('clippy:identity')
		TriggerServerEvent('clippy:addidentiteitem')
		self:CloseMenu(true)
	elseif btn == "Bison d'essence" then 
		TriggerServerEvent('bidonessence')
	end

	if btn == "Terre" then
		TriggerServerEvent('resell:terre')
		TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_b", 8.0, 8.0, -1, 48, 1, false, false, false)
		self:CloseMenu()
	elseif btn == "Bijoux" then
		TriggerServerEvent('resell:Bijoux')
		TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_b", 8.0, 8.0, -1, 48, 1, false, false, false)
		self:CloseMenu()
	elseif btn == "Graines de Weed" then
		TriggerServerEvent('resell:Graines1')
		TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_b", 8.0, 8.0, -1, 48, 1, false, false, false)
		self:CloseMenu()
	elseif btn == "Briques de Weed" then
		TriggerServerEvent('resell:Briques')
		TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_b", 8.0, 8.0, -1, 48, 1, false, false, false)
		self:CloseMenu()
	elseif btn == "Armes Longues" then 
		OpenMenu("Armes Longues")
	elseif btn == "Armes de Poing" then 
		OpenMenu("Armes de Poing")
	elseif btn == "Pistolet à billes" then 
		TriggerServerEvent('pistoletdetresse')
	elseif btn == "Musket" then 
		TriggerServerEvent('musket')
	elseif btn == "Fumigène" then 
		TriggerServerEvent('fumigene')
	elseif btn == "Clé USB Weed" then 
		TriggerServerEvent('cleweed')
		TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_b", 8.0, 8.0, -1, 48, 1, false, false, false)
		self:CloseMenu()
	elseif btn == "Clé USB Coke" then 
		TriggerServerEvent('clecoke')
		TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_b", 8.0, 8.0, -1, 48, 1, false, false, false)
		self:CloseMenu()
	elseif btn == "Clé USB Meth" then 
		TriggerServerEvent('clemeth')
		TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_b", 8.0, 8.0, -1, 48, 1, false, false, false)
		self:CloseMenu()
	elseif btn == "Lingot d'or" then 
		TriggerServerEvent('lingotor')
	elseif btn == "Boîte de diamant" then 
		TriggerServerEvent('diamondbox')
	elseif btn == "Skin de luxe" then 
		TriggerServerEvent('skindeluxe1')
	elseif btn == "Skin de luxe de Billy" then 
		TriggerServerEvent('skindeluxe')
	elseif btn == "Viseur" then 
		TriggerServerEvent('viseurshop')
	elseif btn == "Weed : Clé USB" then 
		TriggerServerEvent('cleusbweed1')
	elseif btn == "Coke : Clé USB" then 
		TriggerServerEvent('cleusbcoke1')
	elseif btn == "Meth : Clé USB" then 
		TriggerServerEvent('cleusbmeth1')
	elseif btn == "Carte d'accès banque (fleeca)" then 
		TriggerServerEvent('carteacces')
	elseif btn == "Carte d'accès coffre (fleeca)" then 
		TriggerServerEvent('cartecoffre')
	elseif btn == "Charge thermique (pacific)" then 
		TriggerServerEvent('chargethermique')
	elseif btn == "PC Portable (pacific)" then 
		TriggerServerEvent('hackerlaptop')
	elseif btn == "Armes de Poings" then 
		OpenMenu('Armes de Poings')
	elseif btn == "Fusils d'Assauts" then 
		OpenMenu("Fusils d'Assauts")
	elseif btn == "Fusils Mitrailleurs" then 
		OpenMenu('Fusils Mitrailleurs')
	elseif btn == "Fusils à Pompes" then 
		OpenMenu('Fusils à Pompes')
	elseif btn == "Grenades" then 
		OpenMenu('Grenades')
	elseif btn == "Snipers" then 
		OpenMenu('Snipers')
	elseif btn == "Divers" then 
		OpenMenu('Divers')
	elseif btn == "Berreta 92" then 
		TriggerServerEvent('berreta92')
	elseif btn == "Glock-17" then 
		TriggerServerEvent('glock17')
	elseif btn == "Pistolet automatique" then 
		TriggerServerEvent('Pistoletautomatique')
	elseif btn == "Tazer" then 
		TriggerServerEvent('tazer')
	elseif btn == "Desert Eagle" then 
		TriggerServerEvent('DesertEagle')
	elseif btn == "Colt-25" then 
		TriggerServerEvent('Colt25')
	elseif btn == "Colt-911" then 
		TriggerServerEvent('Colt911')
	elseif btn == "Pistolet Ancien" then 
		TriggerServerEvent('PistoletAncien')
	elseif btn == "Revolver" then 
		TriggerServerEvent('revolver')
	elseif btn == "Double-Action Revolver" then 
		TriggerServerEvent('DoubleActionRevolver')
	elseif btn == "AK-47" then 
		TriggerServerEvent('AK47')
	elseif btn == "M4A1" then 
		TriggerServerEvent('M4A1')
	elseif btn == "Fusil avancé" then 
		TriggerServerEvent('Fusilavancé')
	elseif btn == "M4A1 Sécial" then 
		TriggerServerEvent('M4A1Sécial')
	elseif btn == "Fusil bullpup" then 
		TriggerServerEvent('Fusilbullpup')
	elseif btn == "AK-U" then 
		TriggerServerEvent('AKU')
	elseif btn == "UZI" then 
		TriggerServerEvent('UZI')
	elseif btn == "UMG SMG" then 
		TriggerServerEvent('UMGSMG')
	elseif btn == "P90" then 
		TriggerServerEvent('P90')
	elseif btn == "Arme de défense personnelle" then 
		TriggerServerEvent('Armededéfensepersonnelle')
	elseif btn == "Tec-9" then 
		TriggerServerEvent('Tec9')
	elseif btn == "Scorpion VZ61" then 
		TriggerServerEvent('ScorpionVZ61')
	elseif btn == "Balayeuse gusenberg" then 
		TriggerServerEvent('Balayeusegusenberg')
	elseif btn == "Fusil à pompe" then 
		TriggerServerEvent('Fusilapompe')
	elseif btn == "ST87 Saw" then 
		TriggerServerEvent('ST87Saw')
	elseif btn == "Fusil à pompe d'assaut" then 
		TriggerServerEvent('Fusilapompeassaut')
	elseif btn == "Mousquet" then 
		TriggerServerEvent('mousquet')
	elseif btn == "Fusil à pompe lourd" then 
		TriggerServerEvent('Fusilapompelourd')
	elseif btn == "Fusil à pompe double canon" then 
		TriggerServerEvent('Fusilapompedoublecanon')
	elseif btn == "Fusil à pompe automatique" then 
		TriggerServerEvent('Fusilapompeautomatique')
	elseif btn == "Grenade" then 
		TriggerServerEvent('grenade')
	elseif btn == "Grenade à gaz bz" then 
		TriggerServerEvent('Grenadeagazbz')
	elseif btn == "Cocktail molotov" then 
		TriggerServerEvent('Cocktailmolotov')
	elseif btn == "Bombe collante" then 
		TriggerServerEvent('Bombecollante')
	elseif btn == "Fumigène rouge" then 
		TriggerServerEvent('Fumigènerouge')
	elseif btn == "Fusil de sniper" then 
		TriggerServerEvent('Fusildesniper')
	elseif btn == "Fusil de sniper lourd" then 
		TriggerServerEvent('Fusildesniperlourd')
	elseif btn == "Fusil marksman" then 
		TriggerServerEvent('Fusilmarksman')
	elseif btn == "Jerrican d'essence" then 
		TriggerServerEvent('Jerricandessence')
	elseif btn == "Parachute" then 
		TriggerServerEvent('parachute')
	elseif btn == "Extincteur" then 
		TriggerServerEvent('extincteur')
	elseif btn == "Tenues" then 
		OpenMenu('Tenues')
	elseif btn == "Divers" then 
		OpenMenu("Divers")
	elseif btn == "Bmx" then 
		TriggerServerEvent('achatbmxdivers')
	elseif btn == "Kevlar" then 
		TriggerServerEvent('achatKevlardivers')

	elseif btn == "Hazmat noire" then 
		TriggerServerEvent('Hazmatnoire')
	elseif btn == "Hazmat bleu" then 
		TriggerServerEvent('Hazmatbleu')
	elseif btn == "Hazmat blanche" then 
		TriggerServerEvent('Hazmatblanche')
	elseif btn == "Hazmat jaune" then 
		TriggerServerEvent('Hazmatjaune')
	elseif btn == "Casa de papel" then 
		TriggerServerEvent('Casadepapel')
	elseif btn == "Karting rouge" then 
		TriggerServerEvent('Kartingrouge')
	elseif btn == "Karting noir" then 
		TriggerServerEvent('Kartingnoir')
	elseif btn == "SkyDiving" then 
		TriggerServerEvent('SkyDiving')
	elseif btn == "Prisonnier" then 
		TriggerServerEvent('tenuePrisonnier')
	elseif btn == "Little Pricks" then 
		TriggerServerEvent('LittlePricks')
	elseif btn == "Masque de Plongé" then 
		TriggerServerEvent('masc_swim')
	elseif btn == "Tenue Mécano" then 
		TriggerServerEvent('tenuemecano')
	elseif btn == "Bong" then 
		TriggerServerEvent('bongachat')
	elseif btn == "Autres" then 
		OpenMenu('Autres')
	elseif btn == "Chalumaux" then 
		TriggerServerEvent('chalumaux')
	elseif btn == "Outil de crochetage" then 
		TriggerServerEvent('achatlockpick')
	elseif btn == "Menottes" then 
		TriggerServerEvent('menottes')
	elseif btn == "Pinces" then 
		TriggerServerEvent('pinces')
	elseif btn == "Pot" then 
		TriggerServerEvent('achat1pot2')
	elseif btn == "Truelle" then 
		TriggerServerEvent('truelleadss')
	elseif btn == "Sac tactique" then 
		TriggerServerEvent('Sactactique')
	elseif btn == "Outil de serrure" then 
		TriggerServerEvent('achatadvancedlockpick')
	elseif btn == "Obtenir sa carte de conduire" then 
		TriggerServerEvent('addpermis')
		ESX.ShowNotification("~g~Permis\n~s~Vous devez maintenant allez passer votre permis à l'agence derrière le ~y~McGill~s~.")
	elseif btn == "Obtenir son permis d'armes" then 
		TriggerServerEvent('addpermisarmes')
	elseif btn == "Grains de Sables" then
		TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_b", 8.0, 8.0, -1, 48, 1, false, false, false)
		TriggerServerEvent('GrainsdeSables')
		self:CloseMenu()
	elseif btn == "Rondins de Bois" then 
		TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_b", 8.0, 8.0, -1, 48, 1, false, false, false)
		TriggerServerEvent('RondinsdeBois')
		self:CloseMenu()
	elseif btn == "Pierres" then 
		TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_b", 8.0, 8.0, -1, 48, 1, false, false, false)
		TriggerServerEvent('Pierresresell')
		self:CloseMenu()
	elseif btn == "Terres" then 
		TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_b", 8.0, 8.0, -1, 48, 1, false, false, false)
		TriggerServerEvent('Terresresell')
		self:CloseMenu()
	elseif btn == "Morceaux de Ferrailles" then 
		TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_b", 8.0, 8.0, -1, 48, 1, false, false, false)
		TriggerServerEvent('MorceauxdeFerrailles')
		self:CloseMenu()
	elseif btn == ".45" then 
		TriggerServerEvent('achat.45')
	elseif btn == "9mm" then 
		TriggerServerEvent('achat9mm')
	elseif btn == "19mm" then 
		TriggerServerEvent('achat19mm')
	elseif btn == "28mm" then 
		TriggerServerEvent('achat28mm')
	elseif btn == "Calibre 12" then 
		TriggerServerEvent('achatCalibre12')
	elseif btn == "5.56mm" then 
		TriggerServerEvent('5.56mmachat')
	elseif btn == "7.62mm" then 
		TriggerServerEvent('7.62mmachat')
	elseif btn == "300 Magnum" then 
		TriggerServerEvent('achat300Magnum')
	elseif btn == "Boitier d'armes de poing" then
		TriggerServerEvent('achatboitierarmedepoing')
	elseif btn == "Boitier d'armes lourdes" then
		TriggerServerEvent('achatboitierarmelourdes')
	elseif btn == "Tu cherches de la weed ?" then 
		self:CloseMenu(true)
		TriggerServerEvent('poukie1weed')
	elseif btn == "Tu cherches à faire des attaques de Brinks ?" then 
		self:CloseMenu(true)
		TriggerServerEvent('poukie1brinks')
	elseif btn == "Tu cherches des armes ?" then 
		self:CloseMenu(true)
		TriggerServerEvent('poukie1armes')
	elseif btn == "Tu cherches le dealer de weed ?" then 
		startAnims("mp_ped_interaction", "hugs_guy_a")
		self:CloseMenu(true)
		Citizen.Wait(2000)
		TriggerServerEvent('poukie1weed1')
	elseif btn == "Tu cherches la tête de l'attaque ?" then 
		startAnims("mp_ped_interaction", "hugs_guy_a")
		self:CloseMenu(true)
		Citizen.Wait(2000)
		TriggerServerEvent('poukie1brinks1')
	elseif btn == "Tu cherches le dealer des boitiers ?" then 
		startAnims("mp_ped_interaction", "hugs_guy_a")
		self:CloseMenu(true)
		Citizen.Wait(2000)
		TriggerServerEvent('poukie1armes1')
	elseif btn == "20 Pochtars" then 
		TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_b", 8.0, 8.0, -1, 48, 1, false, false, false)
		--self:CloseMenu(true)
		Citizen.Wait(1000)
		TriggerServerEvent('20pochatrsachat')
	elseif btn == "20 Papiers a rouler" then 
		TaskPlayAnim(GetPlayerPed(-1), "mp_common", "givetake1_b", 8.0, 8.0, -1, 48, 1, false, false, false)
		--self:CloseMenu(true)
		Citizen.Wait(1000)
		TriggerServerEvent('20papieraroulerachat')
	elseif btn == 'Bombe Blanc' then 
		TriggerServerEvent('achatBombeBlanc')
	elseif btn == 'Bombe Bleu' then 
		TriggerServerEvent('achatBombeBleu')
	elseif btn == 'Bombe Jaune' then 
		TriggerServerEvent('achatBombeJaune')
	elseif btn == 'Bombe Noir' then 
		TriggerServerEvent('achatBombeNoir')
	elseif btn == 'Bombe Orange' then 
		TriggerServerEvent('achatBombeOrange')
	elseif btn == 'Bombe Rouge' then 
		TriggerServerEvent('achatBombeRouge')
	elseif btn == 'Bombe Verte' then 
		TriggerServerEvent('achatBombeVerte')
	elseif btn == 'Bombe Violet' then 
		TriggerServerEvent('achatBombeViolet')
	end 
end


local Ltdshop = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 255, 125}, Title = "LTD"},
	Data = { currentMenu = "Catégories"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Catégories"] = {
			b = {
				{name = "Boissons",ask = "→", askX = true},
				{name = "Nourritures",ask = "→", askX = true},
				{name = "Multimédia",ask = "→", askX = true}
			}
		},

-------------------------------------------------------------Boissons-------------------------------------------------------------

		["Boissons"] = {
			b = {
				{name = "Eau",ask = "~g~1$", askX = true},
				--{name = "IceTea",ask = "~g~2$", askX = true},
				{name = "Orangina",ask = "~g~2$", askX = true},
				{name = "Seven Up",ask = "~g~2$", askX = true},
				{name = "Sprite",ask = "~g~2$", askX = true},
				{name = "Sirop",ask = "~g~2$", askX = true},
				{name = "Mojito",ask = "~g~4$", askX = true}
			}
		},

-----------------------------------------------------------Nourritures-----------------------------------------------------------

		["Nourritures"] = {
			b = {
				{name = "Pain",ask = "~g~2$", askX = true},
				{name = "Frites",ask = "~g~3$", askX = true},
				--{name = "Hamburger",ask = "~g~4$", askX = true},
				{name = "Pizza",ask = "~g~5$", askX = true}
			}
		},

-----------------------------------------------------------Multimédia-----------------------------------------------------------

		["Multimédia"] = {
			b = {
				{name = "Téléphone",ask = "~g~350$", askX = true}
			}
		}
	}
}

-----------------------------------------------------------Positions-----------------------------------------------------------

local positionshop = {
	-- {x = -706.08,  y = -914.44,  z = 19.2},
	-- {x = 1959.84,  y = 3740.44,  z = 32.36},
	-- {x = -93.381660461426, y = 6410.5473632813, z = 31.640460968018}
}

-------------------------------------------------------------Blips-------------------------------------------------------------

Citizen.CreateThread(function()

    for k in pairs(positionshop) do

	local blip = AddBlipForCoord(positionshop[k].x, positionshop[k].y, positionshop[k].z)

	SetBlipSprite(blip, 59)
	SetBlipColour(blip, 2)
	SetBlipScale(blip, 0.6)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("LTD")
    EndTextCommandSetBlipName(blip)
    end
end)

local posyellowjack = {
	{x = 1985.84,  y = 3051.88,  z = 47.2}
}

-------------------------------------------------------------Blips-------------------------------------------------------------

Citizen.CreateThread(function()

    for k in pairs(posyellowjack) do

	local blip = AddBlipForCoord(posyellowjack[k].x, posyellowjack[k].y, posyellowjack[k].z)

	SetBlipSprite(blip, 93)
	SetBlipColour(blip, 66)
	SetBlipScale(blip, 0.6)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Yellow Jack")
    EndTextCommandSetBlipName(blip)
    end
end)

----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(positionshop) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positionshop[k].x, positionshop[k].y, positionshop[k].z)

			if dist <= 2.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
                --ESX.ShowHelpNotification("Appuez sur ~INPUT_TALK~ pour acceder au ~b~LTD")
				if IsControlJustPressed(1,51) then 
                    --mainMenu:Visible(not mainMenu:Visible())
                    --print("test")
                    CreateMenu(Ltdshop)
				end
				break
            else
                attente = 150
            end
        end
    end
end)

local ammuls = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 255, 125}, Title = "Ammunation LS"},
	Data = { currentMenu = "Catégories"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Catégories"] = {
			b = {
				{name = "Armes de Mêlée",ask = "→", askX = true},
				{name = "Armes de Poing",ask = "→", askX = true},
				{name = "Divers",ask = "→", askX = true},
				{name = "Accessoires",ask = "→", askX = true}
			}
		},
		["Armes de Mêlée"] = {
			b = {
				--{name = "Fumigène",ask = "~g~15$", askX = true},
				{name = "Bouteille cassée",ask = "~g~20$", askX = true},
				{name = "Lampe torche",ask = "~g~50$", askX = true},
				{name = "Couteau",ask = "~g~225$", askX = true},
				{name = "Cran d'arrêt",ask = "~g~250$", askX = true},
				{name = "Marteau",ask = "~g~275$", askX = true},
				{name = "Queue de billard",ask = "~g~300$", askX = true},
				{name = "Katana",ask = "~g~325$", askX = true},
				{name = "Poing américain",ask = "~g~425$", askX = true},
				{name = "Batte de baseball",ask = "~g~450$", askX = true},
				{name = "Pied de biche",ask = "~g~475$", askX = true}
			}
		},
		["Armes de Poing"] = {
			b = {
				-- {name = "Tazer",ask = "~r~1 250$", askX = true},
				{name = "Colt-25",ask = "~g~5 000$", askX = true},
				{name = "Pistolet Ancien",ask = "~g~11 500", askX = true},
				{name = "Revolver",ask = "~g~20 500$", askX = true},
				{name = "Berreta 92",ask = "~g~25 000$", askX = true},
				{name = "Double-Action Revolver",ask = "~g~31 500$", askX = true},
				-- {name = "Glock-17",ask = "~r~9 600$", askX = true},
				-- {name = "Colt-911",ask = "~r~15 350$", askX = true},
				{name = "Desert Eagle",ask = "~g~37 250$", askX = true}
				--{name = "Pistolet automatique",ask = "~r~16 500$", askX = true},
				--{name = "Pistolet de Detresse",ask = "~r~425$", askX = true},
			}
		},
		["Divers"] = {
			b = {
				{name = "Jerrican d'essence",ask = "~g~15$", askX = true},
				{name = "Parachute",ask = "~g~20$", askX = true},
				{name = "Extincteur",ask = "~g~25$", askX = true}
			}
		},
		["Accessoires"] = {
			b = {
				{name = "Poignée",ask = "~g~25$", askX = true},
				{name = "Chargeur",ask = "~g~50$", askX = true},
				{name = "Silencieux",ask = "~g~150$", askX = true}
			}
		}
	}
}

local ammubc = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 255, 125}, Title = "Ammunation BC"},
	Data = { currentMenu = "Catégories"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Catégories"] = {
			b = {
				{name = "Armes de Mêlée",ask = "→", askX = true},
				{name = "Armes de Poing",ask = "→", askX = true},
				{name = "Divers",ask = "→", askX = true},
				{name = "Accessoires",ask = "→", askX = true}
			}
		},
		["Armes de Poing"] = {
			b = {
				-- {name = "Tazer",ask = "~r~1 250$", askX = true},
				{name = "Colt-25",ask = "~g~5 000$", askX = true},
				{name = "Pistolet Ancien",ask = "~g~11 500", askX = true},
				{name = "Revolver",ask = "~g~20 500$", askX = true},
				{name = "Berreta 92",ask = "~g~25 000$", askX = true},
				{name = "Double-Action Revolver",ask = "~g~31 500$", askX = true},
				-- {name = "Glock-17",ask = "~r~9 600$", askX = true},
				-- {name = "Colt-911",ask = "~r~15 350$", askX = true},
				{name = "Desert Eagle",ask = "~g~37 250$", askX = true}
				--{name = "Pistolet automatique",ask = "~r~16 500$", askX = true},
				--{name = "Pistolet de Detresse",ask = "~r~425$", askX = true},
			}
		},
		["Divers"] = {
			b = {
				{name = "Jerrican d'essence",ask = "~g~15$", askX = true},
				{name = "Parachute",ask = "~g~20$", askX = true},
				{name = "Extincteur",ask = "~g~25$", askX = true}
			}
		},
		["Accessoires"] = {
			b = {
				{name = "Chargeur",ask = "~g~50$", askX = true},
				{name = "Lampe",ask = "~g~75$", askX = true},
				{name = "Skin de luxe",ask = "~g~1250$", askX = true},
				--{name = "Grand Chargeur",ask = "~g~100$", askX = true}
			}
		}
	}
}

local acheterLicense = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 255, 125}, Title = "Ammunation LS"},
	Data = { currentMenu = "Voulez vous une license ?"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Voulez vous une license ?"] = {
			b = {
				{name = "Acheter",ask = "~g~5000$", askX = true},
				{name = "Annuler",ask = "→", askX = true}
			}
		}
	}
}

-----------------------------------------------------------Positions-----------------------------------------------------------

local positionammusud = {
	{x = 22.496, y= -1107.018, z= 28.8}
}

local positionammunord = {
	{x = 1692.8,  y = 3761.52,  z = 34.72}
}

-------------------------------------------------------------Blips-------------------------------------------------------------

Citizen.CreateThread(function()

    for k in pairs(positionammunord) do

	local blip = AddBlipForCoord(positionammunord[k].x, positionammunord[k].y, positionammunord[k].z)

	SetBlipSprite(blip, 313)
	SetBlipColour(blip, 1)
	SetBlipDisplay(blip, 2)
	SetBlipScale(blip, 0.5)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Ammunation BC")
    EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()

    for k in pairs(positionammusud) do

	local blip = AddBlipForCoord(positionammusud[k].x, positionammusud[k].y, positionammusud[k].z)

	SetBlipSprite(blip, 313)
	SetBlipColour(blip, 1)
	SetBlipDisplay(blip, 2)
	SetBlipScale(blip, 0.5)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Ammunation LS")
    EndTextCommandSetBlipName(blip)
    end
end)

----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(positionammunord) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positionammunord[k].x, positionammunord[k].y, positionammunord[k].z)

			if dist <= 2.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
				if IsControlJustPressed(1,51) then 
					-- print("ouioui")
                    ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
						if hasWeaponLicense then
							-- print("oui")
							CreateMenu(ammubc)
						else
							-- print("non")
							ESX.ShowNotification('Vous n\'avez pas de ~g~PPA')
							CreateMenu(acheterLicense)
						end
					end, GetPlayerServerId(PlayerId()), 'weapon')
				end
				break
            else
                attente = 150
            end
        end
    end
end)

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(positionammusud) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, positionammusud[k].x, positionammusud[k].y, positionammusud[k].z)

			if dist <= 2.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
				if IsControlJustPressed(1,51) then 
					ESX.TriggerServerCallback('esx_license:checkLicense', function(hasWeaponLicense)
						if hasWeaponLicense then
							CreateMenu(ammuls)
						else
							CreateMenu(acheterLicense)
						end
					end, GetPlayerServerId(PlayerId()), 'weapon')
				end
				break
			else
				attente = 150
			end
        end
    end
end)

local menuweedealer = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 255, 125}, Title = "Dealer"},
	Data = { currentMenu = "Graines"},
	Events = { onSelected = OnSelected },
	Menu = {
--[[ 		["Objets"] = {
			b = {
				{name = "Graines",ask = "→", askX = true},
				{name = "Outils",ask = "→", askX = true}
			}
		}, ]]
		["Graines"] = {
			b = {
				{name = "Graines Weed",ask = "~g~50$", askX = true},
				--{name = "Outils",ask = "→", askX = true}
			}
		},
--[[ 		["Graines"] = {
			b = {
				{name = "Graines Weed",ask = "~g~50$", askX = true}
			}
		},
		["Outils"] = {
			b = {
				{name = "Pot",ask = "~g~3$", askX = true},
				{name = "Truelle",ask = "~g~9$", askX = true},
				--{name = "Pelle",ask = "~g~25$", askX = true}
			}
		} ]]
	}
}

local weedealer = {
	-- {x = 861.2,  y = 3673.72,  z = 32.88}
}

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(weedealer) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, weedealer[k].x, weedealer[k].y, weedealer[k].z)

			if dist <= 2.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
				if IsControlJustPressed(1,51) then 
					ESX.DrawMissionText("~g~Yo man tu veux quoi ?", 2500)
					startAnims("mp_ped_interaction", "hugs_guy_a")
					Citizen.Wait(2500)
                    CreateMenu(menuweedealer)
				end
				break
            else
                attente = 150
            end
        end
    end
end)

function startAnims(lib, anim)
	ESX.Streaming.RequestAnimDict(lib, function()
		TaskPlayAnim(PlayerPedId(), lib, anim, 2.0, 2.0, -1, 0, 0, false, false, false)
	end)
end

local burgershop = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 0, 250}, Title = "Burger Shot"},
	Data = { currentMenu = "Produits Disponibles"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Produits Disponibles"] = {
			b = {
				{name = "IceTea",ask = "~g~1$", askX = true},
				{name = "Hamburger",ask = "~g~2$", askX = true}
			}
		}
	}
}

local posburgershop = {
	{x = -10.92,  y = 6499.16,  z = 31.52}
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(posburgershop) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posburgershop[k].x, posburgershop[k].y, posburgershop[k].z)

			if PlayerData.job ~= nil and PlayerData.job.name == 'burgershot' then
				if dist <= 2.0 then
					ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
					if IsControlJustPressed(1,51) then 
						--ESX.ShowHelpNotification("")
                    	CreateMenu(burgershop)
					end
				end
            end
        end
    end
end)



local menuidentite = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 80, 0}, Title = "Jazzy"},
	Data = { currentMenu = "Jazzy"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Jazzy"] = {
			b = {
				{name = "Obtenir sa carte d'identité",ask = "~g~2$", askX = true},
				{name = "Obtenir sa carte de conduire",ask = "~g~50$", askX = true},
				{name = "Obtenir son permis d'armes",ask = "~g~50$", askX = true},
			}
		}
	}
}

local posspawncarlspdnorth = {
	{x = -1097.4935302734, y = -839.84619140625, z = 19.001510620117},
	{x = -448.23, y = 6013.789,  z = 30.80}
}

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(posspawncarlspdnorth) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posspawncarlspdnorth[k].x, posspawncarlspdnorth[k].y, posspawncarlspdnorth[k].z)

			if dist <= 3.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
				if IsControlJustPressed(1,51) then 
                    CreateMenu(menuidentite)
				end
				break
            else
                attente = 150
            end
        end
    end
end)



-----------------------------------------------------------RESELLER-----------------------------------------------------------


local resellershop = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 0, 0}, Title = "Reseller"},
	Data = { currentMenu = "Reseller"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Reseller"] = {
			b = {
				{name = "Clé USB Weed",ask = "1 ~s~= ~r~150 000$", askX = true},
				{name = "Clé USB Coke",ask = "1 ~s~= ~r~350 000$", askX = true},
				{name = "Clé USB Meth",ask = "1 ~s~= ~r~600 000$", askX = true},
				{name = "Lingot d'or",ask = "1 ~s~= ~r~20 000$", askX = true},
				{name = "Boîte de diamant",ask = "1 ~s~= ~r~25 000$", askX = true},
			}
		}
	}
}

-----------------------------------------------------------Positions-----------------------------------------------------------

local posreseller = {
	{x = -284.52,  y = -2780.88,  z = 4.2}
}

----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(posreseller) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posreseller[k].x, posreseller[k].y, posreseller[k].z)

			if dist <= 2.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
				if IsControlJustPressed(1,51) then 
                    CreateMenu(resellershop)
				end
				break
            else
                attente = 150
            end
        end
    end
end)

local posblipied = {
	{x = 440.8, y = -981.12, z = 30.68},
	-- {x = 308.68, y = -592.56, z = 43.28},
	{x = 13.64,  y = -1097.24,  z = 29.84},
	{x = -30.88,  y = -1106.64,  z = 26.44},
	{x = -1194.4,  y = -892.16,  z = 14.0},
	{x = 984.88,  y = -98.72,  z = 74.84},
	{x = 906.08,  y = -150.52,  z = 74.16},
	{x = -347.32,  y = -133.28,  z = 39.0},
	{x = -1082.04,  y = -247.52,  z = 37.76},
	{x = -604.16,  y = -1592.24,  z = 26.76},
	{x = -447.76,  y = 6013.08,  z = 31.72},
}
Citizen.CreateThread(function()

	for k in pairs(posblipied) do
	local blip = AddBlipForCoord(posblipied[k].x, posblipied[k].y, posblipied[k].z)

	SetBlipSprite(blip, 1)
	--SetBlipColour(blip, 2)
	SetBlipScale(blip, 0.5)
	SetBlipAsShortRange(blip, true)
	SetBlipDisplay(blip, 9)

	end
end)

-----------------------------------------------------------REVENDEUR 1-----------------------------------------------------------


local vendeuramres = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 0, 0}, Title = "Billy"},
	Data = { currentMenu = "Billy"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Billy"] = {
			b = {
				--{name = "Chargeur Basique",ask = "~r~25$", askX = true},
				{name = "Chargeur Long",ask = "~r~50$", askX = true},
				{name = "Chargeur Drum",ask = "~r~75$", askX = true},
				{name = "-----------------------------------------------------------------------"},
				{name = "Lampe de Billy",ask = "~r~25$", askX = true},
				{name = "Silencieux de Billy",ask = "~r~100$", askX = true},
				{name = "Viseur",ask = "~r~175$", askX = true},
				{name = "Skin de luxe de Billy",ask = "~r~425$", askX = true},
			}
		}
	}
}

-----------------------------------------------------------Positions-----------------------------------------------------------

local posvendeuramres = {
	{x = 1414.0,  y = 6351.92,  z = 24.08}
}

----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(posvendeuramres) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posvendeuramres[k].x, posvendeuramres[k].y, posvendeuramres[k].z)

			if dist <= 2.0 then
				attente = 1
				if IsControlJustPressed(1,51) then 
                    CreateMenu(vendeuramres)
				end
				break
            else
                attente = 150
            end
        end
    end
end)

-----------------------------------------------------------REVENDEUR 2-----------------------------------------------------------


local vendeurcleusb = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 0, 0}, Title = "Jhonny"},
	Data = { currentMenu = "Jhonny"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Jhonny"] = {
			b = {
				{name = "Weed : Clé USB",ask = "~r~250 000$", askX = true},
				{name = "Coke : Clé USB",ask = "~r~500 000$", askX = true},
				{name = "Meth : Clé USB",ask = "~r~750 000$", askX = true},
				{name = "Carte d'accès banque (fleeca)",ask = "~g~5 000$", askX = true},
				{name = "Carte d'accès coffre (fleeca)",ask = "~g~2 500$", askX = true},
				{name = "Charge thermique (pacific)",ask = "~g~5 000$", askX = true},
			}
		}
	}
}

-----------------------------------------------------------Positions-----------------------------------------------------------

local posvendeurcleusb = {
	{x = 2872.8,  y = 4725.36,  z = 49.0}
}

----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(posvendeurcleusb) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posvendeurcleusb[k].x, posvendeurcleusb[k].y, posvendeurcleusb[k].z)

			if dist <= 2.0 then
				attente = 1
				if IsControlJustPressed(1,51) then 
                    CreateMenu(vendeurcleusb)
				end
				break
            else
                attente = 150
            end
        end
    end
end)


-----------------------------------------------------------REVENDEUR 3-----------------------------------------------------------

local menuventearmes = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {125, 0, 0}, Title = "Jackson"},
	Data = { currentMenu = "Jackson"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Jackson"] = {
			b = {
				{name = "Armes de Poings",ask = "→", askX = true},
				-- {name = "Fusils d'Assauts",ask = "→", askX = true},
				-- {name = "Fusils Mitrailleurs",ask = "→", askX = true},
				-- {name = "Fusils à Pompes",ask = "→", askX = true},
				-- {name = "Grenades",ask = "→", askX = true},
				-- {name = "Snipers",ask = "→", askX = true},
				{name = "Divers",ask = "→", askX = true},
			}
		},
		["Armes de Poings"] = {
			b = {
				-- {name = "Tazer",ask = "~r~1 250$", askX = true},
				{name = "Colt-25",ask = "~r~5 000$", askX = true},
				{name = "Pistolet Ancien",ask = "~r~11 500", askX = true},
				{name = "Revolver",ask = "~r~20 500$", askX = true},
				{name = "Berreta 92",ask = "~r~25 000$", askX = true},
				{name = "Double-Action Revolver",ask = "~r~31 500$", askX = true},
				-- {name = "Glock-17",ask = "~r~9 600$", askX = true},
				-- {name = "Colt-911",ask = "~r~15 350$", askX = true},
				{name = "Desert Eagle",ask = "~r~37 250$", askX = true},
				--{name = "Pistolet automatique",ask = "~r~16 500$", askX = true},
				--{name = "Pistolet de Detresse",ask = "~r~425$", askX = true},
			}
		},
		["Fusils d'Assauts"] = {
			b = {
				{name = "AK-U",ask = "~r~125 000$", askX = true},
				{name = "AK-47",ask = "~r~250 000$", askX = true},
				--{name = "Fusil avancé",ask = "~r~350 000$", askX = true},
				--{name = "Fusil bullpup",ask = "~r~425 000$", askX = true},
				--{name = "M4A1",ask = "~r~455 000$", askX = true},
				--{name = "M4A1 Sécial",ask = "~r~555 000$", askX = true}
			}
		},
		["Fusils Mitrailleurs"] = {
			b = {
				{name = "Tec-9",ask = "~r~23 500$", askX = true},
				{name = "Scorpion VZ61",ask = "~r~26 450$", askX = true},
				{name = "UZI",ask = "~r~35 350$", askX = true},
				--{name = "MP5",ask = "~r~65 000$", askX = true},
				--{name = "P90",ask = "~r~105 000$", askX = true},
				--{name = "Arme de défense personnelle",ask = "~r~95 000$", askX = true},
				{name = "Balayeuse gusenberg",ask = "~r~285 000$", askX = true}
			}
		},
		["Fusils à Pompes"] = {
			b = {
				{name = "ST87 Saw",ask = "~r~96 500$", askX = true},
				--{name = "Mousquet",ask = "~r~225$", askX = true},
				{name = "Fusil à pompe double canon",ask = "~r~125 000$", askX = true},
				--{name = "Fusil à pompe automatique",ask = "~r~213 500$", askX = true},
				{name = "Fusil à pompe",ask = "~r~265 000$", askX = true},
				--{name = "Fusil à pompe d\'assaut",ask = "~r~295 000$", askX = true},
				--{name = "Fusil à pompe lourd",ask = "~r~345 000$", askX = true}
			}
		},
		["Grenades"] = {
			b = {
				{name = "Fumigène rouge",ask = "~r~10$", askX = true},
				{name = "Cocktail molotov",ask = "~r~1 550$", askX = true},
				{name = "Grenade à gaz bz",ask = "~r~2 000$", askX = true},
				{name = "Grenade",ask = "~r~2 500$", askX = true},
				--{name = "Bombe collante",ask = "~r~4 500$", askX = true}
			}
		},
		["Snipers"] = {
			b = {
				{name = "Fusil marksman",ask = "~r~950 000$", askX = true},
				{name = "Fusil de sniper",ask = "~r~1 100 000$", askX = true},
				--{name = "Fusil de sniper lourd",ask = "~r~1 250 000$", askX = true}
			}
		},
		["Divers"] = {
			b = {
				{name = "Jerrican d'essence",ask = "~r~15$", askX = true},
				{name = "Parachute",ask = "~r~20$", askX = true},
				{name = "Extincteur",ask = "~r~25$", askX = true}
			}
		},
	}
}

-----------------------------------------------------------Positions-----------------------------------------------------------

local posventearmes = {
	{x = 20.09,  y = -1106.02,  z = -20.8}
}

----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(posventearmes) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posventearmes[k].x, posventearmes[k].y, posventearmes[k].z)

			if dist <= 2.0 then
				attente = 1
				if IsControlJustPressed(1,51) then 
                    CreateMenu(menuventearmes)
				end
				break
            else
                attente = 150
            end
        end
    end
end)

-----------------------------------------------------------REVENDEUR 4-----------------------------------------------------------


local vendeurdivers = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {255, 0, 0}, Title = "Zack"},
	Data = { currentMenu = "Zack"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Zack"] = {
			b = {
				{name = "Tenues",ask = "→", askX = true},
				{name = "Autres",ask = "→", askX = true},
			}
		},
		["Tenues"] = {
			b = {
				{name = "Kevlar",ask = "~r~50$", askX = true},
				{name = "Hazmat noire",ask = "~r~35$", askX = true},
				{name = "Hazmat bleu",ask = "~r~35$", askX = true},
				{name = "Hazmat blanche",ask = "~r~35$", askX = true},
				{name = "Hazmat jaune",ask = "~r~35$", askX = true},
				{name = "Casa de papel",ask = "~r~35$", askX = true},
				{name = "Karting rouge",ask = "~r~35$", askX = true},
				{name = "Karting noir",ask = "~r~35$", askX = true},
				{name = "SkyDiving",ask = "~r~35$", askX = true},
				{name = "Prisonnier",ask = "~r~35$", askX = true},
				{name = "Little Pricks",ask = "~r~35$", askX = true},
				{name = "Masque de Plongé",ask = "~r~35$", askX = true},
				{name = "Tenue Mécano",ask = "~r~35$", askX = true},
			}
		},
		["Autres"] = {
			b = {
				{name = "Bmx",ask = "~r~5$", askX = true},
				{name = "Bong",ask = "~r~5$", askX = true},
			}
		}
	}
}

-----------------------------------------------------------Positions-----------------------------------------------------------

local posvendeurdivers = {
	{x = -565.64,  y = 295.88,  z = 83.04}
}

----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(posvendeurdivers) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posvendeurdivers[k].x, posvendeurdivers[k].y, posvendeurdivers[k].z)

			if dist <= 1.5 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
				if IsControlJustPressed(1,51) then 
                    CreateMenu(vendeurdivers)
				end
				break
            else
                attente = 150
            end
        end
    end
end)

-----------------------------------------------------------REVENDEUR 5-----------------------------------------------------------


local vendeurdiverslockpick = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {50, 25, 20}, Title = "Bradley"},
	Data = { currentMenu = "Bradley"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Bradley"] = {
			b = {
				{name = "Chalumaux",ask = "~g~155$", askX = true},
				{name = "Outil de crochetage",ask = "~g~20$", askX = true},
				-- {name = "Outil de serrure",ask = "~g~65$", askX = true},
				{name = "Menottes",ask = "~g~155$", askX = true},
				{name = "Pelle",ask = "~g~135$", askX = true},
				-- {name = "Radio", ask = "~g~150$", askX = true},
				-- {name = "Pinces",ask = "~g~65$", askX = true},
				-- {name = "Pot",ask = "~g~17$", askX = true},
				-- {name = "Truelle",ask = "~g~35$", askX = true},
				{name = "Sac tactique",ask = "~g~75$", askX = true},
			}
		}
	}
}

-----------------------------------------------------------Positions-----------------------------------------------------------

local posdelaerlockpick = {
	{x = -1142.44,  y = -1993.04,  z = 13.16},
	{x = 1041.28,  y = 2652.36,  z = 39.56},
	--{x = 1653.2,  y = 4746.32,  z = 42.04},
	--{x = -85.04,  y = 6406.44,  z = 31.76}
}

Citizen.CreateThread(function()

    for k in pairs(posdelaerlockpick) do

	local blip = AddBlipForCoord(posdelaerlockpick[k].x, posdelaerlockpick[k].y, posdelaerlockpick[k].z)

	SetBlipSprite(blip, 566)
	SetBlipColour(blip, 38)
	SetBlipDisplay(blip, 8)
	SetBlipScale(blip, 0.6)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Bradley")
    EndTextCommandSetBlipName(blip)
    end
end)
----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(posdelaerlockpick) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posdelaerlockpick[k].x, posdelaerlockpick[k].y, posdelaerlockpick[k].z)

			if dist <= 2.0 then
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
				attente = 1
				if IsControlJustPressed(1,51) then 
                    CreateMenu(vendeurdiverslockpick)
				end
				break
            else
                attente = 150
            end
        end
    end
end)


-----------------------------------------------------------RESELLER-----------------------------------------------------------

--[[ 
local resellerlegalshop = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {5, 36, 0}, Title = "Brownil"},
	Data = { currentMenu = "Brownil"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Brownil"] = {
			b = {
				{name = "Pierres",ask = "3 ~s~= ~g~5$", askX = true},
				{name = "Terres",ask = "60 ~s~= ~g~60$", askX = true},
				{name = "Rondins de Bois",ask = "3 ~s~= ~g~6$", askX = true},
				{name = "Morceaux de Ferrailles",ask = "3 ~s~= ~g~7$", askX = true},
				{name = "Grains de Sables",ask = "10 ~s~= ~g~18$", askX = true},
			}
		}
	}
}

-----------------------------------------------------------Positions-----------------------------------------------------------

local posresellerlegalfarm = {
	{x = 464.24,  y = 3564.04,  z = 33.68},
	--{x = -56.96,  y = 6521.32,  z = 31.48}
}

----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

Citizen.CreateThread(function()

    for k in pairs(posresellerlegalfarm) do

	local blip = AddBlipForCoord(posresellerlegalfarm[k].x, posresellerlegalfarm[k].y, posresellerlegalfarm[k].z)

	SetBlipSprite(blip, 269)
	SetBlipColour(blip, 2)
	SetBlipScale(blip, 1.0)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Reseller Légal")
    EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(posresellerlegalfarm) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posresellerlegalfarm[k].x, posresellerlegalfarm[k].y, posresellerlegalfarm[k].z)

			if dist <= 2.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
				if IsControlJustPressed(1,51) then 
                    CreateMenu(resellerlegalshop)
				end
				break
            else
                attente = 150
            end
        end
    end
end) ]]

--[[ local plagemunitions = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {0, 255, 125}, Title = "Marchand de Munitions"},
	Data = { currentMenu = "Munitions"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Munitions"] = {
			b = {
				{name = ".45",ask = "~g~5$", askX = true},
				{name = "9mm",ask = "~g~8$", askX = true},
				{name = "19mm",ask = "~g~12$", askX = true},
				{name = "28mm",ask = "~g~15$", askX = true},
				{name = "Calibre 12",ask = "~g~16$", askX = true},
				{name = "5.56mm",ask = "~g~17$", askX = true},
				{name = "7.62mm",ask = "~g~19$", askX = true},
				{name = "300 Magnum",ask = "~g~25$", askX = true},
			}
		}
	}
}

-----------------------------------------------------------Positions-----------------------------------------------------------

local posplagemunitions = {
	{x = -1323.88,  y = -1516.32,  z = 4.44}
}
Citizen.CreateThread(function()

    for k in pairs(posplagemunitions) do

	local blip = AddBlipForCoord(posplagemunitions[k].x, posplagemunitions[k].y, posplagemunitions[k].z)

	SetBlipSprite(blip, 556)
	SetBlipColour(blip, 40)
	SetBlipScale(blip, 0.7)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Ammunnations Chargeurs")
    EndTextCommandSetBlipName(blip)
    end
end)

----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(posplagemunitions) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posplagemunitions[k].x, posplagemunitions[k].y, posplagemunitions[k].z)

			if dist <= 2.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
                --ESX.ShowHelpNotification("Appuez sur ~INPUT_TALK~ pour acceder au ~b~LTD")
				if IsControlJustPressed(1,51) then 
                    --mainMenu:Visible(not mainMenu:Visible())
                    --print("test")
                    CreateMenu(plagemunitions)
				end
				break
            else
                attente = 150
            end
        end
    end
end) ]]


local menumissionpookkkiie = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {125, 20, 40}, Title = "Lemar"},
	Data = { currentMenu = "Poucave"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Poucave"] = {
			b = {
				{name = "Tu cherches de la weed ?",ask = "~g~150$", askX = true},
				--{name = "Tu cherches à faire des attaques de Brinks ?",ask = "~g~765$", askX = true},
				--{name = "Tu cherches des armes ?",ask = "~r~1 250$", askX = true},
			}
		}
	}
}

-----------------------------------------------------------Positions-----------------------------------------------------------

--[[ local posmissionpokkie = {
	{x = -32.4,  y = -184.48,  z = 53.72},
	{x = -340.64,  y = 6239.76,  z = 31.48}
}

Citizen.CreateThread(function()

    for k in pairs(posmissionpokkie) do

	local blip = AddBlipForCoord(posmissionpokkie[k].x, posmissionpokkie[k].y, posmissionpokkie[k].z)

	SetBlipSprite(blip, 205)
	SetBlipColour(blip, 50)
	SetBlipScale(blip, 0.5)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Lemar")
    EndTextCommandSetBlipName(blip)
    end
end)


----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(posmissionpokkie) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posmissionpokkie[k].x, posmissionpokkie[k].y, posmissionpokkie[k].z)

			if dist <= 2.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
				if IsControlJustPressed(1,51) then 
                    CreateMenu(menumissionpookkkiie)
				end
				break
            else
                attente = 150
            end
        end
    end
end) ]]


local menumissionpookkkiieweed = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {125, 20, 40}, Title = "Logans"},
	Data = { currentMenu = "Poucave"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Poucave"] = {
			b = {
				{name = "Tu cherches le dealer de weed ?",ask = "~g~645$", askX = true},
			}
		}
	}
}

-----------------------------------------------------------Positions-----------------------------------------------------------

local posmissionpokkieweed = {
	-- {x = -1907.96,  y = -570.68,  z = 22.96},
}


----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(posmissionpokkieweed) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posmissionpokkieweed[k].x, posmissionpokkieweed[k].y, posmissionpokkieweed[k].z)

			if dist <= 2.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
				if IsControlJustPressed(1,51) then 
					startAnims("mp_ped_interaction", "hugs_guy_a")
                    ESX.DrawMissionText("~g~Salut mec tu veux une info ?", 2000)
					Citizen.Wait(2000)
					ESX.DrawMissionText("~g~Concernant la weed ?", 2000)
					Citizen.Wait(2000)
					ESX.DrawMissionText("~g~Ok bouge pas je te dit ça.", 2000)
					CreateMenu(menumissionpookkkiieweed)
				end
				break
            else
                attente = 150
            end
        end
    end
end)

local menumissionpookkkiiebrinks= {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {125, 20, 40}, Title = "Alfred"},
	Data = { currentMenu = "Poucave"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Poucave"] = {
			b = {
				{name = "Tu cherches la tête de l'attaque ?",ask = "~r~1 642$", askX = true},
			}
		}
	}
}

-----------------------------------------------------------Positions-----------------------------------------------------------

local posmissionpokkiebrinks = {
	{x = 791.6,  y = 2176.48,  z = 52.64},
}


----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(posmissionpokkiebrinks) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posmissionpokkiebrinks[k].x, posmissionpokkiebrinks[k].y, posmissionpokkiebrinks[k].z)

			if dist <= 2.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
				if IsControlJustPressed(1,51) then 
					startAnims("mp_ped_interaction", "hugs_guy_a")
                    ESX.DrawMissionText("~g~Salut mec tu veux une info ?", 2000)
					Citizen.Wait(2000)
					ESX.DrawMissionText("~g~Concernant la Brinks ?", 2000)
					Citizen.Wait(2000)
					ESX.DrawMissionText("~g~Ok bouge pas je te dit ça.", 2000)
					CreateMenu(menumissionpookkkiiebrinks)
				end
				break
            else
                attente = 150
            end
        end
    end
end)

--[[ local menumissionpookkkiiearmes = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {125, 20, 40}, Title = "Alfred"},
	Data = { currentMenu = "Poucave"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Poucave"] = {
			b = {
				{name = "Tu cherches le dealer des boitiers ?",ask = "~r~6 230$", askX = true},
			}
		}
	}
}

-----------------------------------------------------------Positions-----------------------------------------------------------

local posmissionpokkiarmess = {
	{x = 491.44,  y = 2945.12,  z = 42.48},
}


----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(posmissionpokkiarmess) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posmissionpokkiarmess[k].x, posmissionpokkiarmess[k].y, posmissionpokkiarmess[k].z)

			if dist <= 2.0 then
				attente = 1
				if IsControlJustPressed(1,51) then 
					startAnims("mp_ped_interaction", "hugs_guy_a")
                    ESX.DrawMissionText("~g~Salut mec tu veux une info ?", 2000)
					Citizen.Wait(2000)
					ESX.DrawMissionText("~g~Concernant les armes ?", 2000)
					Citizen.Wait(2000)
					ESX.DrawMissionText("~g~Ok bouge pas je te dit ça.", 2000)
					CreateMenu(menumissionpookkkiiearmes)
				end
				break
            else
                attente = 150
            end
        end
    end
end)


local menuarmesboitierarmes = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {20, 100, 20}, Title = "Olings"},
	Data = { currentMenu = "Boitiers disponibles"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Boitiers disponibles"] = {
			b = {
				{name = "Boitier d'armes de poing",ask = "~r~15 230$", askX = true},
				{name = "Boitier d'armes lourdes",ask = "~r~94 250$", askX = true},
			}
		}
	}
}

-----------------------------------------------------------Positions-----------------------------------------------------------

local posboitieramres = {
	{x = 695.96,  y = 4183.32,  z = 41.24},
}


----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(posboitieramres) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posboitieramres[k].x, posboitieramres[k].y, posboitieramres[k].z)

			if dist <= 2.0 then
				attente = 1
				if IsControlJustPressed(1,51) then 
                    CreateMenu(menuarmesboitierarmes)
				end
				break
            else
                attente = 150
            end
        end
    end
end) ]]

-- local menupochons = {
-- 	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {2050, 10, 212}, Title = "Kingston"},
-- 	Data = { currentMenu = "Articles disponibles"},
-- 	Events = { onSelected = OnSelected },
-- 	Menu = {
-- 		["Articles disponibles"] = {
-- 			b = {
-- 				{name = "20 Pochtars",ask = "~g~20$", askX = true},
-- 				{name = "20 Papiers a rouler",ask = "~g~20$", askX = true},
-- 			}
-- 		}
-- 	}
-- }

-- -----------------------------------------------------------Positions-----------------------------------------------------------

-- local pospochonsshop = {
-- 	{x = -90.44,  y = 1886.64,  z = 197.32},
-- }

-- Citizen.CreateThread(function()

--     for k in pairs(pospochonsshop) do

-- 	local blip = AddBlipForCoord(pospochonsshop[k].x, pospochonsshop[k].y, pospochonsshop[k].z)

-- 	SetBlipSprite(blip, 469)
-- 	SetBlipColour(blip, 2)
-- 	SetBlipScale(blip, 0.7)
-- 	SetBlipAsShortRange(blip, true)

-- 	BeginTextCommandSetBlipName("STRING")
-- 	AddTextComponentString("Marchand de Pochtars")
--     EndTextCommandSetBlipName(blip)
--     end
-- end)

----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

-- Citizen.CreateThread(function()
--     local attente = 150
--     while true do
--         Wait(attente)

--         for k in pairs(pospochonsshop) do

--             local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
--             local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, pospochonsshop[k].x, pospochonsshop[k].y, pospochonsshop[k].z)

-- 			if dist <= 2.0 then
-- 				attente = 1
-- 				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
-- 				if IsControlJustPressed(1,51) then 
--                     CreateMenu(menupochons)
-- 				end
-- 				break
--             else
--                 attente = 150
--             end
--         end
--     end
-- end)

local vendeursbombepeint = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {20, 230, 190}, Title = "Oklando"},
	Data = { currentMenu = "Oklando"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Oklando"] = {
			b = {
				{name = "Bombe Blanc",ask = "~g~20$", askX = true},
				{name = "Bombe Bleu",ask = "~g~20$", askX = true},
				{name = "Bombe Jaune",ask = "~g~20$", askX = true},
				{name = "Bombe Noir",ask = "~g~20$", askX = true},
				{name = "Bombe Orange",ask = "~g~20$", askX = true},
				{name = "Bombe Rouge",ask = "~g~20$", askX = true},
				{name = "Bombe Verte",ask = "~g~20$", askX = true},
				{name = "Bombe Violet",ask = "~g~20$", askX = true},
			}
		}
	}
}

-----------------------------------------------------------Positions-----------------------------------------------------------

local posvendeursbombepeintk = {
	-- {x = 54.68,  y = -115.36,  z = 55.96}
}

----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(posvendeursbombepeintk) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posvendeursbombepeintk[k].x, posvendeursbombepeintk[k].y, posvendeursbombepeintk[k].z)

			if dist <= 2.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
				if IsControlJustPressed(1,51) then 
                    CreateMenu(vendeursbombepeint)
				end
				break
            else
                attente = 150
            end
        end
    end
end)


local posplasticchirur = {
	-- {x = 397.56,  y = -1004.48,  z = -99.0}
}

----------------------------------------------------------Ouvrir Menu-----------------------------------------------------------

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)

        for k in pairs(posplasticchirur) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posplasticchirur[k].x, posplasticchirur[k].y, posplasticchirur[k].z)

			if dist <= 2.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
				DrawMarker(25, posplasticchirur[k].x, posplasticchirur[k].y, posplasticchirur[k].z-0.98, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.25, 1.25, 1.0001, 0, 128, 0, 200, 0, 0, 0, 0)
				if IsControlJustPressed(1,51) then 
					OpenPlasticSurgery()
				end
				break
            else
                attente = 150
            end
        end
    end
end)

function OpenPlasticSurgery()
	--HasPaid = false
	
	TriggerEvent('esx_skin:openSaveableMenu', function(data, menu)
		menu.close()

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'shop_confirm', {
			css   = 'head',
			title = "Valider cette création ?",
			align = 'top-left',
			elements = {
				{label = "Non",  value = 'no'},
				{label = "Oui", value = 'yes'}
			}
		}, function(data, menu)
			menu.close()
			
			if data.current.value == 'yes' then
				--ESX.TriggerServerCallback('esx_plasticsurgery:checkMoney', function(hasEnoughMoney)
					if hasEnoughMoney then
						TriggerEvent('skinchanger:getSkin', function(skin)
							TriggerServerEvent('esx_skin:save', skin)
						end)
						menu.close()
						
						--TriggerServerEvent('esx_plasticsurgery:pay')
						--HasPaid = true
					else
						ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
							TriggerEvent('skinchanger:loadSkin', skin) 
						end)
						menu.close()
						
						--ESX.ShowNotification(_U('not_enough_money'))
					end
				--end)
			elseif data.current.value == 'no' then
				ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
					TriggerEvent('skinchanger:loadSkin', skin) 
				end)
			end
			
			CurrentAction     = 'surgery_menu'
			CurrentActionMsg  = _U('press_access')
			CurrentActionData = {}
		end, function(data, menu)
			menu.close()
			
			CurrentAction     = 'surgery_menu'
			CurrentActionMsg  = _U('press_access')
			CurrentActionData = {}
		end)
	end, function(data, menu)
		menu.close()
		
		CurrentAction     = 'surgery_menu'
		CurrentActionMsg  = _U('press_access')
		CurrentActionData = {}
	end)
end

local dealershop = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {200, 120, 150}, Title = "Aaron"},
	Data = { currentMenu = "Produits"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Produits"] = {
			b = {
				{name = "20G de Weed",ask = "~g~500$", askX = true},
				{name = "10G de Cocaïne",ask = "~g~1250$", askX = true},
				{name = "10G de Meth",ask = "~g~1500$", askX = true}
			}
		}
	}
}

local posdealerdrugs = {
	{x = 915.08,  y = -1702.36,  z = 51.24},
	{x = 1443.56,  y = 6332.44,  z = 24.0}
}

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)
        for k in pairs(posdealerdrugs) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posdealerdrugs[k].x, posdealerdrugs[k].y, posdealerdrugs[k].z)

			if dist <= 2.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~discuter")
				if IsControlJustPressed(1,51) then 
                    CreateMenu(dealershop)
				end
				break
            else
                attente = 150
            end
        end
    end
end)

local poslithospital = {
	{x = 348.80667114258, y = -571.69323730469, z = 29.822799682617},
	{x = 350.32693481445, y = -567.70593261719, z = 29.822826385498},
	{x = 352.00915527344, y = -563.05169677734, z = 29.822814941406},
	{x = 357.58703613281, y = -566.60034179688, z = 29.94213104248},
	{x = 355.82946777344, y = -572.32562255859, z = 29.94213104248},
	{x = 330.94979858398, y = -585.09478759766, z = 44.206451416016},
	{x = 308.7331237793, y = -573.52679443359, z = 44.255088806152},
	{x = 310.46185302734, y = -562.35150146484, z = 44.255088806152},
	{x = 315.29754638672, y = -564.29132080078, z = 44.255657196045},
	{x = 320.3818359375, y = -565.97534179688, z = 44.255508422852},
	{x = 325.30960083008, y = -567.04870605469, z = 44.206451416016},
	{x = 328.27200317383, y = -567.99035644531, z = 44.206604003906},
	{x = 331.12051391602, y = -569.14715576172, z = 44.206653594971},
	{x = 329.06777954102, y = -575.31701660156, z = 44.206394195557},
	{x = 326.26666259766, y = -574.29107666016, z = 44.206447601318},
	{x = 322.85055541992, y = -573.05120849609, z = 44.20645904541},
	{x = 349.40325927734, y = -575.77661132813, z = 44.206455230713},
	{x = 351.61526489258, y = -576.55017089844, z = 44.206516265869},
	{x = 354.13616943359, y = -577.41571044922, z = 44.206886291504},
	{x = 356.50323486328, y = -578.51043701172, z = 44.206539154053},
	{x = 358.82943725586, y = -579.10217285156, z = 44.206848144531},
	{x = 356.41674804688, y = -584.939453125, z = 44.206802368164},
	{x = 354.46746826172, y = -584.07830810547, z = 44.206802368164},
	{x = 351.79794311523, y = -583.10498046875, z = 44.206432342529},
	{x = 349.29306030273, y = -582.15979003906, z = 44.206520080566},
	{x = 361.14248657227, y = -579.68365478516, z = 44.206859588623},
	{x = 367.20565795898, y = -581.7412109375, z = 44.206455230713},
	{x = 315.11779785156, y = -578.24291992188, z = 48.994373321533},
	{x = 305.48657226563, y = -579.65545654297, z = 49.016777038574},
	{x = 308.81799316406, y = -571.63708496094, z = 49.218524932861},
	{x = 347.08056640625, y = -601.82916259766, z = 47.951572418213},
	{x = -260.38665771484, y = 6319.5029296875, z = 33.302394866943},
	{x = -261.98516845703, y = 6317.8120117188, z = 33.302337646484},
	{x = -266.07513427734, y = 6319.4624023438, z = 33.302406311035},
	{x = -267.75360107422, y = 6317.5629882813, z = 33.302394866943},
	{x = -258.56011962891, y = 6314.25390625, z = 33.30948638916},
	{x = -255.19964599609, y = 6307.8725585938, z = 33.30500793457},
}

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)
        for k in pairs(poslithospital) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, poslithospital[k].x, poslithospital[k].y, poslithospital[k].z)

			if dist <= 1.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~b~vous allonger")
				if IsControlJustPressed(1,51) then 
					-- SetEntityHeading(GetPlayerPed(-1), 67.84595489502)
					--Citizen.Wait(500)
					ExecuteCommand('e sleep')
				end
				break
            else
                attente = 150
            end
        end
    end
end)

local poslithospital2 = {
	-- {x = 346.88,  y = -576.2,  z = 29.52},
	-- {x = 348.76,  y = -571.28,  z = 29.52},
	-- {x = 355.52,  y = -573.68,  z = 29.8},
}

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)
        for k in pairs(poslithospital2) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, poslithospital2[k].x, poslithospital2[k].y, poslithospital2[k].z)

			if dist <= 1.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~b~vous allonger")
				if IsControlJustPressed(1,51) then 
					SetEntityHeading(GetPlayerPed(-1), 338.70440673828)
					--Citizen.Wait(500)
					ExecuteCommand('e sleep')
				end
				break
            else
                attente = 150
            end
        end
    end
end)

local poslithospital3 = {
	-- {x = 360.92,  y = -564.56,  z = 29.72},
	-- {x = 357.68,  y = -563.4,  z = 29.72},
	-- {x = 354.44,  y = -562.24,  z = 29.72},

}

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)
        for k in pairs(poslithospital3) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, poslithospital3[k].x, poslithospital3[k].y, poslithospital3[k].z)

			if dist <= 1.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~b~vous allonger")
				if IsControlJustPressed(1,51) then 
					SetEntityHeading(GetPlayerPed(-1), 253.02401733398)
					--Citizen.Wait(500)
					ExecuteCommand('e sleep')
				end
				break
            else
                attente = 150
            end
        end
    end
end)

local frigoltd = {
	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {2050, 10, 212}, Title = "Frigo LTD"},
	Data = { currentMenu = "Articles disponibles"},
	Events = { onSelected = OnSelected },
	Menu = {
		["Articles disponibles"] = {
			b = {
				{name = "Eau",ask = "~g~10$", askX = true},
				{name = "Pain",ask = "~g~10$", askX = true},
				{name = "Téléphone",ask = "~g~350$", askX = true},
			}
		}
	}
}

-----------------------------------------------------------Positions-----------------------------------------------------------

local posfrigoltd = {
	{x = -714.42529296875, y = -909.21936035156, z = 19.215589523315},
	{x = 1706.3344726563, y = 4927.0434570313, z = 42.063682556152}
}

Citizen.CreateThread(function()
    local attente = 150
    while true do
        Wait(attente)
        for k in pairs(posfrigoltd) do
            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posfrigoltd[k].x, posfrigoltd[k].y, posfrigoltd[k].z)

			if dist <= 2.0 then
				attente = 1
				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~ouvrir le frigo LTD")
				if IsControlJustPressed(1,51) then 
                    CreateMenu(frigoltd)
				end
				break
            else
                attente = 150
            end
        end
    end
end)

RegisterNetEvent("animbriquerformolotv")
AddEventHandler("animbriquerformolotv", function(source)
	if not IsPedInAnyVehicle(GetPlayerPed(-1)) then
        TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_PARKING_METER", 0, true)
        exports["a_loadingbar"]:StartDelayedFunction("Création du molotov..", 10000, function()
			TriggerServerEvent('apresanimmolotovremove')
			ESX.DrawMissionText('Vous avez obtenu ~g~1~s~ "~g~Coktail Molotov~s~".', 5000)
			ClearPedTasks(PlayerPedId())
        end)
	end
end)

-- local beta = {
-- 	Base = { Header = {"commonmenu", "interaction_bgd"}, Color = {color_black}, HeaderColor = {2050, 10, 212}, Title = "Beta"},
-- 	Data = { currentMenu = "Articles disponibles"},
-- 	Events = { onSelected = OnSelected },
-- 	Menu = {
-- 		["Articles disponibles"] = {
-- 			b = {
-- 				{name = "Eau",ask = "~g~10$", askX = true},
-- 				{name = "Pain",ask = "~g~10$", askX = true},
-- 				{name = "Téléphone",ask = "~g~350$", askX = true},
-- 			}
-- 		}
-- 	}
-- }

-- -----------------------------------------------------------Positions-----------------------------------------------------------

-- local posbeta = {
-- 	{x = -714.42529296875, y = -909.21936035156, z = 19.215589523315},
-- 	{x = 1706.3344726563, y = 4927.0434570313, z = 42.063682556152}
-- }

-- Citizen.CreateThread(function()
--     local attente = 150
--     while true do
--         Wait(attente)
--         for k in pairs(posbeta) do
--             local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
--             local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, posbeta[k].x, posbeta[k].y, posbeta[k].z)

-- 			if dist <= 2.0 then
-- 				attente = 1
-- 				ESX.ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ~g~ouvrir le menu de la beta.")
-- 				if IsControlJustPressed(1,51) then 
--                     CreateMenu(beta)
-- 				end
-- 				break
--             else
--                 attente = 150
--             end
--         end
--     end
-- end)