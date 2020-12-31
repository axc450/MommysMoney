SLASH_MM1 = '/mm'
function SlashCmdList.MM(msg, editbox)
	local _, _, cmd, args = string.find(msg, "%s?(%w+)%s?(.*)")
	if not ( MM ) then MM = {}; end
	if cmd == "main" then
		local fullName, realm = UnitFullName("player")
		MM["MAIN"] = fullName .. "-" .. realm
		print("[|cFFFFFF00MM|r] Your main has been set to: |cFF00FF00" .. MM["MAIN"])
	elseif cmd == "limit" then
		args = tonumber(args)
		if args then
			MM["LIMIT"] = args*10000
			print("[|cFFFFFF00MM|r] Your limit has been set to: " .. GetCoinTextureString(MM["LIMIT"]))
		else
			print("[|cFFFFFF00MM|r] Your current limit is: " .. GetCoinTextureString(tonumber(MM["LIMIT"])))
			print("[|cFFFFFF00MM|r] Change your gold limit using |cFF00FF00/mm limit <gold>|r")
		end
	elseif cmd == "help" then
		print("[|cFFFFFF00Mommys Money Help|r]")
		print("|cFF00FF00/mm|r Sends gold to main")
		print("|cFF00FF00/mm help|r Shows this help menu")
		print("|cFF00FF00/mm main|r Sets the current character to your main")
		print("|cFF00FF00/mm limit|r Shows your current limit")
		print("|cFF00FF00/mm limit <gold>|r Sets the money limit for your alts")
	else
		if MM["MAIN"] == nil then
			print("[|cFFFFFF00MM|r] You have not set a main! Use |cFF00FF00/mm main|r to set one")
			return;
		end
		if MM["LIMIT"] == nil then
			print("[|cFFFFFF00MM|r] You have not set a gold limit! Use |cFF00FF00/mm limit <gold>|r to set one")
			return;
		end
		
		goldToSend = GetMoney() - ((tonumber(MM["LIMIT"]) + 30))
		SetSendMailMoney(goldToSend)
		SendMail(MM["MAIN"], "Mommy's Money", "")
		print("[|cFFFFFF00MM|r] Sent " .. GetCoinTextureString(goldToSend) .. " to |cFF00FF00" .. MM["MAIN"] .. "|r!")
	end
end