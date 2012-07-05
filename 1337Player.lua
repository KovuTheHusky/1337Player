function LeetPlayerOnLoad(self)
	LeetPlayerFrame:RegisterEvent("PLAYER_LOGIN");
	LeetPlayerFrame:RegisterEvent("PLAYER_ENTERING_WORLD");
	LeetPlayerFrame:RegisterEvent("ADDON_LOADED");
	SLASH_1337Player1 = "/leetplayer";
	SLASH_1337Player2 = "/lp";
	SlashCmdList["1337Player"] = function(msg)
		LeetPlayerSlashCommand(msg);
	end
	LeetPlayerTexture = "-Elite";
	local iLeetPlayerTexture = LeetPlayerTexture;
	LeetPlayerTextureRed = 1;
	local iLeetPlayerTextureRed = LeetPlayerTextureRed;
	LeetPlayerTextureGreen = 1;
	local iLeetPlayerTextureGreen = LeetPlayerTextureGreen;
	LeetPlayerTextureBlue = 0;
	local iLeetPlayerTextureBlue = LeetPlayerTextureBlue;
	LeetPlayerPetX = 0;
	local iLeetPlayerPetX = LeetPlayerPetX;
	LeetPlayerPetY = 0;
	local iLeetPlayerPetY = LeetPlayerPetY;
	LeetPlayerPlayerX = 33;
	local iLeetPlayerPlayerX = LeetPlayerPlayerX;
	LeetPlayerPlayerY = 0;
	local iLeetPlayerPlayerY = LeetPlayerPlayerY;
	LeetPlayerRed = 1;
	LeetPlayerGreen = 1;
	LeetPlayerBlue = 0;
end

function LeetPlayerOnEvent(self, event, arg1)
	if (event == "PLAYER_LOGIN") then
		DEFAULT_CHAT_FRAME:AddMessage("1337Player v" .. GetAddOnMetadata("1337Player", "Version") .. " started successfully! (/leetplayer, /lp)", LeetPlayerRed, LeetPlayerGreen, LeetPlayerBlue);
	end
	if ((event == "ADDON_LOADED") and (arg1 == "1337Player")) then
		if (iLeetPlayerTexture == LeetPlayerTexture) then
			LeetPlayerTexture = "-Elite";
		end
		if (iLeetPlayerTextureRed == LeetPlayerTextureRed) then
			LeetPlayerTextureRed = 1;
		end
		if (iLeetPlayerTextureGreen == LeetPlayerTextureGreen) then
			LeetPlayerTextureGreen = 1;
		end
		if (iLeetPlayerTextureBlue == LeetPlayerTextureBlue) then
			LeetPlayerTextureBlue = 0;
		end
		if (iLeetPlayerPetX == LeetPlayerPetX) then
			LeetPlayerPetX = 0;
		end
		if (iLeetPlayerPetY == LeetPlayerPetY) then
			LeetPlayerPetY = 0;
		end
		if (iLeetPlayerPlayerX == LeetPlayerPlayerX) then
			LeetPlayerPlayerX = 33;
		end
		if (iLeetPlayerPlayerY == LeetPlayerPlayerY) then
			LeetPlayerPlayerY = 0;
		end
		PlayerFrame:SetPoint("TOPLEFT", "TargetFrame", "TOPLEFT", -275 + LeetPlayerPetX, 0 + LeetPlayerPetY);
		PetFrame:SetPoint("TOPLEFT", "PlayerFrame", "TOPLEFT", 88 + LeetPlayerPetX, -62 + LeetPlayerPetY);
		LeetPlayerSlashCommand("");
		LeetPlayerFrame:Hide();
		LeetPlayerApplyTexture();
	end
end

function LeetPlayerSlashCommand(msg)
	if (msg) then
		local texture = LeetPlayerTexture;
		local petx = LeetPlayerPetX;
		local pety = LeetPlayerPetY;
		local plax = LeetPlayerPlayerX;
		local play = LeetPlayerPlayerY;
		if (texture == "-Elite") then
			LeetPlayerFrameElite:SetChecked();
		end
		if (texture == "-Rare") then
			LeetPlayerFrameRare:SetChecked();
		end
		if (texture == "") then
			LeetPlayerFrameNormal:SetChecked();
		end
		LeetPlayerFramePetX:SetValue(petx);
		LeetPlayerFramePetY:SetValue(pety);
		LeetPlayerFramePlayerX:SetValue(plax);
		LeetPlayerFramePlayerY:SetValue(play);
		getglobal(LeetPlayerFramePetX:GetName().."Text"):SetText("X-Axis Offset: " .. petx);
		getglobal(LeetPlayerFramePetY:GetName().."Text"):SetText("Y-Axis Offset: " .. pety);
		getglobal(LeetPlayerFramePlayerX:GetName().."Text"):SetText("X-Axis Offset: " .. plax);
		getglobal(LeetPlayerFramePlayerY:GetName().."Text"):SetText("Y-Axis Offset: " .. play);
		LeetPlayerFrame:Show();
	end
