public static var itemData:Object = {

	hpBoostItem: {

		objectName: 'hpBoostItem',
		gameName: 'Refresh',
		pic: 'refreshIcon',
		storeOrder: 0,
		cost: 50,
		baseCost: 50,
		stock: 0,
		description: "Refreshes the mind body and soul for significant HP recovery.",

		// Selection
		selfTargeting: true,

		// Effects
		effectType: 'normal',
		effectRange: 0,
		effects: 
		{hpChange: 0.85},

		// Universal
		charge: 3,
		cooldown: 3,
		ability: 'instantAbility',
		abilityAnimation: 'castingAnimation'
	},

	apBoostItem: {

		objectName: 'apBoostItem',
		gameName: 'Bandwidth',
		pic: 'bandwidthIcon',
		storeOrder: 1,
		cost: 70,
		baseCost: 70,
		stock: 0,
		description: "A small swirling ball of blue energy. It restores AP by increasing the bandwidth cap for the user.",

		// Selection
		selfTargeting: true,

		// Effects
		effectType: 'normal',
		effectRange: 0,
		effects: 
		{apChange: 0.15},

		// Universal
		charge: 3,
		cooldown: 3,
		ability: 'instantAbility',
		abilityAnimation: 'castingAnimation'
	},

	explosiveTrapItem: {

		objectName: 'explosiveTrapItem',
		gameName: 'Flame Bait',
		pic: 'explosionIcon',
		storeOrder: 2,
		cost: 65,
		baseCost: 65,
		stock: 0,
		description: "A transparent, cubic container that holds a mess of highly combustible material. The materials within were extracted from a flamer's corpse; their rage had burnt too bright. \n\nThis item can be used to make a tile explosive. Once a tile is explosive you can trigger an explosion by targeting the tile with a damaging ability.",

		// Selection
		abilityRange: 2,
		abilitySelectType: 'box',

		// Effects
		effectType: 'augment',
		effectRange: 1,
		effects: 
		{hpChange: -0.8},
		augment: 'explosive',
		augmentTrigger: 'damage',

		// Universal
		charge: 2,
		cooldown: 2,
		ability: 'projectileAbility',
		projectileMc: 'invisMc',
		abilityAnimation: 'projectileAnimation',		
		projectileTrailPool: 'sparkTrailPool'
	},

	leroyTonicItem: {

		objectName: 'leroyTonicItem',
		gameName: "Leroy J's Tonic",
		pic: 'leroyTonicIcon',
		storeOrder: 3,
		cost: 40,
		baseCost: 40,
		stock: 0,
		description: 'Before YOLO, there was Leroy. This tonic channels the gung ho can-do attitude of the esteemed Leroy Jenkins by sacrificing some DEF for a significant amount of POW. Leeeeerrrooy Jeeeeennkins!',

		// Selection
		selfTargeting: true,

		// Effects
		effectType: 'temporary',
		effects: 
		{powChange: 1, defChange: -0.5},
		tempAbilSeconds: 7, //10

		// Universal
		charge: 2,
		cooldown: 7,
		ability: 'instantAbility',
		abilityAnimation: 'castingAnimation'
	},

	catGifsItem: {

		objectName: 'catGifsItem',
		gameName: 'Cute Cat Gifs',
		pic: 'catGifsIcon',
		storeOrder: 4,
		cost: 40,
		baseCost: 40,
		stock: 0,
		description: "A collection of disarmingly adorable .gifs that diminishes the targets will to fight by lowering both their POW and DEF. The gif with the miniature cat being tickled is included in these ^.^",

		// Selection
		abilityRange: 2,
		abilitySelectType: 'radial',

		// Effects
		effectType: 'temporary',
		effects: 
		{powChange: -0.75, defChange: -0.5},
		tempAbilSeconds: 12,

		// Universal
		charge: 2,
		cooldown: 0,
		ability: 'projectileAbility',
		projectileMc: 'invisMc',
		abilityAnimation: 'projectileAnimation',		
		projectileTrailPool: 'whiteMisslePool'
	},

	linearAttackItem: {

		objectName: 'linearAttackItem',
		gameName: 'Diet Soda & Mentos',
		pic: 'cokeMentosIcon',
		storeOrder: 5,
		cost: 75,
		baseCost: 75,
		stock: 0,
		description: 'Once upon a time, there was a short-lived YouTube phenomenon that revolved around putting mentos into diet soda to produce high powered streams of carbonated pain. This item fires a soda bottle in a linear path, damaging all combatants in its wake.',

		// Selection
		abilitySelectType: 'eight-way',
		abilityRange: 5,
		goesThroughThings: true,

		// Effects
		effectRange: 5,
		effectType: 'normal',
		effectSelectType: 'direction',
		effects: 
		{hpChange: -1.25},

		// Universal
		charge: 4,
		cooldown: 0,
		ability: 'projectileAbility',
		projectileMc: 'bottleMc',
		abilityAnimation: 'projectileAnimation',
		hitFX: 'sodaExplosion',
		projectileTrailPool: 'brownMisslePool'
	},

	defenseItem: {

		objectName: 'defenseItem',
		gameName: 'Chain Mail',
		pic: 'chainMailIcon',
		storeOrder: 6,
		cost: 65,
		baseCost: 65,
		stock: 0,
		description: 'Few things on the internet are as durable and long lasting as chain mail. Use this to temporarily increase DEF significantly.',

		// Selection
		selfTargeting: true,

		// Effects
		effectType: 'temporary',
		effects: 
		{defChange: 0.75},
		tempAbilSeconds: 8,

		// Universal
		charge: 1,
		cooldown: 8,
		ap: 1,
		ability: 'instantAbility',
		abilityAnimation: 'castingAnimation'
	},

	virusItem: {

		objectName: 'virusItem',
		gameName: 'Virus',
		pic: 'virusIcon',
		storeOrder: 7,
		cost: 55,
		baseCost: 55,
		stock: 0,
		description: 'Extracted from nefarious scripts found on ancient porn sites. This item augments a tile so that it will damage an enemy greatly if they were to walk over it.',

		// Selection
		abilityRange: 3,	
		abilitySelectType: 'box',
		goesThroughThings: true,	

		// Effects
		effectType: 'augment',
		effectTargetType: 'enemies',
		effects: 
		{hpChange: -1.5},
		augment: 'heroInfected',
		augmentTrigger: 'proximity',

		// Universal
		charge: 4,
		cooldown: 0,
		ability: 'projectileAbility',
		projectileMc: 'invisMc',
		abilityAnimation: 'projectileAnimation',
		projectileTrailPool: 'purpleMisslePool'
	},

	forkBombItem: {

		objectName: 'forkBombItem',
		gameName: 'Fork Bomb',
		pic: 'forkBombIcon',
		storeOrder: 8,
		cost: 85,
		baseCost: 85,
		stock: 0,
		description: "Normally a fork bomb is a process that endlessly spawns other processes and can be used to crash servers. In this case, it's a bomb that literally blows up in a fork-like formation to stun and damage enemies. Does 1 x POW damage, and stuns enemies for 3 seconds. This item is effected by base POW only, which is POW before ability/item buffs and equipment buffs are applied.",

		// Selection
		abilityRange: 2,
		abilitySelectType: 'box',
		goesThroughThings: true,

		// Effects
		effectType: 'spawn-simple',
		unit: 'TimeBomb',

		// Universal
		charge: 2,
		cooldown: 0,
		ap: 1,
		ability: 'projectileAbility',
		projectileMc: 'invisMc',
		abilityAnimation: 'projectileAnimation',
		hitFX: "poof",
		projectileTrailPool: 'sparkTrailPool'
	},

	reflectorItem: {

		objectName: 'reflectorItem',
		gameName: 'Reposter',
		pic: 'repostIcon',
		storeOrder: 9,
		cost: 50,
		baseCost: 50,
		stock: 0,
		description: 'This item channels the fervor of the most shameless reposters on the internet, allowing Zye to reflect all damage he sustains by instantly mimicking enemy attacks.',

		// Selection
		selfTargeting: true,

		// Effects
		effectType: 'temporary',
		effects: 
		{damageReturnChange: 1},
		tempAbilSeconds: 3,		

		// Universal
		charge: 1,
		cooldown: 3,
		ap: 1,
		ability: 'instantAbility',
		abilityAnimation: 'castingAnimation'
	},

	peachItem: {

		objectName: 'peachItem',
		gameName: 'Peach',
		pic: 'peachIcon',
		storeOrder: 10,
		cost: 100,
		baseCost: 100,
		stock: 0,
		cannotBeBought: true,
		description: "It's a peach. You can eat it to restore some health, or it can be sold for a decent amount. But it might be worth holding onto?",

		// Selection
		selfTargeting: true,

		// Effects
		effectType: 'normal',
		effectRange: 0,
		effects: 
		{hpChange: 1},

		// Universal
		charge: 3,
		cooldown: 3,
		ability: 'instantAbility',
		abilityAnimation: 'castingAnimation'
	}
}
