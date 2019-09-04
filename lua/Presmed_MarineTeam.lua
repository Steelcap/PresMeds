local oldTriggerAlert = MarineTeam.TriggerAlert
function MarineTeam:TriggerAlert(techId, entity, force)
	oldTriggerAlert(self, techId, entity, force)
	
	if techId == kTechId.MarineAlertNeedMedpack and entity and entity:isa("Player") and entity:GetResources() >= GetCostForTech(kTechId.MedPack) then
        techId = kTechId.MedPack
		entity:SetResources(entity:GetResources() - GetCostForTech(techId))
        local mapName = LookupTechData(techId, kTechDataMapName)
        local position = entity:GetOrigin() + Vector(0, 0.05, 0)
        if mapName then
            CreateEntity(mapName, position, entity:GetTeamNumber())
        end
	end
    if techId == kTechId.MarineAlertNeedAmmo and entity and entity:isa("Player") and entity:GetResources() >= GetCostForTech(kTechId.AmmoPack) then
        techId = kTechId.AmmoPack
		entity:SetResources(entity:GetResources() - GetCostForTech(techId))
        local mapName = LookupTechData(techId, kTechDataMapName)
        local position = entity:GetOrigin() + Vector(0, 0.05, 0)
        if mapName then
            CreateEntity(mapName, position, entity:GetTeamNumber())
        end
	end
end