end

function LeetPlayerFramePlayer_OnClick()
	LeetPlayerPlayerX = LeetPlayerFramePlayerX:GetValue();
	LeetPlayerPlayerY = LeetPlayerFramePlayerY:GetValue();
	PlayerFrame:SetPoint("TOPLEFT", "TargetFrame", "TOPLEFT", -275 + LeetPlayerPlayerX, 0 + LeetPlayerPlayerY);
	getglobal(LeetPlayerFramePlayerX:GetName().."Text"):SetText("X-Axis Offset: " .. LeetPlayerPlayerX);
	getglobal(LeetPlayerFramePlayerY:GetName().."Text"):SetText("Y-Axis Offset: " .. LeetPlayerPlayerY);
end


function LeetPlayerFramePet_OnClick()
	LeetPlayerPetX = LeetPlayerFramePetX:GetValue();
	LeetPlayerPetY = LeetPlayerFramePetY:GetValue();
	PetFrame:SetPoint("TOPLEFT", "PlayerFrame", "TOPLEFT", 88 + LeetPlayerPetX, -62 + LeetPlayerPetY);
	getglobal(LeetPlayerFramePetX:GetName().."Text"):SetText("X-Axis Offset: " .. LeetPlayerPetX);
	getglobal(LeetPlayerFramePetY:GetName().."Text"):SetText("Y-Axis Offset: " .. LeetPlayerPetY);
end

function LeetPlayerFrameElite_OnClick()
	LeetPlayerTexture = "-Elite";
	LeetPlayerTextureRed = 1;
	LeetPlayerTextureGreen = 1;
	LeetPlayerTextureBlue = 0;
	LeetPlayerFrameElite:SetChecked();
	LeetPlayerFrameElite2:SetChecked(false);
	LeetPlayerFrameRare:SetChecked(false);
	LeetPlayerFrameNormal:SetChecked(false);
	LeetPlayerApplyTexture();
end

function LeetPlayerFrameElite2_OnClick()
	LeetPlayerTexture = "-Rare-Elite";
	LeetPlayerTextureRed = 1;
	LeetPlayerTextureGreen = 1;
	LeetPlayerTextureBlue = 1;
	LeetPlayerFrameElite:SetChecked(false);
	LeetPlayerFrameElite2:SetChecked();
	LeetPlayerFrameRare:SetChecked(false);
	LeetPlayerFrameNormal:SetChecked(false);
	LeetPlayerApplyTexture();
end

function LeetPlayerFrameRare_OnClick()
	LeetPlayerTexture = "-Rare";
	LeetPlayerTextureRed = 1;
	LeetPlayerTextureGreen = 1;
	LeetPlayerTextureBlue = 1;
	LeetPlayerFrameElite:SetChecked(false);
	LeetPlayerFrameElite2:SetChecked(false);
	LeetPlayerFrameRare:SetChecked();
	LeetPlayerFrameNormal:SetChecked(false);
	LeetPlayerApplyTexture();
end

function LeetPlayerFrameNormal_OnClick()
	LeetPlayerTexture = "";
	LeetPlayerTextureRed = 1;
	LeetPlayerTextureGreen = 1;
	LeetPlayerTextureBlue = 1;
	LeetPlayerFrameElite:SetChecked(false);
	LeetPlayerFrameElite2:SetChecked(false);
	LeetPlayerFrameRare:SetChecked(false);
	LeetPlayerFrameNormal:SetChecked();
	LeetPlayerApplyTexture();
end

function LeetPlayerApplyTexture()
	PlayerFrameTexture:SetTexture("Interface\\TargetingFrame\\UI-TargetingFrame" .. LeetPlayerTexture .. ".blp");
	PlayerFrameTexture:SetVertexColor(LeetPlayerTextureRed, LeetPlayerTextureGreen, LeetPlayerTextureBlue);
end

function LeetPlayerFrameDefaults_OnClick()	
	LeetPlayerFrameElite_OnClick();
	LeetPlayerPetX = 0;
	LeetPlayerPetY = 0;
	LeetPlayerPlayerX = 33;
	LeetPlayerPlayerY = 0;
	PlayerFrame:SetPoint("TOPLEFT", "TargetFrame", "TOPLEFT", -275 + LeetPlayerPetX, 0 + LeetPlayerPetY);
	PetFrame:SetPoint("TOPLEFT", "PlayerFrame", "TOPLEFT", 88 + LeetPlayerPetX, -62 + LeetPlayerPetY);
	LeetPlayerSlashCommand("");
	LeetPlayerApplyTexture();
end