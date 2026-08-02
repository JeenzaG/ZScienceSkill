-- Grant Science XP when gaining Electrical XP
-- TODO Make the exp granted to science multiplied to couter the base xp boost from the game
-- Why this mod don't add the bonusXP as bonus boost? We can incremente the base boost of the game by the science level and the multipliers
-- So the addXp is not needed
require 'ZSS_Fix_Events'

if isClient() then return end

ZScienceSkill = ZScienceSkill or {}
ZScienceSkill.minGain = 1
local scienceXPMultiplier = 0.5 -- 0.5 = 50% ElectricalXP to ScienceXP

-- This function is called 2 times when gaining ElectricalXP: ElectricalXP = 100 / scienceXP = 50. XPBoost ElectricalXP = 20 / ScienceXP = 10 || That's expected?
local function onAddXP(character, perk, amount)
    if perk == Perks.Electricity and amount >= ZScienceSkill.minGain then
        print("Electrical EXP: " .. amount)
        local scienceXP = amount * scienceXPMultiplier
        print("Science EXP Bonus: " .. scienceXP)
        if scienceXP >= ZScienceSkill.minGain then
            addXp(character, Perks.Science, scienceXP)
        end
    end
end

ZSS_Fix_Events.AddXP.Add(onAddXP)
