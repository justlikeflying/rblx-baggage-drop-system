local SuitcaseModule = require(game:GetService("ServerScriptService"):WaitForChild("BaggageServer").Components.Suitcase)
local FlightsModule = require(game:GetService("ServerScriptService"):WaitForChild("BaggageServer").Modules.Flights)
local baggageAPI = game.ReplicatedStorage.BaggageAPI
game.ReplicatedStorage.CameraTweened.OnServerEvent:Connect(function(plr)
	workspace.Rig.EngagedBagDrop.Value = true
end)
local NewSuitcase
local SuitcaseTool

baggageAPI.OnServerInvoke = function(player, action)
	if action == "GetAllFlights" then
		local flights = FlightsModule:GetAllFlights()
		return flights
	elseif action == "PlaceBag" then
		print("got it")
		local suitcase = game.Workspace:FindFirstChild(player.Name):FindFirstChild("Suitcase")
		local suitcase2 = game.Players:FindFirstChild(player.Name).Backpack:FindFirstChild("Suitcase")
		if suitcase then
			NewSuitcase = SuitcaseModule.New(suitcase)
			SuitcaseTool = suitcase
			local Slot = game.Workspace.BaggageSystemV3.System.DepartureDrop.Checkin.Detector
			NewSuitcase:SetPrimaryPartCFrame(Slot.CFrame)
			NewSuitcase.Parent = Slot
			local result = "Placed"
			return result
		elseif suitcase2 then
			NewSuitcase = SuitcaseModule.New(suitcase2)
			SuitcaseTool = suitcase2
			local Slot = game.Workspace.BaggageSystemV3.System.DepartureDrop.Checkin.Detector
			NewSuitcase:SetPrimaryPartCFrame(Slot.CFrame)
			NewSuitcase.Parent = Slot
			local result = "Placed"
			return result
		end
	elseif action == "FragileYes" then
		NewSuitcase:SetAttribute("IsFragile", true)
		local result = "Successfully changed to fragile"
		return result
	elseif action == "FragileNo" then
		NewSuitcase:SetAttribute("IsFragile", false)
		local result = "Successfully changed to not fragile"
		return result
	elseif action == "TagBag" then
		NewSuitcase:SetAttribute("IsTagged", true)
		local SuitcaseTagSuccess = "Successfully tagged"
		return SuitcaseTagSuccess
	end
end

game.ReplicatedStorage.SetDetails.OnServerInvoke = function(player, flightid, flightnumber, flightdest, flightdate)
	NewSuitcase:SetAttribute("Flight", flightnumber)
	NewSuitcase:SetAttribute("Dest", flightdest)
	NewSuitcase:SetAttribute("Date", flightdate)
	local successbagtag = "Tagged Bags! Ready for delivery"
	SuitcaseTool:Destroy()
	return successbagtag
end
