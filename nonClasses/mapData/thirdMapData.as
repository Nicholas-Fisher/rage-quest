public var thirdMapData:Object = {

a0_3: {
objectArray: [
{id: 'Conversationalist', avatar: 'Troll', conversation: 'hope_you_enjoyed_that', pos: [5,0]}, 
{id: 'Conversationalist', avatar: 'Troll', conversation: 'lol', pos: [0,0]}, 
{id: 'Conversationalist', avatar: 'Troll', conversation: 'not_quite', pos: [5,4]}, 
{id: 'ZipChest', pos: [5,1], item: 'bitcoins', stock: 10}
], 
locked: true, heroPos: [0,4], isSafe: true, 
tileMap: [/*
'000','001','002','003','004','005'*/
'c00','c62','m62','c62','m62','c00',//0
'm62','c62','m62','c62','c62','c00',//1
'c62','c62','m62','c62','m62','m62',//2
'c62','m62','m62','c62','c62','c62',//3
'c00','c62','c62','c62','m62','c00',//4
]
},

a0_2: {
objectArray: [{id: 'Flamer', lvl: 8, pos: [1,0]}, {id: 'Flamer', lvl: 8, pos: [1,4]}, {id: 'InsanityWolf', lvl: 12, pos: [4,2]}],
locked: true, heroPos: [2,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'n00','c65','c00','m68','n00','n00',//0
'm59','c56','c00','c66','c55','n00',//1
'c93','c55','c00','c94','c00','n00',//2
'm67','c00','c53','c54','c00','n00',//3
'n00','c00','c00','n00','n00','n00',//4
]
},

a0_1: {
objectArray: [
{id: 'Conversationalist', avatar: 'Flamer', conversation: 'flamer', pos: [1,2]}, 
{id: 'Conversationalist', avatar: 'Hacker', conversation: 'hacker', pos: [3,2]}, 
{id: 'Conversationalist', avatar: 'myself', conversation: 'you_came_all_this_way', pos: [5,1]}, 
{id: 'ZipChest', pos: [5,0], item: 'linearAttackItem', stock: 3}
], 
locked: true, heroPos: [0,4], isSafe: true, 
tileMap: [/*
'000','001','002','003','004','005'*/
'c54','c00','c55','n00','c53','c55',//0
'c00','m63','c56','n00','c00','c00',//1
'c00','c00','c00','c00','c54','m67',//2
'c53','n00','c55','m64','c00','n00',//3
'c00','n00','c00','c54','c00','n00',//4
]
},

a0_0: {
objectArray: [{ id: 'Flamer', lvl: 9, pos: [3, 1], conversation: 'flamer_ig'}, { id: 'Flamer', lvl: 9, pos: [3, 4] }, { id: 'InsanityWolf', lvl: 10, pos: [4, 2] }],
locked: false, heroPos: [1,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'h60','h61','m63','m64','m67','n00',//0
'h59','m68','l69','c56','c00','n00',//1
'c65','c00','c00','c53','c54','n00',//2
'c55','c00','l67','l68','c00','n00',//3
'm63','c00','c00','c66','c00','n00',//4
]
},

//---------------------------------------------------------New Col

a1_2: {
objectArray: [{id: 'Flamer', lvl: 10, pos: [4,1]}, {id: 'Flamer', lvl: 10, pos: [4,3]}, {id: 'Judgment', lvl: 10, pos: [5,2]},
{id: 'GenericTarget', avatar: 'someguy1', lvl: 8, pos: [2,2], isProtectee: true, conversation: 'girl_ig'}
],
locked: true, heroPos: [1,2], lossCondition: GV.PROTECTION, oneTimeFight: true,
popUp: {title: "Special Battle", subtitle: "Protect the target.", 
description: "To be victorious, you have to defeat your enemies before they kill their target."},
tileMap: [/*
'000','001','002','003','004','005'*/
'n00','n00','m68','m67','c00','n00',//0
'n00','c65','c00','c66','c54','c00',//1
'n00','c00','c00','c56','c00','c00',//2
'n00','c00','c53','c00','c55','c00',//3
'n00','n00','m63','m64','c00','n00',//4
]
},

a1_1: {
objectArray: [{id: 'Hacker', lvl: 10, pos: [4,2], conversation: 'hacker_ig'}, {id: 'Hacker', lvl: 10, pos: [0,2]}, {id: 'YoutubeComment', lvl: 9, pos: [0,0]}, {id: 'YoutubeComment', lvl: 9, pos: [4,4]}],
locked: true, heroPos: [2,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'c00','c65','c56','n00','n00','n00',//0
'c00','c00','c97','m62','m58','n00',//1
'c00','c53','c55','c66','c00','n00',//2
'n00','m64','c97','c54','c55','n00',//3
'n00','n00','c00','c56','c00','n00',//4
]
},

a1_0: {
objectArray: [{id: 'Troll', lvl: 8, pos: [4,2], conversation:'troll_ig'}, {id: 'InsanityWolf', lvl: 8, pos: [3,4]}, {id: 'InsanityWolf', lvl: 8, pos: [2,1]}, {id: 'Judgment', lvl: 8, pos: [5,2]}],
locked: true, heroPos: [2,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'h60','h61','n00','n00','n00','n00',//0
'm62','c65','c66','m68','c54','n00',//1
'm57','c00','c53','c00','c56','c00',//2
'n00','c53','c54','c55','c00','n00',//3
'n00','n00','c55','c00','m67','n00',//4
]
},


//---------------------------------------------------------New Col

a2_2: {
objectArray: [
{id: 'Conversationalist', avatar: 'someguy1', conversation: 'the_writer', pos: [5,1]}, 
{id: 'Conversationalist', avatar: 'heroCompanion', conversation: 'right_thing', pos: [3,0]},
{id: 'Conversationalist', avatar: 'popUpSign', conversation: 'wiki_flamers', pos: [4,3]},
{id: 'ZipChest', pos: [0,3], item: 'bitcoins', stock: 200},
{id: 'ZipChest', pos: [3,4], item: 'hpBoostItem', stock: 3}
], 
locked: true, heroPos: [1,1], isSafe: true, 
tileMap: [/*
'000','001','002','003','004','005'*/
'h57','h58','m62','c00','m69','n00',//0
'h59','c00','m67','c53','c00','c00',//1
'c55','c00','c54','c00','c00','n00',//2
'c00','c53','l68','c54','c00','n00',//3
'n00','c00','c56','c00','n00','n00',//4
]
},

//---------------------------------------------------------New Col

a3_3: {
objectArray: [{id: 'Bloatware', lvl: 10, pos: [0,2]}, {id: 'Flamer', lvl: 10, pos: [1,0]}, {id: 'Flamer', lvl: 10, pos: [4,2]}, {id: 'Bloatware', lvl: 10, pos: [3,4]}],
locked: true, heroPos: [2,2], lossCondition: GV.TIME_OUT,
popUp: {title: "Special Battle", subtitle: "Defeat your enemies in under 15 actions.", 
description: "To be victorious, you have to defeat your enemies by, or on, your 15th action. It\'s all about offense over defense, so go hot and heavy."},
tileMap: [/*
'000','001','002','003','004','005'*/
'h57','c66','n00','n00','n00','n00',//0
'c65','c00','m62','m69','n00','n00',//1
'c56','c55','c00','c00','c66','c00',//2
'n00','c00','c00','c54','c53','c00',//3
'n00','n00','c00','c00','n00','n00',//4
]
},

a3_2: {
objectArray: [{id: 'Flamer', lvl: 8, pos: [3,1]}, {id: 'Penguin', lvl: 8, pos: [4,4]}, {id: 'Malware', lvl: 11, pos: [1,4]}, {id: 'Hacker', lvl: 8, pos: [0,0]}],
locked: true, heroPos: [1,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'c65','c66','m68','m59','n00','n00',//0
'c00','c54','c00','c00','c00','n00',//1
'c00','c00','c00','l69','c00','n00',//2
'm64','c53','c00','c55','c00','n00',//3
'n00','c00','c00','c00','c54','n00',//4
]
},

a3_1: {
objectArray: [{id: 'TwitchChatEnemy', lvl: 1, pos: [5,1], conversation: 'twitch'}, {id: 'Troll', lvl: 10, pos: [0,1]}, {id: 'Flamer', lvl: 8, pos: [4,4]}, {id: 'Scumbag', lvl: 8, pos: [3,1]}], boss: true, oneTimeFight: true,
locked: true, heroPos: [0,4],
popUp: {title: "Boss Fight", subtitle: "Twitch Chat: It moves so fast.", 
description: "The Twitch Chat is always hungry for a good show. Show him and the boys what you've got." + bossInfoString('TwitchChatEnemy')},
afterWinPopUp: {title: "New Summon", subtitle: "Twitch Chat has joined you.", 
description: "The Twitch Chat is sufficiently entertained by your battle prowess and has decided to join your cause as a new summon. To summon an ally into battle you must equip the desired summon ability in Equip > Items/Abilities."},
afterBattleFunc: 'addTwitchChatSummon',
tileMap: [/*
'000','001','002','003','004','005'*/
'h60','h61','m62','n00','n00','n00',//0
'c65','c00','c66','c54','c53','c00',//1
'c00','c00','l68','c00','l69','c56',//2
'm63','c53','l67','c00','l67','c00',//3
'c65','c00','c55','c56','c00','c55',//4
]
},

//---------------------------------------------------------New Col

a4_3: {
objectArray: [{id: 'InsanityWolf', lvl: 9, pos: [1,1]}, {id: 'Judgment', lvl: 9, pos: [2,1]}, {id: 'Spambot', lvl: 9, pos: [5,2]}, {id: 'Hacker', lvl: 9, pos: [5,3]}],
locked: true, heroPos: [1,4],
tileMap: [/*
'000','001','002','003','004','005'*/
'h59','h63','m69','n00','n00','n00',//0
'm62','c65','c66','c00','c00','n00',//1
'm68','c00','c54','l67','c55','c00',//2
'n00','c55','c00','l69','c00','c00',//3
'n00','c00','c53','c00','c56','n00',//4
]
},


a4_2: {
objectArray: [{id: 'Flamer', lvl: 25, pos: [2,2], conversation:'flamer_lvl25_ig'}, {id: 'Judgment', lvl: 10, pos: [4,2]}],
locked: true, heroPos: [0,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'h60','h64','m61','m57','c66','n00',//0
'c65','c00','c00','c53','c00','n00',//1
'c00','c53','c00','l68','c56','c54',//2
'n00','c00','c54','c55','c00','c00',//3
'n00','n00','n00','n00','n00','n00',//4
]
},

a4_0: {
objectArray: [
{id: 'Conversationalist', removeCondition: 'destroyTheGamerGate', avatar: 'hate', conversation: 'swirling_hate', pos: [2,2]},
{id: 'Conversationalist', avatar: 'heroCompanion', conversation: 'hate', pos: [5,0]},
{id: 'Conversationalist', avatar: 'Flamer', conversation: 'its_beautiful', pos: [5,4]},
{id: 'ZipChest', pos: [0,2], item: 'hpBoostItem', stock: 3}
], 
locked: true, heroPos: [5,2], isSafe: true, 
tileMap: [/*
'000','001','002','003','004','005'*/
'c65','c66','c54','c56','c66','c00',//0
'c54','l69','l68','l67','c55','n00',//1
'c00','l67','c00','c55','c00','c53',//2
'c55','l68','l69','l68','c54','n00',//3
'c00','c56','c00','c53','c00','c00',//4
]
},

//---------------------------------------------------------New Col

a5_3: {
objectArray: [{id: 'Troll', lvl: 10, pos: [5,3]}, {id: 'InsanityWolf', lvl: 10, pos: [4,1]}, {id: 'Malware', lvl: 10, pos: [3,4]}],
locked: true, heroPos: [2,2],
tileMap: [/*
/*
'000','001','002','003','004','005'*/
'n00','n00','n00','n00','n00','n00',//0
'h58','m59','c66','c55','c56','n00',//1
'm62','c65','c54','c00','c00','c00',//2
'n00','c00','c53','c00','c00','c00',//3
'n00','n00','c00','c00','m63','n00',//4
]
},

a5_2: {
objectArray: [
{id: 'Conversationalist', avatar: 'Hacker', conversation: 'do_we_play', pos: [1,3]}, 
{id: 'Conversationalist', avatar: 'myself', conversation: 'i_used_to_be_here', pos: [3,4]},
{id: 'Conversationalist', avatar: 'popUpSign', conversation: 'wiki_mmr', pos: [4,2]},
{id: 'Conversationalist', avatar: 'pepe', conversation: 'pepe', pos: [5,1]},
{id: 'ZipChest', pos: [1,2], item: 'bitcoins', stock: 190},
{id: 'ZipChest', pos: [5,4], item: 'bitcoins', stock: 120}
], 
locked: true, heroPos: [2,1], isSafe: true, 
tileMap: [/*
'000','001','002','003','004','005'*/
'n00','n00','n00','n00','n00','n00',//0
'h60','h61','c53','c00','c56','c66',//1
'h57','c65','c55','l67','c00','c00',//2
'm58','c00','c54','c00','m64','c00',//3
'n00','n00','m63','c00','n00','c00',//4
]
},

a5_1: {
objectArray: [{id: 'Flamer', lvl: 10, pos: [1,1], conversation: "flamer2_ig"}, {id: 'Flamer', lvl: 10, pos: [4,1]}, {id: 'Flamer', lvl: 10, pos: [4,3]}, {id: 'Flamer', lvl: 10, pos: [1,4]}, {id: 'Flamer', lvl: 10, pos: [0,3]}],
locked: true, heroPos: [2,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'n00','m64','c65','c66','c97','n00',//0
'm64','c65','c56','c00','c55','n00',//1
'c97','c55','c00','l68','c00','n00',//2
'c00','c00','c53','c00','c54','n00',//3
'n00','c00','c00','c97','m64','n00',//4
]
},

a5_0: {
objectArray: [{id: 'Gamergate', lvl: 1, pos: [1,2], conversation: 'gamergate_ig'}],
locked: true, heroPos: [4,2], boss: true, oneTimeFight: true, music: 'gamergate', afterBattleFunc: 'gameOverAchievement',
popUp: {title: "Boss Fight", subtitle: "Gamergate: The wall of torment.", 
description: "To acquire the vast collection of hate stored behind it, you will need to defeat the Gamergate. The Gamergate is a fickle creature with an easily bruised ego, if you attack while it's charging its blue action, that action will immediately be pushed into its cooldown phase." + bossInfoString('Gamergate')},
tileMap: [/*
'000','001','002','003','004','005'*/
't59','h58','m67','m67','c94','n00',//0
'h60','h61','c65','c66','c55','n00',//1
'm53','c53','c00','c54','c56','n00',//2
'l67','l68','c53','c00','c53','n00',//3
'm57','m62','m68','m69','c93','n00',//4
]
},

//---------------------------------------------------------New Col

a6_3: {
objectArray: [{id: 'Flamer', lvl: 10, pos: [4,1]}, {id: 'Judgment', lvl: 10, pos: [3,4]}, {id: 'Bloatware', lvl: 10, pos: [3,2]}, {id: 'Hacker', lvl: 10, pos: [5,3]}],
locked: true, heroPos: [1,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'n00','n00','n00','n00','n00','n00',//0
'm60','m61','c00','c00','c54','c00',//1
'm62','c00','c55','c00','l68','c56',//2
'n00','c54','c00','c00','c53','c00',//3
'n00','n00','c00','c00','c00','n00',//4
]
},

a6_2: {
objectArray: [{id: 'Malware', lvl: 8, pos: [1,4]}, {id: 'InsanityWolf', lvl: 9, pos: [3,4]}, {id: 'InsanityWolf', lvl: 9, pos: [1,2]}, {id: 'Penguin', lvl: 9, pos: [3,2]}, {id: 'Judgment', lvl: 12, pos: [2,1]}],
locked: true, heroPos: [2,4],
tileMap: [/*
'000','001','002','003','004','005'*/
'n00','n00','n00','n00','n00','n00',//0
'c98','c54','c53','c55','c98','n00',//1
'c56','c98','l67','c98','c56','n00',//2
'c96','c55','c98','c00','c95','n00',//3
'c00','c54','c00','c53','c00','n00',//4
]
},

a6_1: {
objectArray: [{id: 'Malware', lvl: 9, pos: [1,1]}, {id: 'InsanityWolf', lvl: 10, pos: [3,1]}, {id: 'Malware', lvl: 9, pos: [2,4]}, {id: 'Flamer', lvl: 10, pos: [0,2]}, {id: 'Flamer', lvl: 10, pos: [4,2]}],
locked: true, heroPos: [2,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'n00','m57','m68','m58','n00','n00',//0
'c55','c00','c00','c00','c00','n00',//1
'c00','c00','c53','c00','c54','n00',//2
'm63','c54','c00','c00','m64','n00',//3
'n00','c00','c56','c00','n00','n00',//4
]
},

a6_0: {
objectArray: [{id: 'Hacker', lvl: 10, pos: [3,4]}, {id: 'Flamer', lvl: 10, pos: [3,1]}, {id: 'Troll', lvl: 10, pos: [2,1]}, {id: 'Spambot', lvl: 10, pos: [1,1]}],
locked: true, heroPos: [1,4],
tileMap: [/*
'000','001','002','003','004','005'*/
'h62','m57','m60','m61','n00','n00',//0
'm69','c65','c55','c56','c95','n00',//1
'm59','l67','c00','c94','c00','n00',//2
'n00','c53','c54','c00','c53','n00',//3
'n00','c00','c55','c00','n00','n00',//4
]
},

//---------------------------------------------------------New Col

a7_3: {
objectArray: [
{id: 'Conversationalist', avatar: 'Flamer', pos: [1,1]}, 
{id: 'Conversationalist', avatar: 'InsanityWolf', conversation: 'no_chill', pos: [2,1]}, 
{id: 'Conversationalist', avatar: 'Troll', conversation: 'trollish', pos: [1,3]},
{id: 'Conversationalist', avatar: 'popUpSign', conversation: 'troll_wiki', pos: [4,0]},
{id: 'ZipChest', pos: [4,1], item: 'bitcoins', stock: 200}
], 
locked: true, heroPos: [3,4], isSafe: true, 
tileMap: [/*
'000','001','002','003','004','005'*/
'h60','h61','m69','c54','c00','n00',//0
'm62','c65','c00','c00','c53','n00',//1
'm59','c53','c56','c55','m64','n00',//2
'n00','c00','c54','c00','m63','n00',//3
'n00','n00','m68','c56','m67','n00',//4
]
},

a7_1: {
objectArray: [
{id: 'Conversationalist', avatar: 'Penguin', conversation: 'so_this_is_the_gaming_world', pos: [4,0]}, 
{id: 'Conversationalist', avatar: 'TrainingDummy', conversation: 'i_can_take_it', pos: [0,2]}, 
{id: 'Conversationalist', avatar: 'heroCompanion', conversation: 'does_hate_ever_die', pos: [5,3]},
{id: 'Conversationalist', avatar: 'myself', conversation: 'nick_spikes', pos: [1,1]},
{id: 'Conversationalist', avatar: 'Flamer', conversation: 'offended', pos: [5,2]}, 
{id: 'ZipChest', pos: [0,3], item: 'leroyTonicItem', stock: 2},
{id: 'ZipChest', pos: [5,1], item: 'hpBoostItem', stock: 2}
], 
locked: true, heroPos: [3,3], isSafe: true, 
tileMap: [/*
'000','001','002','003','004','005'*/
'h57','h58','m60','m61','c66','m64',//0
'h59','c65','l67','l68','c55','c56',//1
'c56','c00','l68','l67','c00','c00',//2
'c53','c55','l69','c00','c53','c54',//3
'm67','c00','c00','c54','c00','m68',//4
]
},

//---------------------------------------------------------New Col

a8_3: {
objectArray: [{id: 'Judgment', lvl: 14, pos: [3,3]}, {id: 'Judgment', lvl: 14, pos: [3,0]}, {id: 'Troll', lvl: 18, pos: [4,2]}],
locked: true, specialUnlockCondition: true, heroPos: [1,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'h60','h61','m59','c56','n00','n00',//0
'h58','c65','c00','c00','n00','n00',//1
'm64','c53','l68','c54','c00','n00',//2
'n00','c00','c55','c00','c56','n00',//3
'n00','n00','n00','n00','n00','n00',//4
]
},

//---------------------------------------------------------New Col

a9_3: {
objectArray: [{id: 'Hacker', lvl: 12, pos: [1,0]}, {id: 'Hacker', lvl: 12, pos: [4,0], conversation:'hacker2_ig'}, {id: 'Hacker', lvl: 12, pos: [4,4]}, {id: 'Hacker', lvl: 12, pos: [1,4]}, {id: 'Hacker', lvl: 12, pos: [0,2]}],
locked: true, heroPos: [2,2], newQuestPhaseOncomplete: 'hackTheHackers2',
tileMap: [/*
'000','001','002','003','004','005'*/
'c65','c00','c53','c66','c00','n00',//0
'c54','l67','c00','l69','c00','n00',//1
'c00','c66','c55','c00','c56','n00',//2
'c00','l68','c00','l68','c00','n00',//3
'c53','c00','c54','c00','c53','n00',//4
]
}

}