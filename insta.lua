function InstaKill()
	game.ReplicatedStorage.rbxts_include.node_modules["@rbxts"].net.out._NetManaged.RequestGauntletsChargedAttack:FireServer({region = Vector3.new(9e9, 9e9, 9e9), unitLookVector = Vector3.new(1,1,1)})
end

task.spawn(function()
	repeat task.wait(0.14)
		InstaKill()
	until
end)
