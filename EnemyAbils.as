package classes {

	public class EnemyAbils{

		public static var TwitchChatEnemy1:Object = {

			gameName: "Move",
			description: "The Twitch chat moves incredibly fast.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Universal
			charge: 2,
			cooldown: 2,
			ability: "movementAbility",
			abilityAnimation: "movementAnimation"
		}

		public static var TwitchChatEnemy2:Object = {

			gameName: "Show Hatred",
			description: "The Twitch chat is a firm believer in hating both the player and the game. Deals splash damage and lowers the DEF of all combatants that get hit.",

			// Selection
			abilityRange: 5,
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "normal",			
			effectRange: 1,
			effects: 
			{hpChange: -1, defChange: -0.2},			

			// Universal
			charge: 5,
			cooldown: 8,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "hateAnimation",
			hitFX: "explosion"
		}

		public static var TwitchChatEnemy3:Object = {

			gameName: "Show Support",
			description: "The twitch chat can be nice, sometimes. Heals the target.",

			// Selection
			abilityRange: 5,
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "normal",
			effects: 
			{hpChange: 0.8},

			// Universal
			charge: 7,
			cooldown: 3,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "supportAnimation"
		}

		public static var TwitchChat1:Object = {

			gameName: "Show Support",
			description: "The twitch chat can be nice, sometimes. Heals a targeted ally.",

			// Selection
			abilityRange: 5,
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "normal",
			effects: 
			{hpChange: 1},

			// Universal
			charge: 14,
			cooldown: 0,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "supportAnimation"
		}

		public static var TwitchChat2:Object = {

			gameName: "Show Hatred",
			description: "The Twitch chat is a firm believer in hating both the player and the game. Deals splash damage and lowers the DEF of all enemy combatants that get hit. Targets the enemy with the most HP.",

			// Selection
			abilityRange: 5,
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectTargetType: "enemies",			
			effectType: "normal",
			effectRange: 1,
			effects: 
			{hpChange: -0.5, defChange: -0.25},			

			// Universal
			charge: 9,
			cooldown: 0,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "hateAnimation",
			hitFX: "explosion"
		}

		public static var TwitchChat3:Object = {

			gameName: "Crash Server",
			description: "Before departing, the twitch chat spams data at the server, which overloads it, and stuns and damages all combatants and Zye.",

			selfTargeting: true,

			// Effects
			effectType: "normal",			
			effectSelectType: "all",
			effectRange: 2,
			effects: 
			{hpChange: -0.5, timeChange: -2},	

			// Universal
			charge: 30,
			cooldown: 0,
			ability: "instantAbility",
			abilityAnimation: "summonExitAnimation"

		}

		public static var Hate1:Object;
		public static var Hate2:Object = {

			gameName: "Hate",
			description: "A vicious ranged attack.",

			// Selection
			abilityRange: 5,
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "normal",
			effects: 
			{hpChange: -0.5, defChange: -0.1},

			// Universal
			charge: 4,
			cooldown: 0,
			ability: "instantAbility",
			abilityAnimation: "attackAnimation"
		}

		public static var Hate3:Object;

		public static var HateVirus1:Object = {

			gameName: "Teleport",
			description: "Hate is the most easily transferable form of energy there is. Thus the hate virus can move anywhere freely.",

			// Selection
			selfTargeting: true,

			// Universal
			charge: 30,
			cooldown: 0,
			ability: "instantAbility",
			abilityAnimation: "randomTeleportAbility"
		}

		public static var HateVirus2:Object = {

			gameName: "Hateful Spew",
			description: "The hate virus spews hateful bile from its mouth. A powerful ranged attack that damages all enemies within 1 tile of the target.",

			// Selection
			abilityRange: 5,
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "normal",
			effectTargetType: "good-guys",
			effectRange: 1,
			effects: 
			{hpChange: -1},

			// Universal
			charge: 15,
			cooldown: 3,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "abilityAnimation",
			hitFX: "explosion"
		}

		public static var HateVirus3:Object = {

			gameName: "Create Hate",
			description: "With its ample power, the hate virus summons its lesser brethren. These offspring will relentlessly attack with the power of hate to chip away at their target's HP and DEF.",

			// Effects
			effectType: "spawn-enemy",
			unit: "Hate",

			// Universal
			charge: 9,
			cooldown: 0,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "abilityAnimation"
		}

		public static var PRISM1:Object = {

			gameName: "Teleport",
			description: "The PRISM system is anywhere and everywhere, allowing her to teleport to a random point on the map.",

			// Selection
			selfTargeting: true,

			// Universal
			charge: 25,
			cooldown: 0,
			ability: "instantAbility",
			abilityAnimation: "uniqueTeleportAbility"
		}

		public static var PRISM2:Object = {

			gameName: "PRISM Beam",
			description: "Unlike light passing through a typical prism and dispersing, PRISM focuses her multitude of streams into a single powerful beam.",

			// Selection
			abilityRange: 5,
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "normal",
			effectRange: 1,
			effects: 
			{hpChange: -1},

			// Universal
			charge: 15,
			cooldown: 3,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "attackAnimation",			
			hitFX: 'prismExplosion'
		}

		public static var PRISM3:Object = {

			gameName: "Utilize Data",
			description: "Summons user data to the battlefield, allowing PRISM to analyze it and increase her combat prowess.",

			// Effects
			effectType: "spawn-enemy",
			unit: "UserData",

			// Universal
			charge: 15,
			cooldown: 0,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "summonAnimation"
		}

		public static var UserData1:Object = {

			gameName: "Move",
			description: "This unit can move one tile in any direction.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Universal
			charge: 8,
			cooldown: 3,
			ability: "movementAbility",
			abilityAnimation: "movementAnimation"

		}

		public static var UserData2:Object = {

			gameName: "Data Scrape",
			description: "User Data scrapes the targets personal data to feed its own vitality",

			// Selection
			abilityRange: 2, //2
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "leech",
			effects: 
			{hpChange: -1},

			// Universal
			charge: 5,
			cooldown: 5,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "spinAnimationInert"
		}

		public static var UserData3:Object = {

			gameName: "Analyze",
			description: "By analyzing acquired data, User Data is capable of increasing its combat effectiveness until the data becomes obsolete.",

			// Selection
			selfTargeting: true,
	
			// Effects
			effectType: "temporary",
			effects: 
			{powChange: 1},
			tempAbilSeconds: 15,
			tempIdleAnimation: "powerUpAnimation",

			// Universal
			charge: 30,
			cooldown: 15,
			ability: "instantAbility",
			abilityAnimation: "spinAnimationAndExecuteEffects"
		}

		public static var Censor1:Object = {

			gameName: "Move",
			description: "This unit can move one tile in any direction.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Universal
			charge: 8,
			cooldown: 3,
			ability: "movementAbility"	
		}

		public static var Censor2:Object = {

			gameName: "Black Mist",
			description: "The censor damages its enemy by suffocating them in a blinding mist. This attack is executed regardless of the position of Zye. So it's prudent to maintain your distance until attacking.",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectTargetType: "good-guys",
			effectRange: 1,
			effectSelectType: "radial",
			effects: 
			{hpChange: -1},

			// Universal
			charge: 10,
			cooldown: 0,
			ability: "instantAbility",
			abilityAnimation: "blackMistAnimation"
		}

		public static var Censor3:Object = {

			gameName: "Blackout",
			description: "The censor censors the battlefield and prevents you from executing any attacks or from seeing the battle unfold.",

			// Selection
			selfTargeting: true,

			// Universal
			charge: 25,
			cooldown: 3,
			ability: "instantAbility",
			abilityAnimation: "blackOutAnimation"
		}

		public static var FakeNews1:Object = {

			gameName: "Replication",
			description: "When its HP drops below 25%. Fake news destroys itself to be recreated elsewhere and given new life.",

			// Selection
			selfTargeting: true,
			effectType: "normal",
			effects: 
			{hpChange: 3},

			// Universal
			charge: 10,
			cooldown: 0,
			ability: "instantAbility",
			abilityAnimation: "randomTeleportAbility"
		}

		public static var FakeNews2:Object = {

			gameName: "Distortion",
			description: "Fake news attacks with contradictory information that heavily damages the target and stuns them.",

			// Selection
			abilityRange: 5,
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "normal",
			effects: 
			{hpChange: -1, timeChange: -3},

			// Universal
			charge: 10,
			cooldown: 5,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "spinAnimationInert"
		}

		public static var FakeNews3:Object = {

			gameName: "Obfuscation",
			description: "Fake news despises seeing people act based on facts, so it will hide your HUD for 10 seconds at a time or until its killed, limiting your informed decision making capabilities.",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "obfuscation",

			// Universal
			charge: 20,
			cooldown: 10,
			ability: "instantAbility",
			abilityAnimation: "spinAnimationAndExecuteEffects"
		}

		public static var Malware1:Object = {

			gameName: "Move",
			description: "This unit can move one tile in any direction. It will place a virus on the tile it arrives on, which will damage enemies if they venture onto it.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Effects
			effectType: "augment",
			effectTargetType: "good-guys",
			effects: 
			{hpChange: -1},
			augment: "infected",
			augmentTrigger: "proximity",

			// Universal
			charge: 6,
			cooldown: 3,
			ability: "movementAbility",
			hasConstantTrail: true,
			abilityAnimation: "movementAnimation"
		}

		public static var Malware2:Object = {

			gameName: "Poke",
			description: "Malware takes the form of a sharp point to pierce at its enemies.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Effects
			effectType: "normal",
			effects: 
			{hpChange: -1},

			// Universal
			charge: 5,
			cooldown: 3,
			ability: "meleeAbility",
			hasConstantTrail: true,
			abilityAnimation: "meleeAnimation"
		}

		public static var Malware3:Object = {

			gameName: "Sludgify",
			description: "Malware compresses and hides itself in the ground to avoid taking damage.",

			// Selection
			selfTargeting: true,
	
			// Effects
			effectType: "temporary",
			effects: 
			{defChange: 1.25},
			tempAbilSeconds: 5,
			tempIdleAnimation: "defenseIdleAnimation",

			// Universal
			charge: 10,
			cooldown: 5,
			ability: "instantAbility"
		}

		public static var Spambot1:Object = {

			gameName: "Move",
			description: "This unit can move one tile in any direction.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Universal
			charge: 6,
			cooldown: 3,
			ability: "movementAbility",
			abilityAnimation: "movementAnimation"
		}
		
		public static var Spambot2:Object = {

			gameName: "Spam Missile",
			description: "Fires a spammy cloud of nonsense toward its enemy.",

			// Selection
			abilityRange: 2, //2
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "normal",
			effects: 
			{hpChange: -1},

			// Universal
			charge: 5,
			cooldown: 3,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "projectileAnimation"
		}

		public static var Spambot3:Object = {

			gameName: "Spam Ad",
			description: "Every 30 seconds, the spambot opens three pop-up windows, which obscure vision of the battlefield until they are closed by pressing on the X buttons.",

			// Selection
			selfTargeting: true,

			// Universal
			charge: 30,
			cooldown: 3,
			ability: "instantAbility",
			abilityAnimation: "spamAnimation"
		}

		public static var Bloatware1:Object = {

			gameName: "Tumblr",
			description: "Bloatware rolls ever any combatants in its way in a linear path.",

			// Selection
			abilityRange: 5,
			abilitySelectType: "eight-way",
			goesThroughThings: true,

			// Effects
			effectType: "normal",
			effectSelectType: "vector",
			effects: 
			{hpChange: -1},

			// Universal
			charge: 5,
			cooldown: 3,
			ability: "movementAbility",
			abilityAnimation: "movementAnimation"
		}

		public static var Bloatware2:Object = {

			gameName: "Nudge",
			description: "If bloatware it's unable to roll into its target because its back is against the wall, it will nudge into them instead for less damage.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Effects
			effectType: "normal",
			effects: 
			{hpChange: -0.75},

			// Universal
			charge: 5,
			cooldown: 3,
			ability: "meleeAbility",
			abilityAnimation: "meleeAnimation"
		}

		public static var Bloatware3:Object = {

			gameName: "Bloat",
			description: "Bloatware can download additional useless software to increase in size for greater rolling power!",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectRange: 0,
			effects: 
			{powChange: 0.25},

			// Universal
			charge: 10,
			cooldown: 3,
			ability: "instantAbility",
			abilityAnimation: "bloatAnimation"
		}

		public static var YoutubeComment1:Object = {

			gameName: "Move",
			description: "This unit can move one tile in any direction.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Universal
			charge: 6,
			cooldown: 3,
			ability: "movementAbility",
			abilityAnimation: "movementAnimation"
		}

		public static var YoutubeComment2:Object = {

			gameName: "Spin",
			description: "The YouTube comment spins at their target to damage them with its edginess. A standard melee attack.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Effects
			effectType: "normal",
			effectRange: 0,
			effects: 
			{hpChange: -1},

			// Universal
			charge: 5,
			cooldown: 3,
			ability: "meleeAbility",
			abilityAnimation: "spinAnimationAndMoveBackToTile"
		}

		public static var YoutubeComment3:Object = {

			gameName: "Stupify",
			description: "The YouTube comment says something so stupid it catches nearby friends and foes off guard for a permanent DEF reduction.",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectRange: 1,
			effectSelectType: "radial",
			effects: 
			{defChange: -0.25},

			// Universal
			charge: 10,
			cooldown: 3,
			ability: "instantAbility",
			abilityAnimation: "stupifyAnimation"
		}

		public static var Penguin1:Object = {

			gameName: "Waddle",
			description: "This unit can move one tile in any direction... awkwardly.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Universal
			charge: 6,
			cooldown: 3,
			ability: "movementAbility",
			abilityAnimation: "movementAnimation"
		}

		public static var Penguin2:Object = {

			gameName: "Awkwardness",
			description: "The glare of the awkward penguin both damages enemies and lowers their POW permanently.",

			// Selection
			abilityRange: 2,
			abilitySelectType: "radial",

			// Effects
			effectType: "normal",
			effectRange: 0,
			effects: 
			{hpChange: -1, powChange: -0.1},

			// Universal
			charge: 5,
			cooldown: 3,
			ability: "instantAbility",
			abilityAnimation: "awkwardAnimation"
		}

		public static var Penguin3:Object = {

			gameName: "Timidness",
			description: "The awkward penguin is deathly afraid of others entering its personal space and will become ferocious in defense by permanently raising its POW.",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectRange: 0,
			effects: 
			{powChange: 0.2},

			// Universal
			charge: 0,
			cooldown: 10,
			ability: "instantAbility",
			abilityAnimation: "shakeAnimation"
		}

		public static var OmegaPenguin1:Object = {

			gameName: "Waddle",
			description: "This unit can move one tile in any direction... awkwardly.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Universal
			charge: 6,
			cooldown: 3,
			ability: "movementAbility",
			abilityAnimation: "movementAnimation"
		}

		public static var OmegaPenguin2:Object = {

			gameName: "Awkwardness",
			description: "The glare of the Omega Penguin damages enemies.",

			// Selection
			abilityRange: 2,
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "normal",			
			effects: 
			{hpChange: -1},

			// Universal
			charge: 5,
			cooldown: 3,
			ability: "instantAbility",
			abilityAnimation: "awkwardAnimation"
		}

		public static var OmegaPenguin3:Object = {

			gameName: "Yes, M'lady",
			description: "The Omega Penguin will do everything in can to make sure its allies are without discomfort. A powerful healing ability.",

			// Selection
			abilityRange: 3, //3
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "normal",
			effects: 
			{hpChange: 1},

			// Universal
			charge: 6,
			cooldown: 3,
			ability: "instantAbility",
			abilityAnimation: "awkwardAnimation"
		}

		public static var InsanityWolf1:Object = {

			gameName: "Intimidate",
			description: "The approach of the insanity wolf drives fear into the hearts of men, permanently lowering their DEF.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Effects
			effectType: "normal",
			effectTargetType: "good-guys",
			effectRange: 1,
			effectSelectType: "radial",
			effects: 
			{defChange: -0.1},

			// Universal
			charge: 4,
			cooldown: 3,
			ability: "movementAbility",
			abilityAnimation: "movementAnimation"
		}

		public static var InsanityWolf2:Object = {

			gameName: "Fury Swipes",
			description: "A vicious melee attack.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "radial",

			// Effects
			effectType: "normal",
			effectRange: 0,
			effects: 
			{hpChange: -1},

			// Universal
			charge: 5,
			cooldown: 3,
			ability: "meleeAbility",
			abilityAnimation: "meleeAnimation"
		}

		public static var InsanityWolf3:Object = {

			gameName: "Insanity",
			description: "The fervor of the insanity wolf impassions nearby allies for a permanent POW increase.",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectTargetType: "enemies",
			effectRange: 1,
			effects: 
			{powChange: 0.1},

			// Universal
			charge: 0,
			cooldown: 10,
			ability: "instantAbility",
			abilityAnimation: "jumpAnimation"
		}
		
		public static var AlphaWolf1:Object = {

			gameName: "Intimidate",
			description: "The approach of the Alpha Wolf drives fear into the hearts of men, permanently lowering their DEF.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Effects
			effectType: "normal",
			effectTargetType: "good-guys",
			effectRange: 1,
			effectSelectType: "radial",
			effects: 
			{defChange: -0.2},

			// Universal
			charge: 4,
			cooldown: 3,
			ability: "movementAbility",
			abilityAnimation: "movementAnimation"
		}

		public static var AlphaWolf2:Object = {

			gameName: "Fury Swipe",
			description: "A vicious melee attack.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "radial",

			// Effects
			effectType: "normal",
			effectRange: 0,
			effects: 
			{hpChange: -1},

			// Universal
			charge: 4,
			cooldown: 3,
			ability: "meleeAbility",
			abilityAnimation: "meleeAnimation"
		}

		public static var AlphaWolf3:Object = {

			gameName: "Insanity",
			description: "The fervor of the insanity wolf impassions nearby allies for a permanent POW increase.",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectTargetType: "enemies",
			effectRange: 1,
			effects: 
			{powChange: 0.2},

			// Universal
			charge: 0,
			cooldown: 10,
			ability: "instantAbility",
			abilityAnimation: "jumpAnimation"
		}

		public static var Scumbag1:Object = {

			gameName: "Move",
			description: "This unit can move one tile in any direction.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Universal
			charge: 6,
			cooldown: 3,
			ability: "movementAbility",
			abilityAnimation: "movementAnimation"
		}

		public static var Scumbag2:Object = {

			gameName: "Flick Dirt",
			description: "The scumbag flicks dirt from afar at an enemy combatant to damage them and lower their DEF. A total dick move.",

			// Selection
			abilityRange: 2,
			abilitySelectType: "radial",

			// Effects
			effectType: "normal",
			effectRange: 0,
			effects: 
			{hpChange: -1, defChange: -0.15},

			// Universal
			charge: 5,
			cooldown: 3,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "flickAnimation"
		}

		public static var Scumbag3:Object = {

			gameName: "Push",
			description: "The scumbag pushes their target 1 tile away. Also a pretty dickish move.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "radial",

			// Effects
			effectType: "push",

			// Universal
			charge: 5,
			cooldown: 3,
			ability: "meleeAbility",
			abilityAnimation: "meleeAnimation"
		}

		public static var Troll1:Object = {

			gameName: "Intimidate", // magent to magent
			description: "The approach of the Troll is deeply unsettling. Causes a permanent DEF decrease to nearby enemies.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Effects
			effectType: "normal",
			effectTargetType: "good-guys",
			effectRange: 1,
			effectSelectType: "radial",
			effects: 
			{defChange: -0.2},

			// Universal
			charge: 6,
			cooldown: 3,
			ability: "movementAbility",
			abilityAnimation: "movementAnimation"
		}

		public static var Troll2:Object = {

			gameName: "Draw Agro",
			description: "By acting the fool, the troll can draw a targets attack toward itself if it's an action that targets a point on the map.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "agro",	
			effects: 
			{hpChange: -1},

			// Universal
			charge: 6,
			cooldown: 4,
			ability: "instantAbility",
			abilityAnimation: "attackAnimation"
		}

		public static var Troll3:Object = {

			gameName: "Troll Physics",
			description: "If the troll has your attention (an action from Zye is aimed at it). It will immediately heal all allies on the map as well as permanently increase their POW and DEF.",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectSelectType: "all",
			effectTargetType: "enemies",
			effects: 
			{hpChange: 0.5, powChange: 0.2, defChange: 0.2},

			// Universal
			charge: 0,
			cooldown: 10,
			ability: "instantAbility",
			abilityAnimation: "castingAnimation"
		}

		public static var Flamer1:Object = {

			gameName: "Move",
			description: "This unit can move one tile in any direction. When it arrives at its location, it will shed its rage and make the tile on which it now stands volatile.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Effects
			effectType: "augment",
			effectRange: 1,
			effects: 
			{hpChange: -1},
			augment: "explosive",
			augmentTrigger: "damage",

			// Universal
			charge: 6,
			cooldown: 3,
			ability: "movementAbility",
			hasConstantTrail: true,
			abilityAnimation: "movementAnimation"
		}
		
		public static var Flamer2:Object = {

			gameName: "Flame",
			description: "A powerful ranged attack which does damage to both friend and foe in a 1 tile radius from the targeted origin. Remember kids, flaming will drive away your friends too.",

			// Selection
			abilityRange: 2,
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "normal",
			effectRange: 1,
			effects: 
			{hpChange: -1},

			// Universal
			charge: 8,
			cooldown: 4,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "attackAnimation",
			hitFX: "explosion"
		}

		public static var Flamer3:Object = {

			gameName: "Rage Quit",
			description: "In a sad fit of rage, the flamer will depart in a blaze of shame, damaging all nearby combatants significantly.",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectRange: 1,
			effects: 
			{hpChange: -2},

			// Universal
			charge: 7,
			cooldown: 0,
			ability: "instantAbility",
			abilityAnimation: "selfDestructAnimation"
		}

		public static var Hacker1:Object = {

			gameName: "Teleport",
			description: "Every 20 seconds, the hacker will use its lag switch to teleport to a random point on the map.",

			// Selection
			selfTargeting: true,

			// Universal
			charge: 20,
			cooldown: 0,
			ability: "instantAbility",
			abilityAnimation: "teleportAnimation"
		}

		public static var Hacker2:Object = {

			gameName: "Aim Bot",
			description: "An attack with incredible range, but a significant cooldown.",

			// Selection
			abilityRange: 5,
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "normal",			
			effects: 
			{hpChange: -1},

			// Universal
			charge: 5,
			cooldown: 8,
			ability: "instantAbility",
			abilityAnimation: "attackAnimation"
		}

		public static var Hacker3:Object = {

			gameName: "Instant Regen",
			description: "The hacker has tweaked the game code to instantly recover a portion of its HP every 30 seconds.",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectRange: 0,
			effects: 
			{hpChange: 0.85},

			// Universal
			charge: 30,
			cooldown: 0,
			ability: "instantAbility",
			abilityAnimation: "castingAnimation"
		}

		public static var CorruptedMalware1:Object = {

			gameName: "Move",
			description: "This unit can move one tile in any direction.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Effects
			effectType: "augment",
			effectTargetType: "good-guys",
			effects: 
			{hpChange: -1},
			augment: "infected",
			augmentTrigger: "proximity",

			// Universal
			charge: 6,
			cooldown: 3,
			ability: "movementAbility",
			hasConstantTrail: true,
			abilityAnimation: "movementAnimation"
		}

		public static var CorruptedMalware2:Object = {

			gameName: "Poke",
			description: "A standard melee attack.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Effects
			effectType: "normal",
			effects: 
			{hpChange: -1},

			// Universal
			charge: 5,
			cooldown: 3,
			ability: "meleeAbility",
			hasConstantTrail: true,
			abilityAnimation: "meleeAnimation"
		}

		public static var CorruptedMalware3:Object = {

			gameName: "Detonate",
			description: "Once hit, the corrupted malware will detonate just 5 seconds later and damage all nearby combatants.",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectRange: 1,
			effects: 
			{hpChange: -2},

			// Universal
			charge: 5,
			cooldown: 0,
			ability: "instantAbility",
			abilityAnimation: "selfDestructAnimation"
		}

		public static var Malphaware1:Object = {

			gameName: "Move",
			description: "This unit can move one tile in any direction.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Effects
			effectType: "augment",
			effectTargetType: "good-guys",
			effects:
			{hpChange: -1},
			augment: "infected",
			augmentTrigger: "proximity",

			// Universal
			charge: 7,
			cooldown: 3,
			ability: "movementAbility",
			hasConstantTrail: true,
			abilityAnimation: "movementAnimation"
		}

		public static var Malphaware2:Object = {

			gameName: "Poke",
			description: "A standard, but powerful, melee attack.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Effects
			effectType: "normal",
			effects:
			{hpChange: -1},

			// Universal
			charge: 7,
			cooldown: 3,
			ability: "meleeAbility",
			hasConstantTrail: true,
			abilityAnimation: "meleeAnimation"
		}

		public static var Malphaware3:Object = {

			gameName: "Fragment",
			description: "The Malphaware splits off a fragment of itself to assist it in battle. Once hit, the fragmented malware will detonate just 5 seconds later and damage all nearby combatants.",

			// Effects
			effectType: "spawn-enemy",
			unit: "CorruptedMalware",

			// Universal
			charge: 12,
			cooldown: 0,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "fragmentAnimation"
		}


		public static var AdBlock1:Object = {

			gameName: "Protection",
			description: "Heals Zye if he is nearby.",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectTargetType: "good-guys",
			effectRange: 1,
			effects: 
			{hpChange: 0.65},

			// Universal
			charge: 7,
			cooldown: 3,
			ability: "instantAbility",
			abilityAnimation: "spinAnimationAndExecuteEffects"
		}

		public static var AdBlock2:Object = {

			gameName: "Draw Agro",
			description: "Draws the attacks of nearby enemies to itself.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "agro",
			effects: 
			{hpChange: -0.85},

			// Universal
			charge: 5,
			cooldown: 3,
			ability: "instantAbility",
			abilityAnimation: "spinAnimationAndExecuteEffects"
		}

		public static var AdBlock3:Object = {

			gameName: "LLOD",
			description: "Stands for Last Line Of Defense. AdBlock gives a defense boost to Zye if he is close by before departing.",

			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectTargetType: "good-guys",
			effectSelectType: "radial",
			effectRange: 1,
			effects: 
			{defChange: 0.1},

			// Universal
			charge: 30,
			cooldown: 0,
			ability: "instantAbility",
			abilityAnimation: "summonExitAnimation"
		}

		public static var CourageWolf1:Object = {

			gameName: "Move",
			description: "This unit can move one tile in any direction.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Universal
			charge: 3,
			cooldown: 3,
			ability: "movementAbility",
			abilityAnimation: "movementAnimation"
		}

		public static var CourageWolf2:Object = {

			gameName: "Slash",
			description: "A courageous melee attack.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "radial",

			// Effects
			effectType: "normal",
			effectRange: 0,
			effects: 
			{hpChange: -1.25},

			// Universal
			charge: 4,
			cooldown: 3,
			ability: "meleeAbility",
			abilityAnimation: "meleeAnimation"
		}

		public static var CourageWolf3:Object = {

			gameName: "Courage",
			description: "Before departing, the Courage Wolf says some inspiring words that boosts your vigor for a permanent POW increase.",

			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectTargetType: "good-guys",
			effectSelectType: "radial",
			effectRange: 2,
			effects: 
			{powChange: 0.2},

			// Universal
			charge: 30,
			cooldown: 0,
			ability: "instantAbility",
			abilityAnimation: "summonExitAnimation"
		}

		public static var ClickBait1:Object;
		public static var ClickBait2:Object = {
			
			gameName: "Self-Destruct",
			description: "Blows itself up.",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectRange: 1,
			effects: 
			{hpChange: -2},

			// Universal
			charge: 4,
			cooldown: 0,
			ability: "instantAbility",
			abilityAnimation: "selfDestructAnimation"
		}

		public static var ClickBait3:Object = {

			gameName: "Self-Destruct",
			description: "Blows itself up.",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectRange: 1,
			effects: 
			{hpChange: -2},

			// Universal
			charge: 30,
			cooldown: 0,
			ability: "instantAbility",
			abilityAnimation: "selfDestructAnimation"
		}

		public static var AdBlockEnemy1:Object = {

			gameName: "Move",
			description: "This unit can move one tile in any direction.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Universal
			charge: 4,
			cooldown: 3,
			ability: "movementAbility",
			abilityAnimation: "movementAnimation"
		}

		public static var AdBlockEnemy2:Object = {

			gameName: "Spin",
			description: "A standard melee attack.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Effects
			effectType: "normal",
			effectRange: 0,
			effects: 
			{hpChange: -1},

			// Universal
			charge: 4,
			cooldown: 3,
			ability: "meleeAbility",
			abilityAnimation: "spinAnimationAndMoveBackToTile"
		}

		public static var AdBlockEnemy3:Object = {

			gameName: "Unblock Spam",
			description: "Launches a volley of popups.",

			// Selection
			selfTargeting: true,

			// Universal
			charge: 6,
			cooldown: 3,
			ability: "instantAbility",
			abilityAnimation: "spamAnimation"
		}

		public static var TimeBomb1:Object;
		public static var TimeBomb2:Object = {

			gameName: "Self-Destruct",
			description: "Blows itself up.",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectRange: 2,
			effectSelectType: "cross",
			effects: 
			{hpChange: -1, timeChange: -3},

			// Universal
			charge: 5,
			cooldown: 3,
			ability: "instantAbility",
			hitFX: "explosion",
			abilityAnimation: "selfDestructAnimation"
		}		
		public static var TimeBomb3:Object;

		public static var Wall1:Object;
		public static var Wall2:Object = {

			gameName: "Burn",
			description: "Burns nearby combatants.",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectRange: 1,
			effectSelectType: "box",
			effects: 
			{hpChange: -0.5, defChange: -0.2},

			// Universal
			charge: 4,
			cooldown: 0,
			ability: "instantAbility",
			hitFX: "flare"
		}

		public static var Wall3:Object = {

			gameName: "Fizzle Out",
			description: "Fizzles out.",

			// Selection
			selfTargeting: true,

			// Universal
			charge: 13,
			cooldown: 0,
			ability: "instantAbility",
			hitFX: "poof",
			abilityAnimation: "selfDestructAnimation"
		}


		public static var Trap1:Object;
		public static var Trap2:Object = {

			gameName: "Insidious Burn",
			description: "Ouch.",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectRange: 1,
			effectTargetType: "good-guys",
			effectSelectType: "box",
			effects: 
			{hpChange: -1},

			// Universal
			charge: 10,
			cooldown: 0,
			ability: "instantAbility",
			hitFX: "rage",
			abilityAnimation: "restart"
		}
		public static var Trap3:Object;

		public static var Judgment1:Object = {

			gameName: "Move",
			description: "This unit can move one tile in any direction.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Universal
			charge: 6,
			cooldown: 3,
			ability: "movementAbility",
			abilityAnimation: "movementAnimation"
		}

		public static var Judgment2:Object = {

			gameName: "Down Vote",
			description: "Down votes hurt feelings for moderate damage.",

			// Selection
			abilityRange: 2,
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "normal",
			//effectRange: 0,
			effects: 
			{hpChange: -1.2},

			// Universal
			charge: 5,
			cooldown: 3,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "downAnimation"
		}

		public static var Judgment3:Object = {

			gameName: "Up Vote",
			description: "Up votes inspire joy for moderate HP recovery. Judgment will heal the most damaged ally up to 3 tiles away.",

			// Selection
			abilityRange: 3,
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "normal",
			effects: 
			{hpChange: 0.8},

			// Universal
			charge: 7,
			cooldown: 3,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "upAnimation"
		}

		public static var HiveMind1:Object = {
			gameName: "Call to Arms",
			description: "Summons a mobling into battle. Moblings are ranged combatants that are weak defensively but potent offensively.",

			// Effects
			effectType: "spawn-enemy",
			unit: "Mobling",

			// Universal
			charge: 12,
			cooldown: 0,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "fragmentAnimation"
		}

		public static var HiveMind2:Object = {
			gameName: "Invigorate",
			description: "Whips all moblings into shape with an invigorating roar for a permanent POW increase.",

			// Selection
			selfTargeting: true,

			// Effects
			effectType: "normal",
			effectRange: 2,
			effectSelectType: "radial",
			effectTargetType: "enemies",
			effects: 
			{powChange: 0.1},

			// Universal
			charge: 9,
			cooldown: 0,
			ability: "instantAbility",
			abilityAnimation: "invigorateAnimation"
		}

		public static var HiveMind3:Object = {
			gameName: "Echo Chamber",
			description: "By shutting out other views, the Hive Mind raises its DEF spectacularly.",

			// Selection
			selfTargeting: true,
	
			// Effects
			effectType: "temporary",
			effects: 
			{defChange: 2},
			tempAbilSeconds: 10,
			tempIdleAnimation: "defenseIdleAnimation",

			// Universal
			charge: 15, // 10
			cooldown: 10,
			ability: "instantAbility"
		}

		public static var Mobling1:Object = {

			gameName: "Move",
			description: "This unit can move one tile in any direction.",

			// Selection
			abilityRange: 1,
			abilitySelectType: "eight-way",

			// Universal
			charge: 7,
			cooldown: 3,
			ability: "movementAbility",
			abilityAnimation: "movementAnimation"
		}

		public static var Mobling2:Object = {

			gameName: "Hurl Pitchfork",
			description: "A powerful ranged attack. Does double damage against dead horses.",

			// Selection
			abilityRange: 2, //2
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "normal",			
			effects: 
			{hpChange: -1},

			// Universal
			charge: 5, //6
			cooldown: 3,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "spinAnimationInert"
		}

		public static var Mobling3:Object;

		public static var Gamergate1:Object = {
			gameName: "Hatred",
			description: "A devastating attack with infinite range that damages both Zye and allied summons within 1 tile of the targeted tile. It can be stopped by damaging the Gamergate.",

			// Selection
			abilityRange: 5,
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "normal",
			effectTargetType: "good-guys",
			effectRange: 1,
			effects: 
			{hpChange: -2.5, powChange: -0.1, defChange: -0.1},

			// Universal
			charge: 10,
			cooldown: 0,
			ability: "instantAbility",
			abilityAnimation: "castingAnimation",
			hitFX: "explosion"
		}

		public static var Gamergate2:Object = {
			gameName: "Oppression",
			description: "A powerful attack with infinite range that will fire at Zye relentlessly. Be agile and block frequently to avoid taking damage.",

			// Selection
			abilityRange: 5,
			abilitySelectType: "radial",
			goesThroughThings: true,

			// Effects
			effectType: "normal",
			effects: 
			{hpChange: -1},

			// Universal
			charge: 5, 
			cooldown: 5,
			ability: "projectileAbility",
			hasConstantTrail: true,
			projectileMc: "projectileMc",
			abilityAnimation: "attackAnimation",
			hitFX: "explosion"
		}

		public static var Gamergate3:Object = {
			gameName: "Reinforce",
			description: "Gamergate never has a hard time getting backup. Summons a troll, hacker, or flamer into battle.",

			// Effects
			effectType: "spawn-enemy",
			unit: "RandomGamer",

			// Universal
			charge: 5,
			cooldown: 15,
			ability: "projectileAbility",
			hasConstantTrail: false,
			projectileMc: "projectileMc",
			abilityAnimation: "summonAnimation"
		}
		
		public static var TrainingDummy1:Object;
		public static var TrainingDummy2:Object;
		public static var TrainingDummy3:Object;

		public static var GenericTarget1:Object;
		public static var GenericTarget2:Object;
		public static var GenericTarget3:Object;
	}
}