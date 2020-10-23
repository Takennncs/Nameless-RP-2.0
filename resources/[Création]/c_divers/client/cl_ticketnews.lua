local PlayerData                = {}
ESX                             = nil

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

AddEventHandler('playerSpawned', function()
	isDead = false
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('bblutin_annonces:getAnnonce')
AddEventHandler('bblutin_annonces:getAnnonce', function(source)
	messageannoncenotfinish = true
	MessageAnnonce()
end)

function KeyboardInput(TextEntry, ExampleText, MaxStringLenght)

	AddTextEntry('FMMC_KEY_TIP1', TextEntry) 
	DisplayOnscreenKeyboard(1, "FMMC_KEY_TIP1", "", ExampleText, "", "", "", MaxStringLenght) 
	blockinput = true 

	while UpdateOnscreenKeyboard() ~= 1 and UpdateOnscreenKeyboard() ~= 2 do 
		for i = 0, 357 do
			DisableAllControlActions(i)
		end
		Citizen.Wait(1)
	end
		
	if UpdateOnscreenKeyboard() ~= 2 then
		local result = GetOnscreenKeyboardResult() 
		Citizen.Wait(500) 
		blockinput = false 
		return result 
	else
		Citizen.Wait(500) 
		blockinput = false 
		return nil 
	end
end

function MessageAnnonce()
	Citizen.CreateThread(function()
    	while messageannoncenotfinish do
			Citizen.Wait(10)
			local result = KeyboardInput(Config.title, Config.placeholder, 60)
            local society = ESX.PlayerData.job.label
		    messageannoncenotfinish = false
		    TriggerServerEvent('bblutin_annonces:annonceStart', result, society)   
		end
	end)
end


function DrawAdvancedTextCNN (x,y ,w,h,sc, text, r,g,b,a,font,jus)
    SetTextFont(font)
    SetTextProportional(0)
    SetTextScale(sc, sc)
    N_0x4e096588b13ffeca(jus)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - 0.1+w, y - 0.02+h)
end


 Citizen.CreateThread(function()
	while true do
	  Citizen.Wait(0)    
						
		if (afficheannoncenews == true) then
			DrawRect(0.494, 0.227, 5.185, 0.118, 0, 0, 0, 150)
			DrawAdvancedTextCNN(0.588, 0.14, 0.005, 0.0028, 0.8, '~r~ '..titreannonce..' ~d~', 255, 255, 255, 255, 1, 0)
			DrawAdvancedTextCNN(0.586, 0.199, 0.005, 0.0028, 0.6, texteannonce, 255, 255, 255, 255, 7, 0)
			DrawAdvancedTextCNN(0.588, 0.246, 0.005, 0.0028, 0.4, "", 255, 255, 255, 255, 0, 0)
		end 

	end
end)



RegisterNetEvent('bblutin_annonces:annonceStart')
AddEventHandler('bblutin_annonces:annonceStart', function(text, titre)
    texteannonce = text
    titreannonce = titre
	afficheannoncenews = true	
end) 


RegisterNetEvent('bblutin_annonces:annonceStop')
AddEventHandler('bblutin_annonces:annonceStop', function()
	afficheannoncenews = false	
end)