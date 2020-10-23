local ESX = nil
local colors = {
	[0] = 'Noir',
	[1] = 'Noir',
	[2] = 'Noir',
	[55] = 'Noir',
	[56] = 'Noir',
	[57] = 'Noir',
	[58] = 'Noir',
	[59] = 'Noir',
	[60] = 'Noir',
	[61] = 'Noir',
	[3] = 'Marron',
	[4] = 'Marron',
	[5] = 'Marron',
	[6] = 'Marron',
	[7] = 'Marron',
	[8] = 'Marron',
	[9] = 'Rubi@',
	[10] = 'Rubi@',
	[11] = 'Rubi@',
	[12] = 'Rubi@',
	[13] = 'Rubi@',
	[14] = 'Rubi@',
	[15] = 'Rubi@',
	[16] = 'Rubi@',
	[62] = 'Rubi@',
	[63] = 'Rubi@',
	[26] = 'Gris',
	[27] = 'Gris',
	[28] = 'Gris',
	[29] = 'Gris',
	[30] = 'Violet',
	[31] = 'Violet',
	[32] = 'Violet',
	[33] = 'Rose',
	[34] = 'Rose',
	[35] = 'Rose',
	[36] = 'Turquoise',
	[37] = 'Turquoise',
	[38] = 'Turquoise',
	[39] = 'Vert',
	[40] = 'Vert',
	[41] = 'Vert',
	[42] = 'Vert',
	[43] = 'Vert',
	[44] = 'Vert',
	[45] = 'Jaune',
	[46] = 'Jaune',
	[47] = 'Orange',
	[48] = 'Orange',
	[49] = 'Orange',
	[51] = 'Orange',
	[52] = 'Orange'
}
local letter   = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'X', 'Y'}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

math.randomseed(os.time())

-- Fetch
ESX.RegisterServerCallback('mdtems:fetch', function( source, cb, data, type )
  if type == 'start' then
    MySQL.Async.fetchAll('SELECT date, offense, institution, charge, term, classified FROM lrp_registromedico', {},
    function (result)
      cb(result)
    end)
  elseif type == 'record' then
    MySQL.Async.fetchAll('SELECT * FROM lrp_registromedico WHERE offense = @offense', {['@offense'] = data.offense},
    function (resultRecord)
			if resultRecord[1] ~= nil then
	      MySQL.Async.fetchAll('SELECT firstname, lastname, sex FROM lrp_registromedicoinfo WHERE identifier = @identifier', {['@identifier'] = resultRecord[1].identifier},
	      function (resultUser)
	        local array = {
	          userinfo = resultUser,
	          records = resultRecord
	        }
	        cb(array)
	      end)
			else
				cb('error')
			end
    end)
  elseif type == 'user' then
    MySQL.Async.fetchAll('SELECT * FROM lrp_registromedicoinfo WHERE dob = @dob', {['@dob'] = data.dob},
    function (resultUser)
      MySQL.Async.fetchAll('SELECT * FROM lrp_registromedico WHERE identifier = @identifier', {['@identifier'] = resultUser[1].identifier},
      function (resultRecord)
        local array = {
          userinfo = resultUser,
          records = resultRecord
        }
        cb(array)
      end)
    end)
  end
end)

-- Search
ESX.RegisterServerCallback('mdtems:search', function( source, cb, data )
  local query    = 'SELECT * FROM lrp_registromedicoinfo'
  local queryVal = nil

  if string.len(data.dob) > 0 then
    query    = 'SELECT * FROM lrp_registromedicoinfo WHERE dob = @x'
    queryVal = data.dob
  elseif string.len(data.firstname) > 0 then
    query = 'SELECT * FROM lrp_registromedicoinfo WHERE firstname = @x'
    queryVal = data.firstname
  elseif string.len(data.lastname) > 0 then
    query = 'SELECT * FROM lrp_registromedicoinfo WHERE lastname = @x'
    queryVal = data.lastname
  

  elseif string.len(data.offense) > 0 then
		cb('ok')
  end

  if queryVal == nil then
    MySQL.Async.fetchAll(query, {},
     function (result)
       if result[1] ~= nil then
		cb(result)
       else
         cb('error')
       end
     end)
   else
     MySQL.Async.fetchAll(query, {['@x'] = queryVal},
      function (result)
        if result[1] ~= nil then
          cb(result)
        else
          cb('error')
        end
      end)
   end
end)

