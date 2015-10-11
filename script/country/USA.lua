-- Scripted for YAMDaM by WKIII
-- The Amewican AI: Master of all, High tech researcher.
-- Loves: United Kingdom, Germany, South Korea, Israel, Japan, Australia, New Zealnd, Taiwan.
-- Hates: Russian Federation, China, North Korea, Iran, Iraq, Syria.
local P = {}
AI_USA = P

-- Technology:
function P.TechWeights(voTechnologyData)
	local laArray = {
		0.125,	-- _RESEARCH_LAND_
		0.125,	-- _RESEARCH_LAND_DOC_
		0.125,	-- _RESEARCH_AIR_
		0.125,	-- _RESEARCH_AIR_DOC_
		0.125,	-- _RESEARCH_NAVAL_
		0.125,	-- _RESEARCH_NAVAL_DOC_
		0.25,	-- _RESEARCH_INDUSTRIAL_
		0.0,	-- _RESEARCH_SECRET_
		0.0		-- _RESEARCH_UNKNOWN_
	};
	return laArray
end
function P.LandTechs(voTechnologyData)
	local ignoreTech = {};
	local preferTech = {
		-- Superior MBTs
		"tank_brigade",
		"tank_gun",
		"tank_armor",
		"tank_engine",
		"tank_reliability",
		-- Infantry
		"infantry_brigade_activation",
		"marine_infantry",
		"desert_equipment",
		"urban_equipment",
		"night_equipment",
		"jungle_equipment",
		"forest_equipment",
		"amphibious_equipment"
	};
	return ignoreTech, preferTech
end
function P.LandDoctrinesTechs(voTechnologyData)
	local ignoreTech = {};
	local preferTech = {
		-- Active ally:
		"logistics_tech",
		"organisation_tech",
		"modern_blitzkrieg",
		"breakthrough_exploitation",
		"elastic_defence",
		"flanking_maneuvers",
		"shock_and_awe",
		"armor_tactics"
	};
	return ignoreTech, preferTech
end
function P.AirTechs(voTechnologyData)
	local ignoreTech = {};
	local preferTech = {};
	return ignoreTech, preferTech
end
function P.AirDoctrineTechs(voTechnologyData)
	local ignoreTech = {};
	local preferTech = {};
	return ignoreTech, preferTech
end
function P.NavalTechs(voTechnologyData)
	local ignoreTech = {};
	local preferTech = {};
	return ignoreTech, preferTech
end
function P.NavalDoctrineTechs(voTechnologyData)
	local ignoreTech = {};
	local preferTech = {};
	return ignoreTech, preferTech
end
function P.IndustrialTechs(voTechnologyData)
	local ignoreTech = {};
	local preferTech = {
		-- High tech advance:
		"computers",
		"radios",
		"radar",
		"education",
		-- Industrial advance:
		"energy_production",
		"energy_efficiency",
		"industral_production",
		"industral_efficiency"
	};
	return ignoreTech, preferTech
end
function P.SecretWeaponTechs(voTechnologyData)
	-- Ignores totally.
	local ignoreTech = {"all"}
	return ignoreTech, nil
end
function P.OtherTechs(voTechnologyData)
	local ignoreTech = {};
	local preferTech = {};
	return ignoreTech, preferTech
end

-- Production:
function P.LandToAirRatio(voProductionData)
	local laArray = {
		5,	-- Land Battalion
		1	-- Air Squadron
	};
	return laArray
end
function P.ProductionWeights(voProductionData)
	local laArray
	if (voProductionData.ManpowerTotal < 30 and voProductionData.LandCountTotal > 30) or voProductionData.ManpowerTotal < 10 then
		laArray = {
			0.0,	-- Land
			0.50,	-- Air
			0.30,	-- Sea
			0.20	-- Other
		}
	elseif voProductionData.IsAtWar then
		laArray = {
			0.30,	-- Land
			0.30,	-- Air
			0.30,	-- Sea
			0.10	-- Other
		}
	else
		laArray = {
			0.25,	-- Land
			0.225,	-- Air
			0.225,	-- Sea
			0.30	-- Other
		}
	end
	return laArray
end
function P.LandRatio(voProductionData)
	local laArray = {
		infantry_brigade = 2,
		air_cavalry_brigade = 3,
		armor_brigade = 3,
		mechanized_brigade = 13,
	};
	return laArray
end
function P.SpecialForcesRatio(voProductionData)
	local laRatio = {
		20, -- Land
		1	-- Special Force Unit
	};
	local laUnits = {
		marine_brigade = 4,
		paratrooper_brigade = 2,
		special_forces_brigade = 1
	};
	return laRatio, laUnits	
end
function P.FirePower(voProductionData)
	local laArray = {
		"infantry_brigade"
	};
	return laArray
end
function P.AirRatio(voProductionData)
	local laArray = {
		interceptor = 5,
		cag = 3,
		multi_role = 2,
		cas = 2,
		tbm = 1,
		naval_bomber = 1,
		strategic_bomber = 3
	};
	return laArray
end
function P.RocketRatio(voProductionData)
	local laArray = {
		10, -- Air
		1	-- Bomb/Rocket
	};
	return laArray
end
function P.NavalRatio(voProductionData)
	local laArray = {
		destroyer = 10,
		submarine = 3,
		heavy_cruiser = 6,
		light_cruiser = 12,
		patrol_boat = 4,
		carrier = 2
	};
	return laArray
end
function P.TransportLandRatio(voProductionData)
	local laArray = {
		10, -- Land
		3,  -- transport
		2	-- invasion craft
	};
	return laArray
