function AddTextEntry(key, value)
	Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
end

--Uncomment if you want add Players Steam or connected players

local id = PlayerId()
local serverID = GetPlayerServerId(PlayerId())
players = {}
for i = 0, 255 do
	if NetworkIsPlayerActive( i ) then
		table.insert( players, i )
	end
end

Citizen.CreateThread(function()
  AddTextEntry('FE_THDR_GTAO', '~f~Bienvenue, vous êtes sur Nameless RP.')
  AddTextEntry('PM_PANE_LEAVE', '~o~Retourner sur la liste des serveurs.')
  AddTextEntry('PM_PANE_QUIT', '~r~Quitter FiveM ')
  AddTextEntry('PM_SCR_MAP', '~y~Carte de Los Santos')
  AddTextEntry('PM_SCR_GAM', '~y~Prendre l\'avion')
  AddTextEntry('PM_SCR_INF', '~y~Logs')
  AddTextEntry('PM_SCR_SET', '~y~Configuration')
  AddTextEntry('PM_SCR_STA', '~y~Statistiques')
  AddTextEntry('PM_SCR_GAL', '~y~Galerie')
  AddTextEntry('PM_SCR_RPL', '~y~Éditeur ∑')
end)