-- Add
ESX.RegisterServerCallback('mdtems:add', function( source, cb, data )
  local recordid = letter[math.random(1,6)] .. math.random(0,999) .. letter[math.random(1,6)] .. math.random(0,999)
  local weight   = 0
  local warden = ESX.GetPlayerFromId(source).identifier

  local date    = data.date
  local offense = letter[math.random(1,6)] .. '-' .. math.random(100,999)

  if date == 'Today' then
    date = os.date('%Y-%m-%d')
  end

  MySQL.Async.fetchAll('SELECT firstname FROM users WHERE identifier = @identifier', {['@identifier'] = warden},
  function (result)
    warden = result[1].firstname
  end)


  MySQL.Async.fetchAll('SELECT identifier, skin, sex, height FROM users WHERE UPPER(firstname) = @firstname AND UPPER(lastname) = @lastname AND dateofbirth = @dateofbirth', {['@firstname'] = data.firstname, ['@lastname'] = data.lastname, ['@dateofbirth'] = data.dob},
  function (result)
    if result[1] ~= nil then
      local identifier = result[1].identifier

      if result[1].sex == 'M' then
       if tonumber(result[1].height) < 170 then
         weight = math.random(52,65)
       else
         weight = math.random(65,90)
       end
      else
        if tonumber(result[1].height) < 170 then
         weight = math.random(49,61)
        else
         weight = math.random(61,85)
        end
      end

      MySQL.Async.fetchAll('SELECT identifier FROM lrp_registromedicoinfo WHERE identifier = @identifier', {['@identifier'] = identifier},
      function (resultCheck)
        if resultCheck[1] == nil then
          MySQL.Async.execute('INSERT INTO lrp_registromedicoinfo (identifier, aliases, recordid, weight, eyecolor, haircolor, firstname, lastname, dob, sex, height) VALUES (@identifier, @aliases, @recordid, @weight, @eyecolor, @haircolor, @firstname, @lastname, @dob, @sex, @height)',
           {
             ['@identifier'] = identifier,
             ['@aliases']    = data.firstname,
             ['@recordid']   = recordid,
             ['@weight']     = weight .. 'kg',
             ['@eyecolor']   = colors[json.decode(result[1].skin)['eye_color']],
             ['@haircolor']  = colors[json.decode(result[1].skin)['hair_color_1']],
             ['@firstname']  = data.firstname,
             ['@lastname']   = data.lastname,
             ['@dob']        = data.dob,
             ['@sex']        = result[1].sex,
             ['@height']     = result[1].height .. 'cm'
           },
           function (rowsChanged)
             MySQL.Async.execute('INSERT INTO lrp_registromedico (offense, date, institution, charge, description, term, classified, identifier, dob, warden) VALUES (@offense, @date, @institution, @charge, @description, @term, @classified, @identifier, @dob, @warden)',
              {
                ['@offense']     = offense,
                ['@date']        = date,
                ['@institution'] = 'PILLBOX HOSPITAL',
                ['@charge']      = data.charge,
                ['@description'] = data.description,
                ['@term']        = data.term,
                ['@classified']  = 0,
                ['@identifier']  = identifier,
                ['@dob']         = data.dob,
                ['@warden']      = warden
              },
              function (rowsChanged)
                MySQL.Async.fetchAll('SELECT * FROM lrp_registromedico WHERE offense = @offense', {['@offense'] = offense},
                 function (result)
                   if result[1] ~= nil then
                     MySQL.Async.fetchAll('SELECT * FROM lrp_registromedicoinfo WHERE UPPER(firstname) = @firstname AND UPPER(lastname) = @lastname AND dob = @dob', {['@firstname'] = data.firstname, ['@lastname'] = data.lastname, ['@dob'] = data.dob},
                      function (uinfo)
                        if uinfo[1] ~= nil then
                          local array = {
                            userinfo = uinfo,
                            records = result
                          }

                          cb(array)
                        end
                      end)
                   end
                 end)
             end)
          end)
        else
          MySQL.Async.execute('INSERT INTO lrp_registromedico (offense, date, institution, charge, description, term, classified, identifier, dob, warden) VALUES (@offense, @date, @institution, @charge, @description, @term, @classified, @identifier, @dob, @warden)',
           {
             ['@offense']     = offense,
             ['@date']        = date,
             ['@institution'] = 'PILLBOX HOSPITAL',
             ['@charge']      = data.charge,
             ['@description'] = data.description,
             ['@term']        = data.term,
             ['@classified']  = 0,
             ['@identifier']  = identifier,
             ['@dob']         = data.dob,
             ['@warden']      = warden
           },
           function (rowsChanged)
             MySQL.Async.fetchAll('SELECT * FROM lrp_registromedico WHERE offense = @offense', {['@offense'] = offense},
              function (result)
                if result[1] ~= nil then
                  MySQL.Async.fetchAll('SELECT * FROM lrp_registromedicoinfo WHERE UPPER(firstname) = @firstname AND UPPER(lastname) = @lastname AND dob = @dob', {['@firstname'] = data.firstname, ['@lastname'] = data.lastname, ['@dob'] = data.dob},
                   function (uinfo)
                     if uinfo[1] ~= nil then
                       local array = {
                         userinfo = uinfo,
                         records = result
                       }
                       cb(array)
                     end
                   end)
                end
              end)
          end)
        end
      end)
     else
       cb('error')
     end
   end)
end)

-- Update
ESX.RegisterServerCallback('mdtems:update', function( source, cb, data )
	if data.description ~= nil then
	  MySQL.Async.execute('UPDATE lrp_registromedico SET description = @description WHERE offense = @offense', {['@description'] = data.description, ['@offense'] = data.offense})
	  cb('ok')
	elseif data.classified ~= nil then
		MySQL.Async.execute('UPDATE lrp_registromedico SET classified = @classified WHERE offense = @offense', {['@classified'] = data.classified, ['@offense'] = data.offense})
 	 	cb('ok')
	end
end)

-- Remove
ESX.RegisterServerCallback('mdtems:remove', function( source, cb, data )
  MySQL.Async.fetchAll('SELECT identifier FROM lrp_registromedico WHERE offense = @offense', {['@offense'] = data.offense},
  function (resultID)
    MySQL.Async.fetchAll('SELECT * FROM lrp_registromedico WHERE identifier = @identifier', {['@identifier'] = resultID[1].identifier},
    function (resultAll)
      if #resultAll < 2 then
        MySQL.Async.execute('DELETE FROM lrp_registromedicoinfo WHERE identifier = @identifier',{ ['@identifier'] = resultID[1].identifier})
        MySQL.Async.execute('DELETE FROM lrp_registromedico WHERE offense = @offense',{ ['@offense'] = data.offense})
      else
        MySQL.Async.execute('DELETE FROM lrp_registromedico WHERE offense = @offense',{ ['@offense'] = data.offense})
      end
      cb('ok')
    end)
  end)
end)