end
function P.ConvoyRatio(voProductionData)
	local laArray = {
		5,	-- Percentage extra (adds to 100 percent so if you put 10 it will make it 110% of needed amount)
		10, -- If Percentage extra is less than this it will force it up to the amount entered
		20, -- If Percentage extra is greater than this it will force it down to this
		5	-- Escort to Convoy Ratio (Number indicates how many convoys needed to build 1 escort)
	};
	return laArray
end
function P.Build_RocketTest(ic, voProductionData)
	return ic, false	
end

-- Diplomacy:
function P.DiploScore_InfluenceNation(voDiploScoreObj)
	local loInfluences = {
		JAP = {Score = 450},
		KOR = {Score = 500},
		ISR = {Score = 500},
		AST = {Score = 250},
		NZL = {Score = 250},
		CHI = {Score = 400},
		JOR = {Score = 100},
		MIC = {Score = 50},
		SOL = {Score = 50},
		PHI = {Score = 150},
		IND = {Score = 125}
	}
	-- Are they on our list
	if loInfluences[voDiploScoreObj.TargetName] then
		return (voDiploScoreObj.Score + loInfluences[voDiploScoreObj.TargetName].Score)
	end
	return voDiploScoreObj.Score
end
function P.DiploScore_OfferTrade(voDiploScoreObj)
	local laTrade = {
		-- Loves:
		ENG = {Score = 200},
		GER = {Score = 200},
		IND = {Score = 100},
		ITA = {Score = 75},
		SPA = {Score = 75},
		POR = {Score = 75},
		JAP = {Score = 175},
		KOR = {Score = 200},
		ISR = {Score = 200},
		CHI = {Score = 200},
		CAN = {Score = 200},
		FRA = {Score = 190},
		AST = {Score = 100},
		NZL = {Score = 100},
		SIN = {Score = 100},
		PHI = {Score = 200},
		MEX = {Score = 50},
		-- Hates:
		BRA = {Score = -50},
		SOV = {Score = -200},
		CHC = {Score = -50},
		PER = {Score = -200},
		SYR = {Score = -200},
		EGY = {Score = -100},
		IRQ = {Score = -150},
		PAK = {Score = -50},
		PRK = {Score = -200}
	}
	if laTrade[voDiploScoreObj.TagName] then
		return voDiploScoreObj.Score + laTrade[voDiploScoreObj.TagName].Score
	end
	return voDiploScoreObj.Score
end
function P.DiploScore_Alliance( viScore, ai, actor, recipient, observer)
	local lsTargetTag = voDiploScoreObj.TargetTag
	if lsTargetTag == 'ISR' or
	lsTargetTag == 'KOR' or
	lsTargetTag == 'SIN' or
	lsTargetTag == 'CHI' or
	lsTargetTag == 'PHI' or
	lsTargetTag == 'AST' or
	lsTargetTag == 'NZL' or
	lsTargetTag == 'ENG' or
	lsTargetTag == 'FRA' or
	lsTargetTag == 'GER' or
	lsTargetTag == 'CAN' or
	lsTargetTag == 'CYP' or
	lsTargetTag == 'MLT' then
		voDiploScoreObj.Score = 200
	elseif lsTargetTag == 'PER' or
	lsTargetTag == 'IRQ' or
	lsTargetTag == 'SYR' or
	lsTargetTag == 'EGY' or
	lsTargetTag == 'SOV' or
	lsTargetTag == 'MEX' or
	lsTargetTag == 'SAU' or
	lsTargetTag == 'CHC' or
	lsTargetTag == 'PKR' then
		return 0
	end
	return voDiploScoreObj.Score
end
function P.ForeignMinister_Influence(voForeignMinisterData)
	local laIgnoreWatch -- Ignore this country but monitor them if they are about to join someone else
	local laWatch -- Monitor them and also fi their score is high enough they can be influenced normally
	local laIgnore -- Ignore them completely
	laWatch = {
		"ISR",
		"KOR",
		"JAP",
		"NZL",
		"AST",
		"SIN",
		"CHI",
		"PHI",
		"FRA",
		"ITA",
		"SPA",
		"GER",
		"ENG",
		"NOR"
	};
	laIgnoreWatch = {
		"MLT",
		"IND",
		"MEX",
		"IRE",
		"CYP",
		"SWE",
		"FIN",
		"POR",
		"SCH",
		"AUS",
		"BOS",
		"SER",
		"SLV",
		"SLO",
		"CZE"
	};
	laIgnore = {
		"PER",
		"IRQ",
		"SYR",
		"EGY",
		"CHC",
		"SOV",
		"PKR",
		"SAU"
	};
	return laWatch, laIgnoreWatch, laIgnore
end
function P.DiploScore_RequestLendLease( liScore, voAI, voActorTag )
	if tostring(voActorTag) == "JAP" or
	tostring(voActorTag) == "KOR" or
	tostring(voActorTag) == "ISR" or
	tostring(voActorTag) == "CHI" or
	tostring(voActorTag) == "ENG" or
	tostring(voActorTag) == "GER" or
	tostring(voActorTag) == "FRA" or
	tostring(voActorTag) == "CYP" or
	tostring(voActorTag) == "SIN" or
	tostring(voActorTag) == "IND" or
	tostring(voActorTag) == "AST" or
	tostring(voActorTag) == "SPR" or
	tostring(voActorTag) == "GRE" or
	tostring(voActorTag) == "NZL" then
		return 200
	end
	return liScore
end

-- Return:
return AI_USA