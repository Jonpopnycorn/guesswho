AddCSLuaFile()

SWEP.Base = "weapon_gwbase"
SWEP.Name = "Shrink"
SWEP.AbilitySound = "gwabilities/smb2_shrink.wav"

function SWEP:Ability()
    timer.Create( "Ability.Effect.Shrink" .. self.Owner:SteamID(), 7, 1, function() self:OnRemove() end )
    self.Owner:SetRunSpeed(self.Owner:GetRunSpeed() * 1.75)
    self.Owner:SetWalkSpeed(self.Owner:GetWalkSpeed() * 1.75)
    self.Owner:SetModelScale(self.Owner:GetModelScale() / 2.5, 1)
    self.Owner:SetHealth(self.Owner:Health() / 2.5)
end

function SWEP:OnRemove()
    if not IsValid( self.Owner ) then return end
    timer.Remove("Ability.Effect.Shrink" .. self.Owner:SteamID())
    self.Owner:SetRunSpeed(GetConVar("gw_hiding_run_speed"):GetFloat())
    self.Owner:SetWalkSpeed(GetConVar("gw_hiding_walk_speed"):GetFloat())
    self.Owner:SetModelScale(1, 1)
end
