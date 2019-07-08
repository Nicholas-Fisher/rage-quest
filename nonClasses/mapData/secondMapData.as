public var secondMapData:Object = {
	
// introduce new enemy
a0_3: {
objectArray: [{id: 'InsanityWolf', lvl: 2, pos: [3,0]}, {id: 'InsanityWolf', lvl: 1, pos: [5,1]}, {id: 'Judgment', lvl: 3, pos: [4,2], conversation:'judgment_ig'}, {id: 'InsanityWolf', lvl: 2, pos: [2,3]}],
locked: true, heroPos: [1,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'h39','m37','m49','c33','c32','n00',//0
'h38','c47','c43','c34','c31','c32',//1
'n00','c00','c33','l40','c33','c31',//22
'n00','c32','c45','c31','c44','m51',//3
'n00','n00','n00','c32','m50','m52',//4
]
},
// introduce new enemy
a0_2: {
objectArray: [{id: 'Scumbag', lvl: 3, pos: [4,2], conversation: 'scumbag_ig'}, {id: 'Scumbag', lvl: 3, pos: [2,0]}, {id: 'Scumbag', lvl: 3, pos: [0,4]}],
locked: true, heroPos: [2,2],
tileMap: [/*
/*
'000','001','002','003','004','005'*/
'h51','h52','c43','m49','m50','n00',//0
'h38','c48','c00','l40','m37','n00',//1
'c32','c33','c00','c31','c00','n00',//2
'c00','l40','c00','l40','c33','n00',//3
'c00','c00','c31','c45','c00','n00',//4
]
},
// introduce new enemy
a0_1: {
objectArray: [{id: 'Penguin', lvl: 3, pos: [2,1]}, {id: 'Penguin', lvl: 3, pos: [2,2], conversation:'penguin_ig'}, {id: 'Penguin', lvl: 3, pos: [2,3]}],
locked: true, heroPos: [0,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'h35','h39','c47','c43','c33','n00',//0
'h36','c48','c00','l40','c44','n00',//1
'c46','c00','c31','c00','c00','n00',//2
'm49','c34','c00','l40','c32','n00',//3
'n00','m50','c45','c00','c00','n00',//4
]
},
// introduce new enemy
a0_0: {
objectArray: [{id: 'InsanityWolf', lvl: 3, pos: [2,0]}, {id: 'InsanityWolf', lvl: 3, pos: [2,4]}, {id: 'InsanityWolf', lvl: 3, pos: [0,2], conversation: 'insane_ig'}],
locked: false, heroPos: [4,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'm37','m49','c31','c43','c34','n00',//0
'm38','c48','c00','l40','c00','n00',//1
'c47','c34','c31','c32','c00','n00',//2
'c46','c33','c00','l40','c44','n00',//3
'n00','c45','c31','c34','c33','n00',//4
]
},

//---------------------------------------------------------New Col

a1_3: {
objectArray: [{id: 'InsanityWolf', lvl: 5, pos: [3,1], conversation:'comments_ig'}, {id: 'Penguin', lvl: 5, pos: [3,3]}],
locked: true, heroPos: [1,2],
popUp: {title: "Caution", subtitle: "This battlefield contains crappy comments!", 
description: "This sector has typical crappy Internet comments littered throughout (inspired by real comments!). Their insidious nature causes them to periodically burn Zye and allied summons if they're nearby when the comment's fuse runs out. Watch out, they're more damaging than you'd think."},
tileMap: [/*
'000','001','002','003','004','005'*/
'h38','c33','c94','c43','m51','n00',//0
'c47','c34','c00','c33','c00','n00',//1
'c93','c00','l40','c00','c93','n00',//2
'c00','c31','c00','c32','c44','n00',//3
'm50','c00','c94','c45','m52','n00',//4
]
},

a1_1: {
objectArray: [],
locked: true, heroPos: [0,4], isObstacleCourse: true,
popUp: {title: "Minigame", subtitle: "Navigate to the goal.", 
description: "You have three different movement abilities. Use them to navigate the minefield of crappy Internet comments and reach the goal."},
tileMap: [
/*
'000','001','002','003','004','005'*/
'c101','c043','c000','m051','c105','n000',//0
'c033','l040','c034','l040','c033','n000',//1
'c100','l042','c101','l042','c044','n000',//2
'c046','l042','c000','l042','c032','n000',//3
'c032','m050','c102','c045','c101','n000',//4

]
},

a1_0: {
objectArray: [ 
{id: 'Conversationalist', avatar: 'popUpSign', conversation: 'memes', pos: [5,2]}, 
{id: 'Conversationalist', avatar: 'myself', conversation: 'thank_god', pos: [1,0]}, 
{id: 'Conversationalist', avatar: 'Judgment', conversation: 'judgment2', pos: [0,2]}, 
{id: 'Conversationalist', avatar: 'heroCompanion', conversation: 'this_is_the_hive', pos: [2,4]}, 
{id: 'ZipChest', pos: [3,4], item: 'leroyTonicItem', stock: 1},
{id: 'ZipChest', pos: [2,0], item: 'apBoostItem', stock: 1}
], 
locked: true, heroPos: [4,3], isSafe: true, 
tileMap: [/*
'000','001','002','003','004','005'*/
'h38','c48','c43','m50','n00','n00',//0
'h37','c31','c00','c34','m35','n00',//1
'c47','c00','l40','c00','c00','c31',//2
'n00','c32','c00','c33','c00','n00',//3
'n00','n00','c46','c32','n00','n00',//4
]
},

//---------------------------------------------------------New Col

a2_3: {
objectArray: [ 
{id: 'Conversationalist', avatar: 'popUpSign', conversation: 'ghosts_wiki', pos: [0,1]}, 
{id: 'Conversationalist', avatar: 'someguy0', conversation: 'redirect_my_hate', pos: [5,2]}, 
{id: 'Conversationalist', avatar: 'heroCompanion', conversation: 'ghosts', pos: [2,0]}, 
{id: 'Conversationalist', avatar: 'myself', conversation: 'i_feel_for_this_guy', pos: [1,0]}, 
{id: 'ZipChest', pos: [2,4], item: 'bitcoins', stock: 50},
{id: 'ZipChest', pos: [5,0], item: 'apBoostItem', stock: 1}
], 
locked: true, heroPos: [0,2], isSafe: true, 
tileMap: [/*
'000','001','002','003','004','005'*/
'h50','c47','c31','m37','h39','c43',//0
'c48','c00','c32','c33','c00','c44',//1
'c33','c00','l40','l41','c34','c00',//2
'c46','c31','l42','c47','c00','c31',//3
'n00','c00','c00','c45','n00','n00',//4
]
},

a2_1: {
objectArray: [{id: 'ZipChest', pos: [5,2], item: 'bitcoins', stock: 200},
{id: 'Conversationalist', avatar: 'myself', conversation: 'so_many_tries', pos: [5,3]}], 
locked: true, heroPos: [0,2], isSafe: true, 
tileMap: [/*
'000','001','002','003','004','005'*/
'n00','n00','t38','t39','h51','h52',//0
'm50','h49','h37','h35','m50','h36',//1
'c46','c34','c45','c33','c32','c44',//2
'n00','n00','n00','n00','n00','c32',//3
'n00','n00','n00','n00','n00','n00',//4
]
},

//---------------------------------------------------------New Col

a3_3: {
objectArray: [{id: 'YoutubeComment', lvl: 4, pos: [0,0]}, {id: 'Malware', lvl: 4, pos: [4,4]}, {id: 'InsanityWolf', lvl: 3, pos: [4,0]}, {id: 'Scumbag', lvl: 3, pos: [0,4]}],
locked: true, heroPos: [2,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'c47','m50','c95','m51','c43','n00',//0
'c33','c98','c31','c98','c00','n00',//1

'n00','c32','c00','c33','n00','n00',//2
'm52','c98','c34','c98','c44','n00',//3
'c46','c31','c96','m49','c00','n00',//4
]
},

//---------------------------------------------------------New Col

a4_3: {
objectArray: [{id: 'Malware', lvl: 3, pos: [1,1]}, {id: 'Scumbag', lvl: 3, pos: [3,1]}, {id: 'Judgment', lvl: 4, pos: [3,3]}],
locked: true, heroPos: [0,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'h35','h51','c00','c43','m50','n00',//0
'h36','c00','c00','c32','m49','n00',//1
'c47','c33','c93','c31','c44','n00',//2
'n00','c46','c34','c00','n00','n00',//3
'n00','n00','c45','m52','n00','n00',//4
]
},

a4_2: {
objectArray: [{id: 'Penguin', lvl: 3, pos: [3,1]}, {id: 'Scumbag', lvl: 3, pos: [3,4]}, {id: 'Bloatware', lvl: 3, pos: [1,4]}, {id: 'Judgment', lvl: 3, pos: [4,2]}],
locked: true, heroPos: [1,2],
tileMap: [/*
/*
'000','001','002','003','004','005'*/
'h35','c93','m50','m51','n00','n00',//0
'h36','c47','c98','c43','c33','c96',//1
'm52','c32','c34','l40','c44','c31',//2
'c94','c31','c98','c00','c97','n00',//3
'm49','c46','c45','c00','n00','n00',//4
]
},

a4_1: {
objectArray: [{id: 'Penguin', lvl: 3, pos: [1,1]}, {id: 'Penguin', lvl: 3, pos: [4,4]}, {id: 'Judgment', lvl: 3, pos: [4,1]}],
locked: true, heroPos: [1,4], lossCondition: GV.TIME_OUT,
popUp: {title: "Special Battle", subtitle: "Defeat your enemies in under 15 actions.", 
description: "To be victorious, you have to defeat your enemies by, or on, your 15th action. It\'s all about offense over defense, so go hot and heavy."},
tileMap: [/*
'000','001','002','003','004','005'*/
'h37','h36','h35','m51','n00','n00',//0
'h38','c48','c00','c00','c43','n00',//1
'h39','c32','c33','l40','c44','n00',//2
'm50','c31','m49','c31','c00','n00',//3
'm52','c46','c00','c45','c32','n00',//4
]
},

a4_0: {
objectArray: [ 
{id: 'Conversationalist', avatar: 'popUpSign', conversation: 'scumbag_wiki', pos: [3,0]}, 
{id: 'Conversationalist', avatar: 'Scumbag', pos: [4,0]}, 
{id: 'Conversationalist', avatar: 'Judgment', conversation: 'judgment', pos: [5,2]}, 
{id: 'Conversationalist', avatar: 'eggplant', pos: [5,3]}, 
{id: 'ZipChest', pos: [1,0], item: 'bitcoins', stock: 50},
{id: 'ZipChest', pos: [3,4], item: 'apBoostItem', stock: 1}
], 
locked: true, heroPos: [0,2], isSafe: true,
tileMap: [/*
'000','001','002','003','004','005'*/
'h39','c47','m35','c43','c32','n00',//0
'm51','c32','c00','c34','c00','n00',//1
'c46','c33','l40','l41','c33','c44',//2
'n00','c34','c00','c31','c00','c31',//3
'n00','m49','c00','c45','m52','n00',//4
]
},

//---------------------------------------------------------New Col


a5_3: {
objectArray: [ 
{id: 'Conversationalist', avatar: 'Penguin', conversation: 'is_he_talking_to_me', pos: [4,2]},
{id: 'Conversationalist', avatar: 'Penguin', conversation: 'is_he_talking_to_him', pos: [3,3]},
{id: 'Conversationalist', avatar: 'Penguin', conversation: 'those_guys_are_so_weird', pos: [2,1]},
{id: 'ZipChest', pos: [4,1], item: 'catGifsItem', stock: 3}
], 
locked: true, heroPos: [2,2], isSafe: true, 
tileMap: [/*
'000','001','002','003','004','005'*/
'n00','h39','h37','m51','n00','n00',//0
'n00','h36','c46','c00','c44','n00',//1
'n00','m49','c34','c00','c32','n00',//2
'n00','n00','c45','c33','n00','n00',//3
'n00','n00','n00','n00','n00','n00',//4
]
},

a5_2: {
objectArray: [{id: 'Scumbag', lvl: 3, pos: [3,0]}, {id: 'Scumbag', lvl: 3, pos: [3,4]}, {id: 'Bloatware', lvl: 3, pos: [4,2]}],
locked: true, heroPos: [2,2], lossCondition: GV.TIME_OUT,
tileMap: [/*
'000','001','002','003','004','005'*/
'n00','n00','n00','c43','n00','n00',//0
'n00','n00','m37','c32','m51','n00',//1
'n00','c94','c47','c33','c44','c94',//2
'n00','n00','m49','c31','m50','n00',//3
'n00','n00','n00','c46','n00','n00',//4
]
},

a5_1: {
objectArray: [{id: 'InsanityWolf', lvl: 4, pos: [4,1]}, {id: 'Penguin', lvl: 4, pos: [1,1]}, {id: 'Malware', lvl: 4, pos: [4,3]}, {id: 'Spambot', lvl: 4, pos: [1,3]}],
locked: true, heroPos: [2,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'm35','c94','c43','c95','c93','n00',//0
'm36','c31','c33','c00','c00','n00',//1
'n00','c94','c00','c32','c93','n00',//2
'n00','c34','c31','c31','c44','m51',//3
'n00','c94','c95','c45','c93','m52',//4
]
},

a5_0: {
objectArray: [{id: 'InsanityWolf', lvl: 4, pos: [0,0]}, {id: 'InsanityWolf', lvl: 4, pos: [0,4]}, {id: 'Penguin', lvl: 3, pos: [5,0]}, {id: 'Penguin', lvl: 3, pos: [5,4]}, {id: 'Judgment', lvl: 4, pos: [3,2]}],
locked: true, heroPos: [1,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'c48','c98','c31','c00','c43','c00',//0
'c00','c00','l40','c96','c00','c31',//1
'm49','c97','l42','c32','l40','c00',//2
'c47','c34','c00','c33','m51','c44',//3
'c46','c98','c45','c00','c00','c00',//4
]
},


//---------------------------------------------------------New Col

//ALPHA AND OMEGA

a6_0: {
objectArray: [{id: 'OmegaPenguin', lvl: 1, pos: [4,3]}, {id: 'AlphaWolf', lvl: 1, pos: [4,1], conversation:'alphawolf_ig'}],
locked: true, heroPos: [1,2], boss: true, oneTimeFight: true,
popUp: {title: "Boss Fight", subtitle: "The Alpha & Omega: Who would of thunk it?", 
description: "The Alpha Wolf was insane and dominant enough to become the pack leader of all the insanity wolves. The Omega Penguin was so socially awkward that he was shunned by all of the other penguins. They're the duo that no one would have expected. \n\nThe Omega Penguin will keep his distance from you and periodically heal the Alpha Wolf if he's nearby. The Alpha Wolf will relentlessly hunt you down."},
afterBattleFunc: 'unlock71in1',
tileMap: [/*
'000','001','002','003','004','005'*/
'n00','m49','c97','c43','n00','n00',//0
'n00','c47','c31','c34','c33','n00',//1
'n00','c46','c32','c00','c44','n00',//2
'n00','m52','c00','c31','c00','n00',//3
'n00','n00','c33','c45','m51','n00',//4
]
},


//---------------------------------------------------------New Col


a7_3: {
objectArray: [{id: 'Penguin', lvl: 5, pos: [1,4]}, {id: 'Malware', lvl: 5, pos: [2,2]}, {id: 'Bloatware', lvl: 5, pos: [2,3]}, {id: 'InsanityWolf', lvl: 5, pos: [4,3]}, {id: 'Spambot', lvl: 5, pos: [3,0]}],
locked: true, heroPos: [1,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'c49','c47','c34','c43','c00','c96',//0
'c00','c00','l40','c00','c00','c34',//1
'c46','c32','c00','c31','l40','c44',//2
'c00','l40','c00','c00','c33','c00',//3
'c95','c33','c00','c45','c31','n00',//4
]
},

a7_2: {
objectArray: [{id: 'InsanityWolf', lvl: 5, pos: [1,1]}, {id: 'InsanityWolf', lvl: 5, pos: [1,3]}, {id: 'Judgment', lvl: 7, pos: [1,0]}, {id: 'InsanityWolf', lvl: 5, pos: [2,0]}, {id: 'InsanityWolf', lvl: 5, pos: [4,0]}],
locked: true, heroPos: [5,4],
tileMap: [/*
'000','001','002','003','004','005'*/
'n00','c48','c00','c43','c31','c00',//0
'n00','c46','c34','c00','c33','c00',//1
'n00','c00','c44','l40','c00','c00',//2
'n00','c33','c31','c00','c32','c44',//3
'n00','m49','c45','c00','c00','c00',//4
]
},

a7_1: {
objectArray: [{id: 'Bloatware', lvl: 5, pos: [1,1]}, {id: 'Judgment', lvl: 5, pos: [3,2]}, {id: 'Bloatware', lvl: 5, pos: [4,4]}, {id: 'Judgment', lvl: 5, pos: [5,1]}],
locked: true, heroPos: [2,3],
tileMap: [/*
'000','001','002','003','004','005'*/
'h35','h39','m50','n00','n00','n00',//0
'm37','c47','c00','m52','c43','c44',//1
'n00','c00','m49','c33','m51','c00',//2
'n00','c46','c31','l40','c00','c00',//3
'n00','m50','c00','c32','c45','n00',//4
]
},

a7_0: {
objectArray: [ 
{id: 'Conversationalist', avatar: 'CourageWolf', pos: [5,2]}, 
{id: 'Conversationalist', avatar: 'heroCompanion', conversation: 'too_long', pos: [1,2]}, 
{id: 'Conversationalist', avatar: 'InsanityWolf', conversation: 'my_brother', pos: [3,4]}, 
{id: 'Conversationalist', avatar: 'Penguin', conversation: 'alpha_and_omega', pos: [3,0]}, 
{id: 'ZipChest', pos: [2,1], item: 'bitcoins', stock: 50},
{id: 'ZipChest', pos: [5,4], item: 'bitcoins', stock: 50},
], 
locked: true, heroPos: [0,4], isSafe: true, 
tileMap: [/*
'000','001','002','003','004','005'*/
't50','h51','h52','c43','m39','m49',//0
'h36','h37','c48','c31','l40','m38',//1
'h35','c47','c00','c00','l42','c44',//2
'c00','c34','c00','c32','c31','c33',//3
'c46','c00','c33','c45','n00','c00',//4
]
},


//---------------------------------------------------------New Col


a8_3: {
objectArray: [{id: 'HiveMind', lvl: 1, pos: [2,2], conversation: 'hivemind_ig'}],
locked: true, heroPos: [1,2], boss: true, oneTimeFight: true, music: 'hiveMind', afterBattleFunc: 'speakForMyselfAchievement',
popUp: {title: "Boss Fight", subtitle: "Hive Mind: It is legion.", 
description: "Does social media give us all a voice, or does it just make us all say the same thing? Probably a little of both." + bossInfoString('HiveMind')},
tileMap: [/*
'000','001','002','003','004','005'*/
'h38','c00','c93','c43','m50','n00',//0
'c46','c00','c34','c00','c31','n00',//1
'c94','c31','c33','c34','c94','n00',//2
'c32','c00','c31','c32','c44','n00',//3
'c31','c45','c93','c33','m52','n00',//4
]
},

a8_2: {
objectArray: [{id: 'Scumbag', lvl: 5, pos: [3,4]}, {id: 'Scumbag', lvl: 5, pos: [2,0]}, {id: 'InsanityWolf', lvl: 5, pos: [3,2]}, {id: 'InsanityWolf', lvl: 5, pos: [0,3]}, {id: 'Judgment', lvl: 5, pos: [5,1]}],
locked: true, heroPos: [1,2],
tileMap: [/*
'000','001','002','003','004','005'*/
'h35','c48','c00','m51','m50','n00',//0
'h37','c46','c00','l40','c43','c00',//1
'c47','c00','c32','c00','c33','c44',//2
'c34','c31','m49','c00','c97','n00',//3
'n00','n00','n00','c34','c45','n00',//4
]
},

a8_0: {
objectArray: [{id: 'Penguin', lvl: 3, pos: [2,1]}, {id: 'Penguin', lvl: 3, pos: [2,2]}, {id: 'Penguin', lvl: 3, pos: [2,3]}],
locked: true, heroPos: [0,2], lossCondition: GV.TIME_OUT, specialUnlockCondition: true,
tileMap: [/*
'000','001','002','003','004','005'*/
'n00','n00','n00','n00','n00','n00',//0
'h37','c47','c00','c32','c43','c00',//1
'c46','c00','c33','c00','l40','c44',//2
'm51','c34','c45','c00','c32','c00',//3
'n00','n00','n00','n00','n00','n00',//4
]
},

//---------------------------------------------------------New Col

a9_3: {
objectArray: [ 
{id: 'Conversationalist', avatar: 'accessPointClean', pos: [5,2]}, 
{id: 'Conversationalist', avatar: 'heroCompanion', conversation: 'tweet_broadcast', pos: [0,1]}, 
{id: 'Conversationalist', avatar: 'jaysTweet', conversation: 'jays_tweet', pos: [3,3]},
{id: 'ZipChest', pos: [0,3], item: 'bitcoins', stock: 50},
], 
locked: true, heroPos: [0,2], isSafe: true, 
tileMap: [/*
'000','001','002','003','004','005'*/
'n00','n00','n00','n00','n00','n00',//0
'c47','m52','m36','m37','c43','m52',//1
'c46','c00','c34','c31','c32','c44',//2
'c45','c33','c32','c45','m52','m50',//3
'n00','n00','n00','n00','n00','n00',//4
]
},

a9_0: {
objectArray: [],
locked: true, heroPos: [0,4], isObstacleCourse: true,
popUp: {title: "Minigame", subtitle: "Navigate to the goal.", 
description: "You have three different movement abilities. Use them to navigate the minefield of crappy Internet comments and reach the goal."},
tileMap: [
/*
'000','001','002','003','004','005'*/
'n000','n000','n000','n000','n000','n000',//0
'n000','n000','n000','n000','c047','c105',//1
'n000','n000','n000','h051','c102','m049',//2
'n000','n000','h050','h037','c032','n000',//3
'c046','c045','c100','c031','c101','n000',//4
]
},

//---------------------------------------------------------New Col

a10_0: {
objectArray: [{id: 'InsanityWolf', lvl: 5, pos: [3,0]}, {id: 'InsanityWolf', lvl: 5, pos: [3,4]}, {id: 'InsanityWolf', lvl: 5, pos: [5,2]},
{id: 'GenericTarget', avatar: 'CourageWolf', lvl: 5, pos: [3,2], isProtectee: true, conversation:'i_do_not_fear_death_ig'}
],
locked: true, heroPos: [0,2], lossCondition: GV.PROTECTION,
popUp: {title: "Special Battle", subtitle: "Protect the target.", 
description: "To be victorious, you have to defeat your enemies before they kill their target."},
tileMap: [/*
'000','001','002','003','004','005'*/
'h51','h39','h52','c43','n00','n00',//0
'h38','c47','c00','c00','c44','n00',//1
'c46','c00','c33','c32','c00','c00',//2
'n00','c31','c00','c00','c34','n00',//3
'n00','n00','n00','c45','m49','n00',//4
]
},

//---------------------------------------------------------New Col

a11_0: {
objectArray: [ 
{id: 'Conversationalist', avatar: 'CourageWolf', conversation: 'courage_wolf_gauntlet_complete', pos: [4,2]}, 
{id: 'ZipChest', pos: [4,1], item: 'bitcoins', stock: 50},
{id: 'ZipChest', pos: [4,3], item: 'bitcoins', stock: 50},
], 
locked: true, heroPos: [1,2], isSafe: true, 
tileMap: [/*
'000','001','002','003','004','005'*/
'n00','n00','n00','n00','n00','n00',//0
'n00','n00','m37','m51','c48','n00',//1
'n00','c46','c45','c33','c44','n00',//2
'n00','n00','n00','m49','c32','n00',//3
'n00','n00','n00','n00','n00','n00',//4
]
}

}