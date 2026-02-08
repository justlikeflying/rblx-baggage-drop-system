local activated = game.Workspace.Rig.EngagedBagDrop.Value
game.Workspace.flyTechBagDropDesk.ProximityPart.BagDropPrompt.Triggered:Connect(function(plr)
	local playerfind = game.Players:FindFirstChild(game.Workspace.Rig.BagDropEngager.Value)
	local suitcase = game.Players:FindFirstChild(plr.Name).Backpack.Suitcase
	if not suitcase then
		local suitcase2 = game.Workspace:FindFirstChild(plr.Name.Suitcase)
		if not suitcase2 then
			suitcase = nil
		else
			suitcase = suitcase2
		end
	end
	if activated == false and not playerfind and suitcase ~= nil then
		game.ReplicatedStorage.chatted:FireClient(plr)
		activated = true
		game.Workspace.Rig.BagDropEngager.Value = plr.Name
	end
end)
game.Workspace.Rig.BagDropIdleAnim.AnimationId = "rbxassetid://"..game.ReplicatedStorage.BagDropAnim.Value

local riganim = game.Workspace.Rig.BagDropIdleAnim
local loadedanim = game.Workspace.Rig.Humanoid:LoadAnimation(riganim)
loadedanim.Priority = Enum.AnimationPriority.Action4
loadedanim.Looped = false
task.wait(3)
loadedanim:Play()
task.wait(4)
loadedanim.Looped = true
loadedanim:Play()
print("donr")