public static var abilityData: Object = {

	runAbil: {

		objectName: 'runAbil',
		gameName: 'Move',
		pic: 'runIcon',
		storeOrder: 0,
		objectStatus: 'blue:0',
		description: 'Your standard movement ability. Moves you up to one tile away.',

		// Selection
		abilityRange: 1, //1
		abilitySelectType: 'eight-way',
		deselectCombatants: true,

		// Universal
		charge: 3,
		cooldown: 7,
		ability: 'movementAbility',
		abilityAnimation: 'movementAnimation'
	},

	sprintAbil: {

		objectName: 'sprintAbil',
		gameName: 'Run',
		pic: 'sprintIcon',
		storeOrder: 1,
		objectStatus: 'blue:1',
		description: 'For when need to get somewhere a little more quickly at the cost of some AP. Moves you up to two tiles away.',

		// Selection
		abilityRange: 2,
		abilitySelectType: 'eight-way',
		deselectCombatants: true,

		// Universal
		charge: 5,
		cooldown: 7,
		ap: 2,
		ability: 'movementAbility',
		abilityAnimation: 'movementAnimation'
	},

	dashAbil: {

		objectName: 'dashAbil',
		gameName: 'Dash',
		pic: 'dashIcon',
		storeOrder: 2,
		description: 'Useful for when you need to move a short distance quickly at the cost of a moderate amount of AP. Use this ability when you need to avoid attacks ASAP.',

		// Selection
		abilityRange: 1,
		abilitySelectType: 'eight-way',
		deselectCombatants: true,

		// Universal
		charge: 1,
		cooldown: 4,
		ap: 2,
		ability: 'movementAbility',
		abilityAnimation: 'movementAnimation'
	},

	teleportAbil: {

		objectName: 'teleportAbil',
		gameName: 'Teleport',
		pic: 'teleportIcon',
		storeOrder: 3,
		description: 'By utilizing a lag-switch, Zye can instantly teleport to any tile in an arena. This ability is particularly useful for creating enough distance from enemies to set up intricate traps uninterrupted, or to get out of a dangerous situation. But beware, this ability is costly in both time and AP.',

		// Selection
		//abilityRange: 5,
		deselectCombatants: true,

		// Universal
		charge: 8,
		cooldown: 8,
		ap: 8,
		ability: 'teleportAbility',		
		abilityAnimation: 'castingAnimation'
	},

	attackAbil: {

		objectName: 'attackAbil',
		gameName: 'Slash',
		pic: 'attackIcon',
		storeOrder: 4,
		objectStatus: 'red:0',
		description: "I know what you're thinking. Slash? How is that an internet-ish sounding ability? Well hot shot, there's slashes all over the internet! Back slashes, forward slashes, Slash the musician videos on YouTube. So get out of here with your judgment!... Anyway, this is your standard melee ability.",

		// Selection
		abilityRange: 1,
		abilitySelectType: 'eight-way',

		// Effects
		effectType: 'normal',
		effectRange: 0,
		effects:
		{ hpChange: -1 },

		// Universal
		charge: 5,
		cooldown: 3,
		ability: 'meleeAbility',
		abilityAnimation: 'attackAnimation'
	},

	lagSpikeAbil: {

		objectName: 'lagSpikeAbil',
		gameName: 'Lag Spike',
		pic: 'lagSpikeIcon',
		storeOrder: 5,
		objectStatus: 'red:1',
		description: 'A powerful thrust that strikes with such force that it temporarily disconnects the target.',

		// Selection
		abilityRange: 1,
		abilitySelectType: 'eight-way',

		// Effects
		effectType: 'normal',
		effectRange: 0,
		effects:
		{ hpChange: -1.25, timeChange: -3 },

		// Universal
		charge: 7, //7
		cooldown: 3,
		ap: 3,
		ability: 'meleeAbility',
		abilityAnimation: 'thrustAnimation'
	},

	blockAbil: {

		objectName: 'blockAbil',
		gameName: 'Block',
		pic: 'blockIcon',
		storeOrder: 6,
		objectStatus: 'green:0',
		description: 'By blocking one of his network ports (raising his shield), Zye temporarily reduces all incoming damage significantly.',

		// Selection
		selfTargeting: true,

		// Effects
		effectType: 'temporary',
		effects:
		{ defChange: 0.6 },
		tempAbilSeconds: 3,		

		// Universal
		charge: 3,
		cooldown: 3,		
		ability: 'instantAbility',
		abilityAnimation: 'blockingAnimation'
	},

	parryAbil: {

		objectName: 'parryAbil',
		gameName: 'Parry',
		pic: 'parryIcon',
		storeOrder: 7,
		description: "By concentrating intensely for a moment, Zye is able to parry all incoming attacks.\n\nThis ability temporarily reduces all incoming damage significantly and reflects 50% of that damage to its sources.",
		objectStatus: 'green:1',

		// Selection
		selfTargeting: true,

		// Effects
		effectType: 'temporary',
		effects:
		{ defChange: 1, damageReturnChange: 0.5 },
		tempAbilSeconds: 2,		

		// Universal
		charge: 3,
		cooldown: 3,
		ap: 2,
		ability: 'instantAbility',
		abilityAnimation: 'blockingAnimation'
	},

	pingAbil: {

		objectName: 'pingAbil',
		gameName: 'Ping of Death',
		pic: 'pingIcon',
		storeOrder: 8,
		description: "A ranged attack that damages a single enemy with a malformed ping. Basically, it's your standard RPG fireball-like ability.",

		// Selection
		abilityRange: 3,
		abilitySelectType: 'radial',
		goesThroughThings: true,

		// Effects
		effectType: 'normal',
		effects:
		{ hpChange: -0.7 },

		// Universal
		charge: 5,
		cooldown: 3,
		ap: 1,
		ability: 'projectileAbility',
		projectileMc: 'invisMc',
		abilityAnimation: 'projectileAnimation',
		projectileTrailPool: 'redMisslePool'
	},

	explosiveTrapAbil: {

		objectName: 'explosiveTrapAbil',
		gameName: 'Flamer\'s Wrath',
		pic: 'explosionIcon',
		storeOrder: 9,
		description: "By tapping into his inner demons, Zye is able to harness his dormant rage and concentrate it into a pocket of highly combustible energy.",

		// Selection
		abilityRange: 2,
		abilitySelectType: 'box',

		// Effects
		effectType: 'augment',
		effectRange: 1,
		effects:
		{ hpChange: -0.5 },
		augment: 'explosive',
		augmentTrigger: 'damage',

		// Universal
		charge: 2,
		cooldown: 2,
		ap: 2,
		ability: 'projectileAbility',
		projectileMc: 'invisMc',
		abilityAnimation: 'projectileAnimation',
		projectileTrailPool: 'sparkTrailPool'
	},

	lowerDefenseAbil: {

		objectName: 'lowerDefenseAbil',
		gameName: 'Hack',
		pic: 'hackIcon',
		storeOrder: 10,
		description: 'Installs a back door into enemy code, which permenantly lowers their DEF.',

		// Selection
		abilityRange: 2,
		abilitySelectType: 'radial',
		goesThroughThings: true,

		//effectType: 'temporary',
		effectType: 'normal',
		effects:
		{ defChange: -0.5 },
		//tempAbilSeconds: 7,

		// Universal
		charge: 5,
		cooldown: 3,
		ap: 3,
		ability: 'projectileAbility',
		projectileMc: 'invisMc',
		abilityAnimation: 'projectileAnimation',
		projectileTrailPool: 'greenMisslePool'
	},

	corruptPacket: {

		objectName: 'corruptPacket',
		gameName: 'Corrupt Packet',
		pic: 'corruptPacketIcon',
		storeOrder: 11,
		description: 'Everything in the internet is communicated via packets of data. You can do a lot of damage by sending the wrong kinds of packets.',

		// Selection
		abilityRange: 3,
		abilitySelectType: 'box',
		goesThroughThings: true,

		// Effects
		effectType: 'normal',
		effectRange: 1,
		effects:
		{ hpChange: -0.7 },

		// Universal
		charge: 6,
		cooldown: 3,
		ap: 4,
		ability: 'projectileAbility',
		projectileMc: 'packetMc',
		abilityAnimation: 'projectileAnimation',
		hitFX: 'corruptExplosion',
		hasConstantTrail: true,
		projectileTrailPool: 'corruptTrailPool'
	},

	pushAbil: {

		objectName: 'pushAbil',
		gameName: 'Push',
		pic: 'pushIcon',
		storeOrder: 12,
		description: 'Slightly damages a target and pushes them one tile away from Zye. This ability does not work on combatants that Zye is tasked with protecting. I guess I could make this ability sound kind of internet-ish through some flimsy connection with the git push command. So yeah, think of it as a git push... or something like that.',

		// Selection
		abilityRange: 1,
		abilitySelectType: 'eight-way',

		// Effects
		effectType: 'push',
		effectRange: 0,
		effects:
		{ hpChange: -0.3},

		// Universal
		charge: 1, //7
		cooldown: 3,
		ap: 3,
		ability: 'meleeAbility',
		abilityAnimation: 'thrustAnimation'
	},

	linearAttackAbil: {

		objectName: 'linearAttackAbil',
		gameName: 'SHOOP DA WHOOP',
		pic: 'shoopIcon',
		storeOrder: 13,
		cannotBeBought: false,
		description: 'One of the weirder early memes of the internet. Charge your lazor, and then fire your lazor for massive damage on all enemies in a linear path.',

		// Selection
		abilitySelectType: 'eight-way',
		abilityRange: 5,
		goesThroughThings: true,

		// Effects
		effectRange: 5,
		effectType: 'shoop-da-whoop',
		effectSelectType: 'direction',
		effects:
		{ hpChange: -1.85 },

		// Universal
		charge: 8,
		cooldown: 3,
		ap: 7,
		ability: 'projectileAbility',
		projectileMc: 'invisMc',
		abilityAnimation: 'shoopAnimation',
		hitFX: 'shoopExplosion',
		hasConstantTrail: true,
		projectileTrailPool: 'shoopTrailPool'
	},


	wallAbil: {

		objectName: 'wallAbil',
		gameName: 'Firewall',
		pic: 'fireWallIcon',
		storeOrder: 14,
		description: 'This ability erects a wall of fire that prevents most units from moving through it. It also does 0.5 x POW damage, and reduces DEF by 0.2 x POW for all enemies within one tile of the wall. This ability is effected by base POW only, which is POW before ability buffs and equipment buffs are applied.',

		// Selection
		abilityRange: 2,
		abilitySelectType: 'box',
		goesThroughThings: true,

		// Effects
		effectType: 'spawn-simple',
		unit: 'Wall',

		// Universal
		charge: 5,
		cooldown: 3,
		ap: 3,
		ability: 'projectileAbility',
		projectileMc: 'invisMc',
		abilityAnimation: 'projectileAnimation',
		hitFX: "flare",
		projectileTrailPool: 'sparkTrailPool'
	},

	rageAbil: {

		objectName: 'rageAbil',
		gameName: 'Rage',
		pic: 'rageIcon',
		storeOrder: 15,
		description: 'Zye releases his pent up rage on nearby combatants, greatly damaging them and hurting their feelings for a slight DEF drop. This ability also damages and debuffs Zye himself.',

		// Selection
		selfTargeting: true,

		// Effects
		effectType: 'normal',
		effectRange: 1,
		effectSelectType: 'box',
		effects:
		{ hpChange: -1.1, defChange: -0.1 },

		// Universal
		charge: 6,
		cooldown: 3,
		ap: 3,
		ability: 'instantAbility',
		hitFX: 'flare',		
		abilityAnimation: "rageAnimation"
	},

	disarmTileAbil: {

		objectName: 'disarmTileAbil',
		gameName: 'Clear Cache',
		pic: 'clearCacheIcon',
		storeOrder: 16,
		description: "Wondering why something isn't working on a web page? Try clearing your cache. This ability removes the augment on the target tile.",

		// Selection
		abilityRange: 2,
		abilitySelectType: 'box',
		goesThroughThings: true,

		// Effects
		effectType: 'clear-augment',

		// Universal
		charge: 1,
		cooldown: 3,
		ap: 1,
		ability: 'projectileAbility',
		projectileMc: 'invisMc',
		abilityAnimation: 'projectileAnimation',
		projectileTrailPool: 'poofPool'		
	},

	hpBoostAbil: {

		objectName: 'hpBoostAbil',
		gameName: 'Joy',
		pic: 'joyIcon',
		storeOrder: 17,
		description: 'Just as hate destroys, joy can heal. The internet can be harsh place but it can also be a beautiful thing. By taking a moment to reflect on the beauty around him, Zye is able to heal himself.',

		// Selection
		selfTargeting: true,

		// Effects
		effectType: 'normal',
		effectRange: 0,
		effects:
		{ hpChange: 0.85 },
		scaleCost: true,

		// Universal
		charge: 3,
		cooldown: 3,
		ap: 4,
		ability: 'instantAbility',
		abilityAnimation: 'castingAnimation'
	},

	apBoostAbil: {

		objectName: 'apBoostAbil',
		gameName: 'Focus',
		pic: 'focusIcon',
		storeOrder: 18,
		description: 'The internet has undoubtedly made focusing and being productive difficult, but through sheer determination, people manage to forgo Netflix and Reddit and get back to work. By reclaiming his focus, Zye is able to restore some lost AP so that he get things done.',

		// Selection
		selfTargeting: true,

		// Effects
		effectType: 'normal',
		effectRange: 0,
		effects:
		{ apChange: 0.15 },
		scaleCost: true,

		// Universal
		charge: 7,
		cooldown: 3,
		ability: 'instantAbility',
		abilityAnimation: 'castingAnimation'
	},


	atkUpAbil: {

		objectName: 'atkUpAbil',
		gameName: 'Buffer',
		pic: 'bufferIcon',
		storeOrder: 19,
		description: 'Buffer abilities ahead of time to give them more punch! Temporarily increases POW significantly.',

		// Selection
		selfTargeting: true,

		// Effects
		effectType: 'temporary',
		effects:
		{ powChange: 0.7 },
		tempAbilSeconds: 3,

		// Universal
		charge: 3,
		cooldown: 3,
		ap: 3,
		ability: 'instantAbility',
		abilityAnimation: 'castingAnimation'
	},

	summonClickBait: {

		objectName: 'summonClickBait',
		gameName: 'Summon Click Bait',
		pic: 'clickBaitIcon',
		storeOrder: 20,
		cannotBeBought: true,
		description: 'Summons Click Bait. Click Bait will coax all enemies into attacking it. Once it has been hit once, it will begin a detonation sequence and damage all nearby enemies caught in the blast. Note: Summmons remove any augments on a tile they are summoned on.',

		// Selection
		abilityRange: 1,
		abilitySelectType: 'box',
		goesThroughThings: true,

		// Effects
		effectType: 'summon',
		unit: 'ClickBait',

		// Universal
		charge: 6,
		cooldown: 6,
		ap: 9,
		ability: 'projectileAbility',
		projectileMc: 'invisMc',
		abilityAnimation: 'projectileAnimation',
		projectileTrailPool: 'poofPool'
	},

	summonTwitchChatAbil: {

		objectName: 'summonTwitchChatAbil',
		gameName: 'Summon Twitch Chat',
		pic: 'twitchChatIcon',
		storeOrder: 21,
		cannotBeBought: true, // true
		description: 'Summons the Twitch Chat. The Twitch Chat will fight for you until it is defeated or its timer runs out. A particularly good summon for fighting against bosses and strong enemies. Note: Summmons remove any augments on a tile they are summoned on.',

		// Selection
		abilityRange: 2,
		abilitySelectType: 'box',
		goesThroughThings: true,

		// Effects
		effectType: 'summon',
		unit: 'TwitchChat',

		// Universal
		charge: 6,
		cooldown: 6,
		ap: 9,
		ability: 'projectileAbility',
		projectileMc: 'invisMc',
		abilityAnimation: 'projectileAnimation',		
		projectileTrailPool: 'poofPool'
	},

	summonCourageAbil: {

		objectName: 'summonCourageAbil',
		gameName: 'Summon Courage',
		pic: 'courageIcon',
		storeOrder: 22,
		cannotBeBought: true, // true
		description: 'Summons the Courage Wolf. Courage Wolf will attack enemies relentlessly until he is defeated or his timer runs out. Note: summmons remove any augments on a tile they are summoned on.',

		// Selection
		abilityRange: 2,
		abilitySelectType: 'box',
		goesThroughThings: true,

		// Effects
		effectType: 'summon',
		unit: 'CourageWolf',

		// Universal
		charge: 6,
		cooldown: 6,
		ap: 9,
		ability: 'projectileAbility',
		projectileMc: 'invisMc',
		abilityAnimation: 'projectileAnimation',		
		projectileTrailPool: 'poofPool'
	},

	summonAdBlockAbil: {

		objectName: 'summonAdBlockAbil',
		gameName: 'Summon AdBlock',
		pic: 'adBlockIcon',
		storeOrder: 23,
		cannotBeBought: true,
		description: 'Summons Ad Block. Ad block will agro nearby enemies and heal Zye if he is close by. As an added bonus, he also blocks ads! Note: Summmons remove any augments on a tile they are summoned on.',

		// Selection
		abilityRange: 2,
		abilitySelectType: 'box',
		goesThroughThings: true,

		// Effects
		effectType: 'summon',
		unit: 'AdBlock',

		// Universal
		charge: 6,
		cooldown: 6,
		ap: 9,
		ability: 'projectileAbility',
		projectileMc: 'invisMc',
		abilityAnimation: 'projectileAnimation',		
		projectileTrailPool: 'poofPool'
	}
}

/*
	slowAbil: {

		objectName: 'slowAbil',
		gameName: 'Throttle',
		pic: 'throttleIcon',
		storeOrder: 11,
		description: 'By momentarily throttling an enemies download and upload speeds, Zye can delay a single enemies actions by 4 seconds and damages them. Particularly effective against Bosses.',

		// Selection
		abilityRange: 2,
		abilitySelectType: 'radial',
		goesThroughThings: true,

		// Effects
		effectType: 'normal',
		effects:
		{ timeChange: -4, hpChange: -1},

		// Universal
		charge: 2,
		cooldown: 6,
		ap: 4,
		ability: 'projectileAbility',
		projectileMc: 'invisMc',
		abilityAnimation: 'projectileAnimation',
		projectileTrailPool: 'orangeMisslePool'
	},
*/