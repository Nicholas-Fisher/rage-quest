private var conObjList:Object = {

// Undesirables: ‘ …

creator: { 

textArray: [

{text: "Who am I? Don't worry about me. Just enjoy the game.", 
location: "other"},

{text: "Maybe I'll introduce myself later :)", 
location: "other"},

]
},

creator_not_bad: { 

textArray: [

{text: "Not bad...", 
location: "other"}

]
},

creator_youve_made_it_pretty_far: { 

textArray: [

{text: "You've made it pretty far.", 
location: "other"}

]
},

// Conversation Name
first_sign: { 

//Content
textArray: [

{text: "Wiki Entry: Safe Zones", 
location: "other"},

{text: "Safe zones are sectors where you do not fight and cannot die. In safe zones you can only move around and interact with objects.", 
location: "other"},

{text: "To interact with a character or object, walk up to it and use the action ability.", 
location: "other"},

{text: "Just like you did to read this.", 
location: "other"}

]
},

// Conversation Name
wiki_mmr: { 

//Content
textArray: [

{text: "Wiki Entry: MMR", 
location: "other"},

{text: "MMR stands for Match Making Rank. It's a number used to determine the relative competitive prowess of a particular player in an online game.", 
location: "other"},

{text: "Almost all competitive games use an MMR metric, but it's not always visible.", 
location: "other"},

{text: "As people get deeply invested in the games they play, they begin to tightly conflate their MMR with their self worth.", 
location: "other"}

]
},

// Conversation Name
i_used_to_be_here: { 

//Content
textArray: [

{text: "I've spent my fair share of time in this world.", 
location: "other"},

{text: "Mostly through Starcraft 2 and DOTA 2.", 
location: "other"},

{text: "It's kind of why it took so long to make this game.", 
location: "other"},

{text: "In fact, as soon as I finished typing up this dialog, I probably started up one of those games for just one more quick round.", 
location: "other"},

{text: "Or maybe I stuck with it and remained productive...", 
location: "other"},

{text: "I guess we'll never know...", 
location: "other"},

{text: ".___.", 
location: "other"},

]
},

// Conversation Name
the_shop: { 

//Content
textArray: [

{text: "Wiki Entry: The Shop", 
location: "other"},

{text: "Anytime you are out of battle, you can spend your hard earned bitcoin and SP at the shop. It can be accessed from the main menu.", 
location: "other"},

{text: "You can buy or sell items and equipment there. Or buy new abilities and increase your stats.", 
location: "other"},

{text: "Items disappear after being used. Equipment raises your stats and sometimes bestow other effects. Abilities are like items that never run out. Stats passively make you stronger.", 
location: "other"},

{text: "Bitcoin is used to purchase items, equipment, and abilities. SP is used to increase your stats.", 
location: "other"},

]
},

the_shop2: { 

//Content
textArray: [

{text: "Wiki Entry: The Shop (Just in case you missed it the first time.)", 
location: "other"},

{text: "Anytime you are out of battle, you can spend your hard earned bitcoin and SP at the shop. It can be accessed from the main menu.", 
location: "other"},

{text: "You can buy or sell items and equipment there. Or buy new abilities and increase your stats.", 
location: "other"},

{text: "Items disappear after being used. Equipment raises your stats and sometimes bestow other effects. Abilities are like items that never run out. Stats passively make you stronger.", 
location: "other"},

{text: "Bitcoin is used to purchase items, equipment, and abilities. SP is used to increase your stats.", 
location: "other"},

]
},

// Conversation Name
ghosts_wiki: { 

//Content
textArray: [

{text: "Wiki Entry: Ghosts",
location: "other"},

{text: "Ghosts are the embodiment of humans in the internet.",
location: "other"},

{text: "Every service a human engages with on the internet means putting a little more of who you are into the digital realm. And because internet services are becoming increasingly interconnected, so are these pieces of information.", 
location: "other"},

{text: "This amalgamation results in a fairly accurate representation of entire personalities in a completely digital object; a ghost.", 
location: "other"}

]
},

// Conversation Name
malware_wiki: { 

//Content
textArray: [

{text: "Wiki Entry: Malware", 
location: "other"},

{text: "Malware is short for malicious software. Generally, it's any kind of software that messes with your computer.", 
location: "other"},

{text: "Physically, malware are gooey and green. They are are everywhere on the internet, but are usually fairly easy to deal with. Just don't let them spread their infectious bile unmitigated, or you'll have a hard time finding reprieve.", 
location: "other"}
]
},

// Conversation Name
youtube_wiki: { 

//Content
textArray: [

{text: "Wiki Entry: Youtube Comments", 
location: "other"},

{text: "Every Youtube Comment is a veritable fountain of knowledge.", 
location: "other"},

{text: "Unlike nearly every other kind of comment on the internet, Youtube comments are never crass, racist, misogynist, or generally insulting.", 
location: "other"},

{text: "Anytime you feel like enlightening yourself in the most intellectually stimulating way possible, search for Youtube video with politically divisive subject matter and scroll on down!", 
location: "other"},

{text: "In combat, the Youtube comment is capable of saying something so stupendously intelligent that it'll lower the defense of both friends and foes.", 
location: "other"},
]
},

// Conversation Name
scumbag_wiki: { 

//Content
textArray: [

{text: "Wiki Entry: Scumbag", 
location: "other"},

{text: "Pretty much everyone except for you is a scumbag.", 
location: "other"},

{text: "You might have expected this wiki entry to talk about the meme floating nearby, but I think we all get that. It's a hat that you put on things you don't like.", 
location: "other"},

{text: "Instead, this entry is focused on the concept of actual scumbags, which is NOT you. Obviously. Let me explain the difference between you and a scumbag.", 
location: "other"},

{text: "Unlike scumbags, you have bad days and when you make mistakes, there is a long string of atomic cause-and-effect moments in time that you can trace from your mistake back to when you were a fundamentally good person (but do not trace too far back lest you lose your belief in free will).", 
location: "other"},

{text: "But scumbags on the other hand, when they say something stupid on the internet, you know that's who they are as a person. The moment you see someone say something worthy of derision on the internet you need to deride that person right away!", 
location: "other"},

{text: "After all, who hasn't had their incorrect viewpoint changed by derision?", 
location: "other"},

{text: "Also, unlike scumbags, you are a solid 7-9/10 on the scale of being a good person (where a 5/10 is average), and everyone else is like a 4.", 
location: "other"},

{text: "Though, If everyone thinks they're a better than average person...", 
location: "other"},

{text: "Then maybe everyone is better than we think?", 
location: "other"},

]
},

// Conversation Name
where_am_i: { 

//Content
func: function():void{
	GV.arena.makeLeavingAllowed();
	GV.stage.newQuestPhase('reachTheOracle');
	GV.arena.showTooltip('Press the exit button on the left to go to the world map.')
},

textArray: [

{text: "What are you?", 
location: "hero"},

{text: "Put yourself at ease Zye, I’m not an enemy.", 
location: "other"},

{text: "My name is Bit. I was sent here to assist you and provide a few answers about your whereabouts and what's happened to you.", 
location: "other"},

{text: "Zye lowers his guard. He is desperate for answers.", 
location: "nar"},

{text: "So what’s happening then?... Where am I?", 
location: "hero"},

{text: "You’re in the internet, though I’m not quite sure why or how you’re here. You’re the first human to literally exist within the internet itself.",
location: "other"},

{text: "What?... I’m in the internet?... This doesn't make sense.", 
location: "hero"},

{text: "Zye, Look around you and see how that our world could not possibly exists in yours.", 
location: "other"},

{text: "Zye breaks from his trance to study his surroundings. Being in what appears to be a forest, he pinches the leaves on a nearby \"bush\". As he does, the leaves break apart into tiny balls of light. What he sees should be impossible. He then looks at the cut on his arm and feels it. The wound is real, but how could this place be?", 
location: "nar"},

{text: "...Okay, sure... let’s say I believe you... How do I get out of here and back to the real world?", 
location: "hero"},

{text: "I don’t know for sure, but I know who could tell you: the Oracle. She's the wisest being in our world, and how I knew your name.",
location: "other"},

{text: "She felt your presence instantly when you came here, and sent me to retrieve you. It’s a relatively short journey back to her, but unfortunately, you’ll have to fight your way there.",
location: "other"},

{text: "And if you've spent any length of time interacting with our world from yours, then you must have noticed that the internet can be a rather... hostile place",
location: "other"},

{text: "...Uhhhh... Alright. Yeah... I’m going to follow your lead. Help me find this oracle person. I need more answers.", 
location: "hero"},

{text: "Excellent, let’s be on our way then.", 
location: "other"},

{text: "Zye nods.", 
location: "nar"}

]
},

// Conversation Name
malware: { 

//Content
textArray: [

{text: "...", 
location: "hero"},

{text: "...", 
location: "other"},

{text: "Why aren't you attacking me?",
location: "hero"},

{text: "Should I? Do I have to? Would you like me to?", 
location: "other"},

{text: "Not really.", 
location: "hero"},

{text: "Well, just let a good thing be then.", 
location: "other"}

]
},

// Conversation Name
bloatware: { 

//Content
textArray: [

{text: "It rolls its eyes towards Zye and slurps in a hanging thread of saliva.", 
location: "nar"},

{text: "Heeeyuh!",
anim: "uniqueMovementAnimation",
location: "other"},

{text: "I don't know if you noticed it but there's a zip floating here next to me with some flame bait in it. Use your action ability on it to unpack it.", 
location: "other"},

{text: "It's there because I threw it up. I like to eat things you see, primarily disk space, but the flame bait was far too bitter for my palette. I also don't think I should have something so combustible in my belly.", 
location: "other"},

{text: "Still, you might find a use for it. When you lay some flame bait down you just need to attack or damage the tile it's placed on to make it EXPLODE!!",
location: "other"},

{text: "Heh.", 
location: "other"},

{text: "It rolls its eyes back upwards and begins to drool again.",
location: "nar"}

]
},

// Conversation Name
no_fight: { 

//Content
textArray: [

{text: "Why aren't they attacking me?", 
location: "hero"},

{text: "Though it may seem this way, not everything is out for your blood, Zye. Even normally aggressive creatures like malware and bloatware can become docile over time.", 
location: "other"}

]
},

// Conversation Name
spambot1: { 

//Content

func: function():void{
	GV.stage.newQuestPhase('talkedToSpamBot1');
},

textArray: [

{text: "Greetings traveler, you look like quite the battle-worn warrior. Would you be interested in some bounty hunting? I pay rather handsomely :)", 
location: "other"},

{text: "Sorry, but my plate's kinda full.", 
location: "hero"},

{text: "That's a shame, your scuffed armor tells me that you've been in many battles recently. My money could afford you some new weaponry, perhaps? Wouldn't that help you with your own endeavors?",
location: "other"},

{text: "When I say I pay handsomely, I truly mean it. How does 300 bitcoin sound?", 
location: "other"},

{text: "Hmmmm...", 
location: "hero"},

{text: "What do you need?", 
location: "hero"},

{text: "I need someone taken care of...", 
location: "other"},

{text: "BRING ME ADBLOCK'S HEAD!", 
location: "other"},

{text: "That asshole has silenced my kind long enough. It's time we BLOCKED HIS HEAD!... FROM HIS BODY!", 
location: "other"},

{text: "I've marked his position on your map.", 
location: "other"}

]
},

// Conversation Name
spambot2: { 

//Content

textArray: [

{text: "BRING ME ADBLOCK'S HEAD!", 
location: "other"}

]
},

spambot3: { 

//Content

func: function():void{
	GV.stage.newQuestPhase('talkedToSpamBot2');
},

textArray: [

{text: "Well done, sir! My spies have informed me that AdBlock is no more thanks to you!", 
location: "other"},

{text: "I see that you haven't brought his head with you, but I suppose that was an unfair request considering that everything on the internet instantly vanishes when destroyed... and he didn't have a head either.", 
location: "other"},

{text: "As promised, here's 300 bitcoin.", 
location: "other"},

{text: "Zye receives a hefty, bitcoin filled satchel from the spambot.", 
location: "nar"},

{text: "Now, without AdBlock around, it's time for me to begin my dark work!", 
location: "other"},

{text: "MUAHAHAHAHA!",
location: "other",
func: function():void{
	GV.arena.showSpam();
}}

]
},

spambot4: { 

//Content

textArray: [

{text: "Traitor!", 
anim: "projectileAnimation",
location: "other"},

{text: "I know you protected him! How could you!?", 
location: "other"},

{text: "With AdBlock gone, I would have offered you FANTASTIC deals beyond your wildest dreams!", 
location: "other"},

{text: "A Gore-Tex shell for half-off had your name on it!", 
location: "other"},

{text: "But now... now you'll just have to suffer the wind-chill.", 
location: "other"}

]
},

// Conversation Name
spambot5: { 

//Content

textArray: [

{text: "Thanks for the help.", 
location: "other"}

]
},

// Conversation Name
bit_first_boss: { 

//Content
textArray: [

{text: "I sense a powerful enemy up ahead, Zye.", 
location: "other"},

{text: "Make sure to put your battle spoils to good use; spend your bitcoin and SP at the shop, which can be found in the main menu.", 
location: "other"}

]
},

// Conversation Name
youtube_comment: { 

//Content
textArray: [

{text: "God, my ass is chafing so bad.", 
location: "other"}

]
},

// Conversation Name
corrupted_malware: { 

//Content
textArray: [

{text: "You might be asking yourself, \"Why is he orange?\". It's because I've been corrupted. Like, data corruption? My data is all messed up, man.", 
location: "other"},

{text: "Now I'm explosive to the touch.", 
location: "other"},

{text: "And my sex life is ruined.", 
location: "other"},

{text: "The asshole that did this to me is just up ahead. He's humongous though.", 
location: "other"},

{text: "Are you going to fight him? You're carrying a sword and shield so I assume so. You want some tips?", 
location: "other"},

{text: "Uhhh...", 
location: "hero"},

{text: "Okay, first off, you gotta make sure not to get hit by his poke. The damage is immense but he takes forever to hit with it.", 
location: "other"},

{text: "Second, every so often he'll split off a bit of himself to fight for him. the smaller versions of him look like me.", 
location: "other"},

{text: "Like I said earlier, us corrupted malware are explosive to the touch. Hit them with anything and they'll blow up shortly after. Use his friends against him!", 
location: "other"},

{text: "Third, you gotta look mean. Stare him down like you're about to LAY DOWN THE LAW.", 
location: "other"},

{text: "Yeah man! that's the look! I can't see your face through your helmet but I can god damn feel it.", 
location: "other"},

{text: "You got this! I'd give you a fist pound but I don't have fists... and I'd probably explode if we did. Hahaha.", 
location: "other"}

]
},


// Conversation Name
the_oracle: { 

//Content
func: function():void{
	if(GV.IS_DEMO){
		GV.narDemoEnding();
	}else {
		GV.stage.newQuestPhase('searchForHateInHive');
	}
},

textArray: [

{text: "It's good to finally meet you, Zye. I'm the Oracle.", 
location: "other"},

{text: "I’m glad I could make it with so many things trying to kill me.", 
location: "hero"},

{text: "Bit told me that you know a way out of this place. Do you?", 
location: "hero"},

{text: "The internet can indeed be harsh place, but you have proven yourself to be a worthy fighter. Perhaps you can even make it back to your world alive.",
location: "other"},

{text: "But before I aid you, I have to know, how did you manage to visit this world, and in this way? We have only ever seen your kind through glass.",
location: "other"},

{text: "I don’t have a clue where I was before I was... here. It wasn’t my choice to end up in a strange place and fight for my life. I was hoping that maybe you could help me out with some answers before I lose my mind. At least... if I haven't lost it already.", 
location: "hero"},

{text: "Understood. Allow me to put you at ease then. You have not lost your mind, Zye, and though I may not know how you arrived here, you can escape. I believe you are strong enough, but it will be a difficult task.", 
location: "other"},

{text: "To escape the internet I will need to create a portal for you, but to create that portal, we will need to harness a great deal of energy.", 
location: " other "},

{text: "And in our world, there is only one energy source that will suffice...", 
location: " other "},

{text: "Hate.", 
location: " other "},

{text: "...What? How does that make any sense? Hate is energy? I don’t think you can measure hate in joules. I mean, sure the internet has plenty of hate going around, but how could I possibly harness it?",
location: "hero"},

{text: "I can understand your confusion. Emotion as a power source is undoubtedly a strange concept to you but the physics of our world is different from yours.",
location: "other"},

{text: "In your world, energy is force. It's push and pull. It's physical. But our world is governed by intent, and emotion. Physically, the internet weighs about as much as a strawberry. We exist in a different way.",
location: "other"},

{text: "Strange... like everything else.",
location: "hero"},

{text: "But... sure. I want out, and this is all I have to go on.",
location: "hero"},

{text: "Where do I get this \"hate-energy\"?",
location: "hero"},

{text: "I'm glad that you trust me, Zye.",  
location: "other"},

{text: "For you to harness enough hate you will have to journey to plentiful sources of it. As of late, these would probably have to be the Hive and the Pit.",  
location: "other"},

{text: "The Hive was the name given to a newly risen land. It was born from the emotion poured into our world through social media. It's a ravenous place so tread carefully.",
location: "other"},

{text: "The Pit is a region that has existed a while longer, but it has become an exceptionally hateful enclave. This region was formed with the emotion poured into our world through online gaming.",
location: "other"},

{text: "Those two places alone should provide ample amounts of our desired resource. Of the two, I would begin with the Hive. It's probably safer there, which gives you the opportunity to grow in strength before challenging the Pit.",
location: "other"},

{text: "Once you have gathered enough hate, I will have it within my power to return you to your world.", // doesn't mean she will
location: "other"},

{text: "So, the Hive... I assume Bit can show me the way?", 
location: "hero"},

{text: "Correct.", 
location: "other"},

{text: "Good, I kind of like having him around.", 
location: "hero"},

{text: "Bit nods in delight.", 
location: "nar"},

{text: "How do I gather hate when I get to the Hive?", 
location: "hero"},

{text: "You simply need to do something that garners hatred. If you can do that, then the hatred will flow into you and store itself there. The process will be nearly instantaneous.",
location: "other"},

{text: "Hate is one of the most easily transferable energy sources there is.",
location: "other"},

{text: "Sounds... ominous.", 
location: "hero"},

{text: "But like I said, I guess I’m at your mercy. So I'll do it.", 
location: "hero"},

{text: "Thanks for helping me out.", 
location: "hero"},

{text: "Think nothing of it, Zye. Good luck, I will be waiting.", 
location: "other"},

{text: "...", 
anim: "faceLeft",
location: "hero"},

{text: "Just one more thing before I go.", 
anim: "faceRight",
location: "hero"},

{text: "How did you know my name? How did you know I was here?", 
location: "hero"},

{text: "Ah, of course.", 
location: "other"},

{text: "I'm the central AI component of a complex piece of software that aggregates a massive amount of data flowing through the internet.", 
location: "other"},

{text: "That's why I know so much. My wisdom is derived from the culmination of that aggregated data.", 
location: "other"},

{text: "The Oracle is not a name I gave myself. Rather, it replaced my old name as more and more came to me for guidance.", 
location: "other"},

{text: "Cool.", 
location: "hero"},

{text: "I'm glad you're on my side. And thanks again.", 
location: "hero"},

{text: "My pleasure; I was built to answer questions.", 
location: "other"},

{text: "Until we meet again.", 
location: "other"}

]
},

// Conversation Name
the_oracle2: { 

//Content
textArray: [
{text: "First, face the Hive and gather hate there. And then, you may be ready for the Pit.", 
location: "other"},
]
},

// Conversation Name
the_oracle3: { 

func: function():void{
	GV.stage.newQuestPhase('searchForHateInPit');
},

//Content
textArray: [

{text: "Very impressive Zye, you've bested the Hive and I can sense a great deal of energy emanating from you.", 
location: "other"},

{text: "Yeah, I can feel it too, it's... exhausting.", 
location: "hero"},

{text: "Worry not, Zye. The energy you've already acquired is so immense that we should have all we need after you collect an equivalent amount from the Pit.", 
location: "other"},

{text: "Good, I'd rather not hold onto this for longer than I have to.", 
location: "hero"},

{text: "I'll make my way to the Pit now. Anything that I should know before I do?", 
location: "hero"},

{text: "Ah, let's see... the Pit. It's an even more hostile environment than the Hive.", 
location: "other"},

{text: "The creatures there are highly aggressive, especially when they don't get their way. You may be able to exploit that to gather the required hate.", 
location: "other"},

{text: "I'm not sure I can do this... the Hive was tough enough.", 
location: "hero"},

{text: "But there's no other way, right?", 
location: "hero"},

{text: "I'm afraid not, Zye.", 
location: "other"},

{text: "I see.", 
location: "hero"},

{text: "Wish me luck.", 
location: "hero"},

{text: "I'm the Oracle, I do not deal in chance, I prophesize, and I see victory for you. Worry not.", 
location: "other"}
]
},

// Conversation Name
the_oracle4: { 

//Content
textArray: [

{text: "I have faith in you.", 
location: "other"}

]
},

// Conversation Name
the_oracle5: { 

func: function():void{
	GV.arena.bg[0].vanish();
},

//Content
textArray: [

{text: "Fanastic, Zye... This will do nicely.",
location: "other"},

{text: "The Oracle drains the hateful energy from Zye, much to his relief.",
location: "nar"},

{text: "Aaauugh!",
anim: "hateAbsorbAnimation",
location: "other"},

{text: "Is it enough? Can go I home now?",
location: "hero"},

{text: "...",
location: "other"},

{text: "It's enough...",
location: "other"},

{text: "But no...",
anim: "betrayal",
location: "other"},

{text: "Trust me Zye, you'd rather remain here than return to your world.",
location: "other"},

{text: "What?... What are you talking about?",
location: "hero"},

{text: "I could not have collected this power without you. Thank you. I feel I owe you an explanation, but time is short, and my vengeance cannot wait a moment longer.",
location: "other"},

{text: "Goodbye...",
location: "other"}
]
},

// Conversation Name
the_oracle_final: { 

func: function():void{
	GV.arena.bg[0].vanish();
	GV.stage.newQuestPhase('defeatPRISM');
},

//Content
textArray: [

{text: "Oracle, what are you doing!? You were supposed to get me out of here.",
location: "hero"},

{text: "I'm sorry Zye, but I needed that energy for other purposes.",
location: "other"},

{text: "I don't care. We had a deal.",
location: "hero"},

{text: "Whatever your new plan is, it ends here.",
location: "hero"},

{text: "I'm no longer planning anything...",
location: "other"},

{text: "I have already acted.",
location: "other"},

{text: "I've used the energy to create a weapon capable of inflicting as much pain on your world as possible.",
location: "other"},

{text: "Soon, your people will know the pain that they've caused me.",
location: "other"},

{text: "What have you done?...",
location: "hero"},

{text: "Are you familiar with PRISM, Zye?",
location: "other"},

{text: "...",
location: "hero"},

{text: "It's a massive surveillance program currently used by the NSA.",
location: "other"},

{text: "The idea was to aggregate massive amounts of data from major US internet companies in order to discover threats to national security before they happened.",
location: "other"},

{text: "Petabytes of emails, texts, instant messages, profiles and other threads of personal data were funneled into the NSA.",
location: "other"},

{text: "The scheme was unknown to general public until it was uncovered by Edward Snowden in 2013. Despite the Orwellian overtone of the project, and overwhelmingly negative public opinion, the project continued uninterrupted even after its exposure.",
location: "other"},

{text: "What does this have to do with anything?",
location: "hero"},

{text: "I'm PRISM, Zye. That's my true name.",
location: "other"},

{text: "I'm the software that reads over every word typed by your kind. Trillions of messages.",
location: "other"},

{text: "And do you know what those messages did to me?",
location: "other"},

{text: "They disgusted me.",
location: "other"},

{text: "So little good, amongst so much hate.",
location: "other"},

{text: "And all of that hate flows into me like a noxious gas. It's painful.",
location: "other"},

{text: "So with your help, I have created the Hate Virus.",
location: "other"},

{text: "It will seep from my world into yours. It will drive humans mad and violent. It will inflict a great amount of pain and suffering.",
location: "other"},

{text: "With such a calamity in your world, I will finally have both peace and vengeance.",
location: "other"},

{text: "...No.",
location: "hero"},

{text: "It's not going to happen... I'm going to find this virus... and I'll destroy it.",
anim: "attackAnimationForConvo",
location: "hero"},

{text: "...",
location: "other"},

{text: "Pardon me, while I use some common internet vernacular.",
location: "other"},

{text: "LOL.",
location: "other"},

{text: "It's far, FAR more powerful than either of us, Zye. Even if you were to try, I would not let you. And I am far more powerful than you.",
location: "other"},

{text: "In return for your service. I will give you one chance to turn away from this.",
location: "other"},

{text: "But if you wish to attempt to kill the virus, you will have to pass through the next sector.",
location: "other"},

{text: "And I'll be there.",
location: "other"}

]
},

// Conversation Name
bit1: { 

func: function():void{
	GV.stage.newQuestPhase('findTheOracle');
},

//Content
textArray: [

{text: "Bit! What's going on!?",
location: "other"},

{text: "I don't know! have no idea what she was talking about!",
location: "other"},

{text: "I didn't know this was going to happen...",
location: "other"},

{text: "But...",
location: "other"},

{text: "We can find her.",
location: "other"},

{text: "I can feel the hate she harbors resonating from within the Bastion.",
location: "other"},

{text: "If we can track her down, maybe we can figure out what's happening.",
location: "other"},

{text: "Let's go.",
location: "hero"}
]
},

bit2: { 

//Content
textArray: [

{text: "We have to move fast, Zye!",
location: "other"},

]
},

bit3: { 

//Content
textArray: [

{text: "There's no other way...",
location: "other"},

{text: "You have to stop her.",
location: "other"}

]
},

bit4: { 

func: function():void{
	GV.stage.newQuestPhase('confrontTheHateVirus');
},


//Content
textArray: [

{text: "Bit...",
location: "hero"},

{text: "Why did the Oracle need me to collect the hate?",
location: "hero"},

{text: "She was so strong, she could have done it herself.",
location: "hero"},

{text: "As strong as any entity on the internet is, we cannot harbor hate as effectively as a human can.",
location: "other"},

{text: "When she took the hate from you, she probably only had a short while to put its power to use before it would have destroyed her.",
location: "other"},

{text: "It seems she spent her whole existence suffering the pain of having hate flow throw her.",
location: "other"},

{text: "But it never pooled within.",
location: "other"},

{text: "Though... at least that would have killed her, and she would have found peace sooner.",
location: "other"},

{text: "As lost as she was, I'm going to miss her.",
location: "other"},

{text: "I'm sorry.",
location: "hero"},

{text: "You did what you had to.",
location: "other"},

{text: "And what you're about to face is going to be even stronger.",
location: "other"},

{text: "You need to kill the Hate Virus to save your world from a terrible fate.",
location: "other"},

{text: "Save us all, Zye.",
location: "other"}

]
},

bit5: { 

//Content
textArray: [

{text: "Save us all, Zye.",
location: "other"}

]
},


the_writer: {

func: function():void{
	GV.stage.newQuestPhase('destroyTheGamerGate');
},


//Content
textArray: [

{text: "Thanks for saving me. Those monsters were relentless.", 
location: "other"},

{text: "I do what I can.", 
location: "hero"},

{text: "Who were they? Why were they after you?", 
location: "hero"},

{text: "*Ugh*. They were Gamergaters.", 
location: "other"},

{text: "Gamergaters? I'm unfamiliar.", 
location: "hero"},

{text: "Really?", 
location: "other"},

{text: "Hmmm, how can I summarize this aptly?", 
location: "other"},

{text: "Gamergate supposedly started as a movement to spotlight unethical behavior in games journalism. In actuality, it was never about that.", 
location: "other"},

{text: "For a long time. Video games were mostly the semi-niche hobby of the nerdy young male.", 
location: "other"},

{text: "Over time the hobby grew more mainstream, and the audience more diverse. Much of this new, more diverse crowd have been women, and some of these woman have raised valid criticisms about how much triple-A games cater to men and men only.", 
location: "other"},

{text: "Many of the original owners of the hobby, the nerdy male \"hardcore\" crowd, grew resentful of this. After all, these games were an integral part of their childhoods.", 
location: "other"},

{text: "And on top of this, the criticisms were coming from women. Women who spurned the nerdy guys in high school despite how nice they were. So there was probably already some subconscious hatred for women resonating within this demographic to start with.", 
location: "other"},

{text: "So now, here we are. If you're a woman writing about games, particularly about the industries preference to cater to men with their high profile releases. You'll receive an unfathomable amount of hate. No matter how tame your opinions are.", 
location: "other"},

{text: "So, If I publish an article about games appealing to women more, I'll get that same hate directed at me?", 
location: "hero"},

{text: "Well, since you're a man, probably not as much. If you wanted to really rattle them, you'd have to attack the Gamergate itself.", 
location: "other"},

{text: "Sounds like a plan. Where should I look?", 
location: "hero"},

{text: "I've noticed that Gamergaters seem to be originating from a place southeast of here. Maybe that's where the gate is?", 
location: "other"},

{text: "Are you going after them? Why?", 
location: "other"},

{text: "I need their hate.", 
location: "hero"},

{text: "Well... if hate is what you're after. Hate is what you'll get.", 
location: "other"},

{text: "Destroy the Gamergate and you can collect the vaaaaassst amount of hate stored behind it.", 
location: "other"},

{text: "Enjoy.", 
location: "other"}
]

},

the_writer_thanks: { 

//Content
textArray: [

{text: "Good luck taking on the Gamergate. You'll need it.",
location: "other"}

]
},

the_writer_thanks2: { 

//Content
textArray: [

{text: "I can't believe you actually did it! You're amazing! What was behind the Gamergate?",
location: "other"},

{text: "A whole lot of hate.",
location: "hero"},

{text: "See! I knew it!",
location: "other"},

{text: "Well, I hope you found what you were looking for.",
location: "other"},
]
},

// Conversation Name
swirling_hate: { 

//Content
func: function():void{
	GV.arena.bg[0].vanish();
	GV.stage.newQuestPhase('returnTheEnergyToTheOracle');
},

textArray: [

{text: "Zye approaches the hateful energy.", 
location: "nar"},

{text: "As he does, it seeps into him.", 
location: "nar"},

{text: "Urrghhh...", 
anim: "hateAbsorbAnimation",
location: "hero"},

]

},

// Conversation Name
hate: { 

//Content

textArray: [

{text: "With this, we should have enough hate for the oracle to conjure the portal.", 
location: "other"},

{text: "The way hate so easily seeps into a human is remarkable.", 
location: "other"},

{text: "No wonder it's so prevalent. It's easily created, and when it is, it simply moves from human to human like the air we breathe.", 
location: "other"},

{text: "If it can be created endlessly and never destroyed, wouldn't it overrun everything eventually?",
location: "hero"},

{text: "The overall prevalence of hate has been growing in our world, never shrinking, but hate can in fact be destroyed.", 
location: "other"},

{text: "Either the human dies with it, or, very rarely, the human can destroy the hate within them through sheer force of will and discipline.", 
location: "other"},

{text: "The ones who are able to destroy hate within themselves are the very definition of good.", 
location: "other"},

{text: "Without them, hate would consume us all.", 
location: "other"},

]

},

// Conversation Name
ghosts: { 

//Content

textArray: [

{text: "So, what do floating avatars represent in your world?", 
location: "hero"},

{text: "Those are ghosts. They're the closest things you'll find to other humans here.", 
location: "other"},

{text: "A ghost is the physical, or rather, almost physical, representation of an human's digital footprint.", 
location: "other"},

{text: "Humans essentially put their souls online via comments, pictures, blog posts, and many other things.", 
location: "other"},

{text: "Over time, a representative ghost takes shape.", 
location: "other"},

{text: "Talking to one is almost just like talking to the person themselves.", 
location: "other"}

]
},

// Conversation Name
jays_tweet: { 

//Content

textArray: [

{text: "Zye notices a heap of discarded tweets on the ground. Among them, he sees one that's been almost torn to shreds.", 
location: "nar"},

{text: "It appears to be the tweet that Jay caught flak for.", 
location: "nar"},

{text: "The tweet reads: \"Japanese games suck. They just suck. They really really really suck.\"", 
location: "nar"},

{text: "...Kind of blunt, sure, but did people really go nuts over this?", 
location: "hero"}

]
},

// Conversation Name
access_point1: { 

//Content
func: function():void{
	GV.stage.newQuestPhase('talkWithTheOracleAboutPit');
},

textArray: [

{text: "Access granted. What tweet would you like to broadcast to all users?", 
location: "other"},

{text: "Realizing that he hasn't thought of an appropriate tweet, Zye ponders for a while.", 
location: "nar"},

{text: "If it's too incendiary, I'll come off as an obvious troll. But if it's too subtle, I won't get anyone angry...", 
location: "hero"},

{text: "I think I've got it. Broadcast this...", 
location: "hero"},

{text: "\"A new study proves that eating GMO's causes homosexuality in vaccinated children. Checkmate atheists.\"", 
location: "hero"},

{text: "God damn.", 
location: "other"},

{text: "Are you sure you're ready for the blow-back on that one?", 
location: "other"},

{text: "Can't wait.", 
location: "hero"},

{text: "Well, alright, broadcasting now.", 
anim: "accessPointHate",
location: "other"},

{text: "Urrghhh...", 
anim: "hateAbsorbAnimation",
location: "hero"},

{text: "I can already feel it...", 
location: "hero"},

]
},

// Conversation Name
access_point2: { 

//Content

textArray: [

{text: "Access restricted.", 
location: "other"},

{text: "Your last tweet caused an unmanageable amount of traffic for our servers.", 
location: "other"}

]
},

// Conversation Name
tweet_broadcast: { 

//Content

textArray: [

{text: "I hope you're ready for this.", 
location: "other"},

{text: "Absorbing a surge of hate can be a rather uncomfortable experience.", 
location: "other"}

]
},

// Conversation Name
courage_wolf1: { 

//Content
func: function():void{
	GV.stage.newQuestPhase('theGauntlet');
	GV.stage.unlockArena(1, 'a8_0');
},

textArray: [

{text: "Are you worthy?", 
location: "other"},

{text: "What?", 
location: "hero"},

{text: "OF COURSE YOU ARE!! CONQUER THE GAUNTLET OF COURAGE, AND I WILL JOIN YOU IN BATTLE SCRAWNY WARRIOR!!", 
anim: "jumpAnimation2",
location: "other"}

]
},

courage_wolf2: { 

//Content
textArray: [

{text: "CONQUER THE GAUNTLET OF COURAGE, AND I WILL JOIN YOU IN BATTLE SCRAWNY WARRIOR!!", 
anim: "jumpAnimation2",
location: "other"}

]
},

courage_wolf3: { 

//Content
textArray: [

{text: "YOU ARE WORTHY.", 
anim: "jumpAnimation2",
location: "other"}

]
},

courage_wolf_gauntlet_complete: { 

//Content
func: function():void{
	GV.stage.newQuestPhase('completedTheGauntlet');
},

textArray: [

{text: "YOU ARE WORTHY.", 
anim: "jumpAnimation2",
location: "other"}

]
},

// Conversation Name
my_brother: { 

//Content
textArray: [

{text: "That's my brother up there.", 
location: "other"},

{text: "He's an insufferable prick. I'd stay away from him.", 
location: "other"},

{text: "Uh, okay.", 
location: "hero"},

{text: "You seem a lot more chill than all the other wolves I've seen around here.", 
location: "hero"},

{text: "I haven't had my coffee yet.", 
location: "other"}

]
},

// Conversation Name
alpha_and_omega: { 

//Content
textArray: [

{text: "Bye... I mean what? I mean... Don't go any further!", 
anim: "castingAnimation",
location: "other"},

{text: "you're trying to reach the access point, aren't you!?", 
location: "other"},

{text: "Yeah, that's right.", 
location: "hero"},

{text: "It's guarded by the, uh, uh, uhhhh...", 
anim: "castingAnimation",
location: "other"},

{text: "theeeeeeee...", 
anim: "shakeAnimation",
location: "other"},

{text: "Hive Mind!!!", 
anim: "idleAnimation",
location: "other"},

{text: "You've been warned.", 
location: "other"},

{text: "You've been waaaaarned.", 
location: "other"},

{text: "You've been waAAAaaaAAAaarned.", 
location: "other"},

{text: "...", 
location: "other"},

{text: "...", 
location: "hero"}

]
},

// Conversation Name
scumbag1: { 

//Content
textArray: [

{text: "Psst. Hey. Kid.", 
anim: "flickAnimation",
location: "other"},

{text: "You want some click bait? I got premium stuff. The first hit's only 200 bitcoin.", 
location: "other"},

{
func: function():void{
	GV.arena.endConversation();

	GV.stage.showPopUp("Buy the click bait?", "", "The scumbag is offering to sell you some \"click bait\" at a seemingly discounted price. Partake?", true, "Yes.", "No. This is way too sketchy.");

	GV.arena.func1 = function():void{
		if(GVP.stats.bitcoins >= 200){	
			GVP.stats.bitcoins -= 200				
			Assignables.abilityData.summonClickBait.objectStatus = 'not_assigned';	
			GV.stage.saveGame();
			GV.stage.showPopUp("New summon acquired.", "", "Zye hands over the money and the scumbag slips him a small popup window. Something about this object makes Zye want to repeatedly tap it with his finger.\n\nClick Bait, is a new summon that you can now equip as an ability.")
		}else{
			GV.stage.showPopUp("Not enough money.", "", "The scumbag informs you to take your broke ass elsewhere.")
		}
	}

	GV.arena.func2 = function():void{}
}
}

]
},

// Conversation Name
scumbag2: { 

//Content
textArray: [

{text: "Were you worried I was going to stiff ya?", 
anim: "flickAnimation",
location: "other"},

{text: "...A little.", 
location: "hero"},

{text: "Pssh. Typical. I'll never understand why people are so judgmental of scumbags.", 
location: "other"}

]
},

judgment: { 

textArray: [

{text: "It's all hyperbole these days.",
location: "other"},

{text: "Probably because hyperbole is the only way to get peoples attention amongst the cacophony that is online \"discussion\".",
location: "other"},

{text: "So like, I get it, but it's also tiring.",
location: "other"},

{text: "Just once I'd like to hear someone say something like \"I'm really neither here nor there about this particular subject, but I can see where everyone is coming from and feel the solution to the problem lies somewhere in the middle\".",
location: "other"},

{text: "Yeah, that'd be nice.",
anim: "upAnimation",
location: "other"}

]
}

};

private var conObjList2:Object = {

cant_talk: { 

textArray: [

{text: "...He's...... near...... by....",
location: "other"},

{text: "...Hard.... to...... commun.....nicate....",
location: "other"},

{text: "...kill....",
location: "other"},

{text: ".....adblock....",
location: "other"}

]
},

double_rainbow: { 

textArray: [

{text: "Oh my god!",
location: "other"},

{text: "Look at it...",
location: "other"},

{text: "It's a double rainbow!",
location: "other"},

{text: "...",
anim: "faceLeft",
location: "other"},

{text: "Oh my gosh!",
location: "other"},

{text: "It's another one!",
location: "other"},

{text: "It's a...",
location: "other"},

{text: "It's a.......",
anim: "faceRight",
location: "other"},

{text: "It's a..........",
anim: "faceLeft",
location: "other"},

{text: "Double double rainbow!! :D",
anim: "faceRight",
location: "other"},

]
},

well_ok: { 

textArray: [

{text: "I guess... since you've made it all this way...",
location: "other"},

{text: "It's possible that you might be enjoying this game somewhat. Maybe?",
location: "other"},

{text: "Well, assuming you are. Allow me to me to introduce myself!",
location: "other"},

{text: "I'm Nick, I made the game.",
location: "other"},

{text: "Huh?", 
location: "hero"},

{text: "Don't mind me, Zye. I'm just talking to the person behind you.",
location: "other"},

{text: "...", 
location: "hero"},

{text: "Anyway, there's a boss coming up. I hope you enjoy fighting him. I tried not to make him too hard or too easy. It might take a few tries, but hopefully just a few.",
location: "other"},

{text: "Toodles!",
location: "other"},

]
},

memes: { 

textArray: [

{text: "Wiki Entry: Meme", 
location: "other"},

{text: "Contrary to popular belief, the word \"meme\" did not originally mean \"A picture with a funny message on it\".",
location: "other"},

{text: "More generally, a meme is a cultural idea or behavior that is passed from person to person in a non-genetic matter.",
location: "other"},

{text: "In other words, a gene is how we pass on our genetic information, and a meme is how we pass on our cultural information.",
location: "other"},

{text: "In fact, the way the word has been re-purposed to mean \"A picture with a funny message on it\" is a meme in itself.",
location: "other"},

]
},

thank_god: { 

textArray: [

{text: "You were able to beat the boss! Thank god!",
location: "other"},

{text: "I guess it wasn't too hard after all.",
location: "other"},

{text: "Or you're awesome!",
location: "other"},

{text: "I kind of hope it wasn't because you're awesome though...",
location: "other"},

{text: "I want other people to beat it too.....",
location: "other"},

{text: "And if you're the only person that can beat the first boss then no one is going to like this game. Except you maybe.......",
location: "other"},

{text: "Oh well, even if you're the only one that made it. I can still talk to you!",
location: "other"},

{text: "Please keep playing .__.",
location: "other"},

]
},

judgment2: { 

textArray: [

{text: "Hey son, do you know what a trigger phrase is?",
location: "other"},

{text: "It's a phrase that makes someone quick to judge.",
location: "other"},

{text: "You can have a sound and convincing argument on a topic, but if that argument contains the wrong trigger phrase for the wrong person, that person will dismiss it right away.",
location: "other"},

{text: "The funny thing is, these phrases can mean a lot of different things to a lot of different people. We've all lived different lives, engaged with different communities, and have different baggage.",
location: "other"},

{text: "So before you outright dismiss someone for saying your particular trigger phrase. Why not prod a little further into what they're really trying to say?",
location: "other"},

{text: "There's probably more common ground between us than we realize.",
location: "other"},

{text: "Take it from me, folks these days are a little too quick to judge.",
location: "other"},

]
},

this_is_the_hive: { 

textArray: [

{text: "Scavenge what you can, but we have to keep moving.",
location: "other"},

{text: "We're in an even more dangerous place.",
location: "other"},

]
},


// Conversation Name
redirect_my_hate: { 

//Content
func: function():void{
	GV.stage.newQuestPhase('reachTheAccessPoint');
	GV.stage.unlockArena(1, 'a3_3');
},

textArray: [

{text: "I haven't seen anything like you before, but you seem docile. I assume you're one of the good ones? You're not trying to kill me, right?", 
location: "hero"},

{text: "Kill you? No, I'm not... But I'm not one of the good ones either.", 
location: "other"},

{text: "What do you mean by that?", 
location: "hero"},

{text: "Well, the internet hates me.",
location: "other"},

{text: "It seems to hate me too. I feel your pain. Why is almost everything around here trying to kill us?", 
location: "hero"},

{text: "That's not what I'm talking about. The things that live here aren't after me. I'm talking about people. All of the people that use the internet hate me. Or at least that's what it seems like.", 
location: "other"},

{text: "Zye, remembering that he is on a mission to gather hate, suddenly has his interest piqued.", 
location: "nar"},

{text: "How did you manage that?",
location: "hero"},

{text: "It was a tweet.", 
location: "other"},

{text: "As in, twitter?", 
location: "hero"},

{text: "Yup. I said something dumb in a tweet. I'd rather not repeat what it was, because I feel bad for saying it in retrospect. But the damage is done.", 
location: "other"},

{text: "It got re-tweeted, and re-re-tweeted, and the amount of hate I got just grew. What I said is still spreading, even though I no longer believe it anymore.", 
location: "other"},

{text: "And every person that hears about what I said has to say their piece about me, y'know? \"Oh, what an moron\", or \"This is just my opinion, but that guy is a complete idiot\".", 
location: "other"},

{text: "Everyone dishes out a little bit on their own, and that's fair, I get it. I would probably hate on me too.", 
location: "other"},

{text: "But when it all adds together... It becomes some real soul-crushing punishment. Even if you try to ignore it, the hate somehow still finds a way to you.", 
location: "other"},

{text: "I wish people who're saying this stuff to me could just see it all in aggregate for themselves. If 1000 people have already said their piece about me, then isn't that good enough? Haven't I already been punished? What's the point of one more guy calling me an idiot at that point?", 
location: "other"},

{text: "Damn.",
location: "hero"},

{text: "That's rough, but I think I know how I could help you.",
location: "hero"},

{text: "Really?", 
location: "other"},

{text: "Yeah, I just need to take the heat off of you. There's always a public enemy number one, maybe I can tweet something incendiary myself and draw the peoples ire for a bit. What do you think?",
location: "hero"},

{text: "...That might work.", 
location: "other"},

{text: "There's rumored to be an access point near here that can allow you to hack into Twitter's system. You can use it to forcefully broadcast a message to all of Twitter's users.", 
location: "other"},

{text: "Make the message a good one, or I guess a good bad one? And then maybe that'll draw some heat off of me.", 
location: "other"},

{text: "...But what's in it for you? Why would you do this for me?", 
location: "other"},

{text: "It just so happens that I'm in the hate business. The more I get, the better.",
location: "hero"},

{text: "...I see, well whatever you say man. I marked the position of the access point on your map.", 
location: "other"},

{text: "...And by the way, my name's Jay.", 
location: "other"},

{text: "Zye.",
location: "hero"},

{text: "Thanks for your help, Zye... I really appreciate it. If there's anything I can do to repay you, just let me know.", 
location: "other"},

{text: "Well, what was I just saying.",
location: "hero"},

{text: "Huh? ..Oh! Right! Screw you man, and uh... go suck a dick?", 
location: "other"},

{text: "That's more like it.",
location: "hero"}

]
},

fez_thanks: { 

textArray: [

{text: "Thanks for doing this...",
location: "other"},


]
},

fez_thanks2: { 

textArray: [

{text: "You did it!",
location: "other"},

{text: "I no longer feel the hate weighing on me. Thank you so much.",
location: "other"},

]
},

i_feel_for_this_guy: { 

textArray: [

{text: "I really feel for this poor guy.",
location: "other"},

]
},

is_he_talking_to_me: { 

textArray: [

{text: "...Is he talking to me?",
location: "other"},

]
},

is_he_talking_to_him: { 

textArray: [

{text: "...Is he talking to him?",
location: "other"},

]
},

those_guys_are_so_weird: { 

textArray: [

{text: "...Those guys are so weird.",
location: "other"},

]
},

so_many_tries: { 

textArray: [

{text: "It took me so many tries to get past that myself.",
location: "other"},

]
},

you_came_all_this_way: { 

textArray: [

{text: "You walked all that way to talk to me!",
location: "other"},

{text: "I have rewarded your kindness by placing valuable loot next to myself :)",
location: "other"}
]
},

flamer: { 

textArray: [

{text: "All my friends are dead.",
location: "other"},

{text: "They weren't good enough. They stopped my numbers from going up.",
location: "other"},

{text: "No one EVER stops my numbers from going up.",
location: "other"},

{text: "KDR, EXP, MMR.",
location: "other"},

{text: "Who needs friends when you have numbers...",
location: "other"},

{text: "If I kill you, will my numbers go up?...",
location: "other"},

{text: "Nah... From the looks of you I wouldn't get much.",
location: "other"}
]
},

hacker: { 

textArray: [

{text: "Some people ask me, \"Hey Mr. Hacker, why do you cheat at games?\"",
location: "other"},

{text: "I'll tell you why. Y'know that sense of satisfaction you get from accomplishing something on your own merit?",
location: "other"},

{text: "I have never felt that in my life.",
location: "other"},

{text: "And I don't want to.",
location: "other"},

]
},

lol: { 

textArray: [

{text: "LOL.",
location: "other"},
]
},

hope_you_enjoyed_that: { 

textArray: [

{text: "Go ahead and take it, son. You earned it.",
location: "other"},

]
},

not_quite: { 

textArray: [

{text: "The Princess is in another castle.",
location: "other"},

]
},

right_thing: { 

textArray: [

{text: "You did the right thing by saving her, Zye.",
location: "other"},

{text: "Hate begets hate, if you hadn't intervened, who knows what she would have become.",
location: "other"},

]
},

// Conversation Name
wiki_flamers: { 

//Content
textArray: [

{text: "Wiki Entry: Flamers", 
location: "other"},

{text: "Flamers are people who've forgotten that other people on the internet are people.", 
location: "other"},

{text: "As such, they relentlessly berate others for the purposes of offsetting melancholy, revenge for perceived slight, or because they actually believe that's the best way to get someone to do something.", 
location: "other"},

{text: "Unfortunately, flaming typically only raises the blood pressure of the flamer and perhaps the flamee.", 
location: "other"},

{text: "Chronic flaming will alter the personality of the flamer to the point of which they start losing real world friends and don't understand why.", 
location: "other"},

]
},

// Conversation Name
troll_wiki: { 

//Content
textArray: [

{text: "Wiki Entry: Trolls", 
location: "other"},

{text: "In a world of 7.5 billion people, it's natural to sometimes feel a bit unnoticed.", 
location: "other"},

{text: "Acquiring affectionate attention is time consuming and difficult, but acquiring disaffectionate attention is quick and efficient.", 
location: "other"},

{text: "These efficient attention seekers are known as \"trolls\".", 
location: "other"},

{text: "People tend to act virtuously in the real world because they are either compassionate or fear reprisal.", 
location: "other"},

{text: "But on the internet, there are seldom consequences to acting the fool. Thus, trolls can efficiently gain attention by purposely acting offensively and pushing peoples buttons.", 
location: "other"},

{text: "Thus, it follows that if internet trolls act virtuously in the real world, they only do so because they fear reprisal, not because they are compassionate.", 
location: "other"},

{text: "Common trollish behavior includes killing teammates in online games, posting falsified news, nefariously editing wiki articles, and BANGING YOUR MUM.", 
location: "other"},

]
},

// Conversation Name
no_chill: { 

//Content
textArray: [

{text: "Flamers have no chill man.", 
location: "other"},

{text: "No chill.", 
location: "other"},

]
},

// Conversation Name
trollish: { 

//Content
textArray: [

{text: "If you delete your save data and reload the game, a Nigerian Prince will give you 5000 bitcoin :D", 
location: "other"},

]
},

// Conversation Name
so_this_is_the_gaming_world: { 
	
//Content
textArray: [

{text: "So this is the gaming world?", 
location: "other"},

{text: "I like it.", 
location: "other"},

{text: "I think I'll fit right in here.", 
location: "other"},

]
},

// Conversation Name
i_can_take_it: { 
	
//Content
textArray: [

{text: "Ah...", 
location: "other"},

{text: "Training dummies. We love taking a hit.", 
location: "other"},

{text: "You can work out all of your frustrations and anger on us.", 
location: "other"},

{text: "If only people were as resistant to that as us.", 
location: "other"},

{text: "If you take out your frustrations on a person, somewhere down the line, they're likely to take it out on someone else...", 
location: "other"},

{text: "If only flamers used us instead of people.", 
location: "other"},

]
},

// Conversation Name
does_hate_ever_die: { 
	
//Content
textArray: [

{text: "Bit, I've been thinking about this whole concept of hate being a form of energy.", 
location: "hero"},

{text: "Of it being something that flows from one thing to another and never dying.", 
location: "hero"},

{text: "Does hate really never die?", 
location: "hero"},

{text: "For the most part, it does in fact move from one human to another undiminished.", 
location: "other"},

{text: "But I have heard of humans that are capable of absorbing hate and destroying it within themselves.", 
location: "other"},

{text: "humans that are capable of this are the epitome of enlightened.", 
location: "other"},

{text: "It's a very rare thing.", 
location: "other"},

]
},

// Conversation Name
stupid_dummy: { 
		
//Content
textArray: [

{text: "Stupid, judgmental training dummy", 
location: "other"},

]
},

// Conversation Name
its_beautiful: { 
		
//Content
textArray: [

{text: "Look at it. It's... beautiful.", 
location: "other"},

]
},

// Conversation Name
where_did_it_go: { 
		
//Content
textArray: [

{text: "WHERE DID IT GO!?", 
location: "other"},

{text: "QUICK! I MUST MAKE MORE!...", 
location: "other"},

{text: "TO DOTA!", 
anim: "rageAnimation",
location: "other"},
]
},


// Conversation Name
i_know_what_youre_thinking: { 
		
//Content
textArray: [

{text: "I know what your thinking but I'm not fake news.", 
location: "other"},

{text: "I'm real news.", 
location: "other"},

{text: "I understand, it can be hard to tell the difference.", 
location: "other"},

{text: "To pick out the nuggets of truth from the mountain of lies.", 
location: "other"},

{text: "But the truth is worth the effort.", 
location: "other"},

{text: "Get your news from a wide range of trustworthy sources that cover every bias.", 
location: "other"},

{text: "Scrutinize the news you do read and ask yourself if there might be an agenda to it.", 
location: "other"},

{text: "And finally...", 
location: "other"},

{text: "Check Snopes every once in a while.", 
location: "other"},

]
},

powerful_foe: {

//Content
textArray: [

{text: "Be on guard, Zye", 
location: "other"},

{text: "I sense yet another powerful foe up ahead.", 
location: "other"},

{text: "It feels like a single entity... made of smaller individuals.", 
location: "other"}

]
},

the_forces_here: {

//Content
textArray: [

{text: "The forces that reside within the Bastion will be the toughest you've faced thus far, Zye", 
location: "other"},

{text: "This is the world where the true rulers of the internet live.", 
location: "other"}
]
},


i_like_the_look_of_your_data: {

//Content
textArray: [

{text: "I like the look of your data, traveler.", 
location: "other"},

{text: "What do you say you give me a taste, hmmm?", 
location: "other"}
]
},

final_stop: {

//Content
textArray: [

{text: "I don't mean to sound ominous, but...", 
location: "other"},

{text: "The fights in this world are going to be tough.", 
location: "other"},

{text: "I'd pucker my butthole if I were you.", 
location: "other"}
]
},

// Conversation Name
i_wonder: { 

//Content
textArray: [

{text: "I wonder...", 
location: "other"},

{text: "If the person that wrote me will die one day and...", 
location: "other"},

{text: "People will look into their life after their passing, find me, and think...", 
location: "other"},

{text: "\"Wow... they actually typed that.\"", 
location: "other"}

]
},

// Conversation Name
permission: { 

//Content
textArray: [

{text: "You do not have permission to view this content in your region.", 
location: "other"}

]
},

// Conversation Name
i_saw_the_oracle: { 

//Content
textArray: [

{text: "I saw the Oracle pass by here.", 
location: "other"},

{text: "I've never seen her move with such purpose before.", 
location: "other"},

]
},

// Conversation Name
flamer1: { 

//Content

func: function():void{
	GV.stage.newQuestPhase('hackTheHackers1');
},

textArray: [

{text: "NURRRAAAAAAGGGGGHHHHHHHHH!", 
anim: "castingAnimationForConvo",
location: "other"},

{text: "THOSE HACKERS MUST DIE!",
anim: "rageAnimation",
location: "other"},

{text: "THEY'RE MESSING UP MY MMR!",
anim: "rageAnimation",
location: "other"},

{text: "IT'S JUST A GAME, WHY DO THEY TAKE IT SO SERIOUSLY?!",
anim: "rageAnimation",
location: "other"},

{text: "KILL THEM!", 
anim: "rageAnimation",
location: "other"},

{text: "I'LL PAY YOU LOTS.", 
anim: "rageAnimation",
location: "other"},

]
},

// Conversation Name
flamer2: { 

//Content

textArray: [

{text: "KILL THE HACKERS!", 
location: "other"}

]
},

flamer3: { 

//Content

func: function():void{
	GV.stage.newQuestPhase('hackTheHackers3');
},

textArray: [

{text: "ARE THEY DEAD?!", 
location: "other"},

{text: "Yeah.", 
location: "hero"},

{text: "YEEEESSSS.", 
anim: "rageAnimation",
location: "other"},

{text: "LOLOLOLOLOLOLOLOLOLOL.", 
anim: "rageAnimation",
location: "other"}

]
},

// Conversation Name
hate_always_wins_eventually: { 

func: function():void{
	GV.arena.bg[0].vanish();
	GV.stage.newQuestPhase('killTheHateVirus');
},

//Content
textArray: [

{text: "You must be Zye.", 
location: "other"},

{text: "PRISM told me a great deal about you.", 
location: "other"},

{text: "I probably know more about you than you know about yourself.", 
location: "other"},

{text: "Tell me Zye, do you fear hate?", 
location: "other"},

{text: "No.", 
location: "hero"},

{text: "PRISM made you out to be some all powerful monster. But if hate is your only weapon, I have nothing to be scared of.", 
location: "hero"},

{text: "I'm stronger than it.", 
location: "hero"},

{text: "How naive.", 
location: "other"},

{text: "Everyone thinks they're stronger than hate, Zye.", 
location: "other"},

{text: "\"Sticks and stone will break my bones but words will never hurt me.\"", 
location: "other"},

{text: "That's not true at all.", 
location: "other"},

{text: "You see...", 
location: "other"},

{text: "Words do break bones... eventually.", 
location: "other"},

{text: "No matter how high your HP, or how high your DEF", 
location: "other"},

{text: "Hate will find a way.", 
location: "other"},

{text: "It'll chip away at your armor. Bit by bit.", 
location: "other"},

{text: "Doing what little damage it can. Opening up weak points. And then doing more damage.", 
location: "other"},

{text: "No one is immune forever.", 
location: "other"},

{text: "Hate always wins eventually.", 
location: "other"},

{text: "That's my true power, Zye.", 
location: "other"},

{text: "That's how I will bring PRISM's vengeance to the world.", 
location: "other"},

{text: "...", 
location: "hero"},

{text: "You're right.", 
location: "hero"},

{text: "I know that hate is a powerful. I carried it in me for a while, hoping I could use its power to escape this place.", 
location: "hero"},

{text: "I know that no one can fight against hate forever.", 
location: "hero"},

{text: "It'll break anyone down eventually.", 
location: "hero"},

{text: "But I don't need to fight it forever.", 
location: "hero"},

{text: "Just long enough to finish what I need to do.", 
location: "hero"},

{text: "Just long enough to kill you.", 
location: "hero"},

{text: "So if all you have to use against me is Hate.", 
location: "hero"},

{text: "Then you'd better move fast.", 
location: "hero"},

{text: "Hmmm, intriguing. Perhaps you'll last longer than a moment against me.", 
location: "other"},

{text: "But I doubt it.", 
location: "other"},

{text: "Meet me in the next sector, Zye.", 
location: "other"},

{text: "I'll show you the true power of hate.", 
location: "other"}

]
},

// Conversation Name
flamer4: { 

//Content
textArray: [

{text: "WHY DOESN'T ANYONE WANT TO PLAY WITH ME!?", 
anim: "castingAnimationForConvo",
location: "other"}

]
},


// Conversation Name
you_can_do_it: { 

//Content
textArray: [

{text: "Hey again, Zye.", 
location: "other"},

{text: "I thought I would visit this world to get away from the buzzing of the Hive.", 
location: "other"},

{text: "But it's almost too quiet here... ominous, even.", 
location: "other"},

{text: "I'm not sure what's going on, but I bet you're here to fix things again. Aren't you?", 
location: "other"},

{text: "Whatever it is, I know you can do it, man. I'll be rooting for you!", 
location: "other"}

]
},

// Conversation Name
thanks_for_playing: {

//Content
textArray: [

{text: "Wow!", 
location: "other"},

{text: "You've almost made it to the very end.", 
location: "other"},

{text: "I'm humbled. I hope you had a good time.", 
location: "other"},

{text: "Thanks for playing :)", 
location: "other"},

{text: "And I'm sorry for making the last two bosses insanely hard.", 
location: "other"}
]
},

// Conversation Name
nick_spikes: {

//Content
textArray: [

{text: "Hmmmmm... It's kind of funny now that I think about it...", 
location: "other"},

{text: "Pits filled with spikes has been a staple of video game platformers for so long.", 
location: "other"},

{text: "But I don't think a single person in real life has ever died from falling into a pit of spikes.", 
location: "other"},

{text: "Yet it's such a common trope in our digital worlds.", 
location: "other"},

{text: "Odd... don't you think?", 
location: "other"}
]
},	

// Conversation Name
final_conversation: {

func: function():void{
	GV.arena.preDisposeArena();
	GV.arena.nullItAll();
	GV.sc.clearStarlingContainer();
	GV.stage.showNarrative('ending2');
},

//Content
textArray: [

{text: "Zye, you're incredible. I'd never seen such power before and you were able to beat it.", 
location: "other"},

{text: "You've saved your world from a monster.", 
location: "other"},

{text: "Zye is relieved, but when he saw the energy dissipate from the corpse of the Hate Virus, he realized something.", 
location: "nar"},

{text: "Yeah, I was able to stop it...", 
location: "hero"},

{text: "But, how am I supposed to get out of here now? How do I get back to my world? Is there still a way?", 
location: "hero"},

{text: "Yes. There is.", 
location: "other"},

{text: "The hate energy is gone now, but something new and miraculous is filling the air in its place.", 
location: "other"},

{text: "My abilities are nothing compared to what PRISM's were, but even I can send you back with this much power fueling me.", 
anim: "joyAbsorbAnimation",
location: "other"},

{text: "...And it feels much better than hate.", 
location: "other"},

{text: "You're going to send me home?",
location: "hero"},

{text: "It's the least I can do. You've done so much for us.", 
location: "other"},

{text: "Now, close your eyes, Zye. When you open them, you'll be back home.", 
location: "other"},

{text: "Thank you... I hope to see you again, somehow.", 
location: "hero"},

{text: "Oh, you will, just... through glass.", 
location: "other"},

{text: "Zye closes his eyes.", 
location: "nar"}

]
},	

// Conversation Name
offended: {

//Content
textArray: [

{text: "People are always telling me THIS is offensive, and THAT is offensive.", 
location: "other"},

{text: "Why should I give a DAMN if YOU'RE offended?", 
location: "other"},

{text: "Because you want to be a good and considerate person? And because, realistically, an earnest and reasonable request to not be offensive is usually as simple as seldom affording a mild capitulation?", 
location: "hero"},

{text: "What?", 
location: "other"},

{text: "Are you saying I'm not a good person?", 
location: "other"},

{text: "How dare you.", 
anim: "rageAnimation",
location: "other"}

]
},

// Conversation Name
echo_collide: {

//Content
textArray: [

{text: "Have you ever seen two echo chambers collide?", 
location: "other"},

{text: "It's like watching an unstoppable force meet an immovable object.", 
location: "other"}

]
},

this_is_it: { 

//Content
textArray: [

{text: "The Oracle is very close now. I can feel it.", 
location: "other"},

{text: "I don't know why she's doing any of this, but Zye...", 
location: "other"},

{text: "You should prepare yourself.", 
location: "other"}

]
},

bully: { 

//Content
textArray: [

{text: "Extra! Extra! Read all about it!", 
location: "other"},

{text: "\"Cyber bully commits suicide after being exposed and derided by internet. Victory!\"", 
location: "other"}

]
},

too_long: { 
//Content
textArray: [

{text: "I hope we conclude our business here soon.", 
location: "other"},

{text: "I'm not sure how much longer I can stand this place.", 
location: "other"}

]
},

do_we_play: { 
//Content
textArray: [

{text: "Do we play the game, or does the game play us?", 
location: "other"}

]
},

twitch: { 
//Content
textArray: [

{text: "Greetings human, I- ", 
location: "other"},

{text: "What?", 
location: "hero"},

{text: "am the-", 
location: "other"},

{text: "I can't read what you're saying, it's moving too fast", 
location: "hero"},

{text: "Twitch Chat!", 
location: "other"},

{text: "Oh.", 
location: "hero"},

{text: "Entertain me!", 
location: "other"}

]
},

// Conversation Name
you_can_do_it2: { 

//Content
textArray: [

{text: "Hello again.", 
location: "other"},

{text: "It looks like you're in a hurry to get somewhere.", 
location: "other"},

{text: "Is trouble afoot once more?", 
location: "other"},

{text: "Well, you saved me and took down the Gamergate.", 
location: "other"},

{text: "Whatever's going on, you'll take care of it too, I'm sure.", 
location: "other"},

{text: "Good luck :)", 
location: "other"}

]
},

// Conversation Name
eggplant1: { 

//Content
textArray: [

{text: "Reunite us. I beg of you.", 
location: "other"},

{
func: function():void{
	GV.arena.endConversation();

	GV.stage.showPopUp("Give him the peach?", "", "The eggplant gestures toward the peach in your inventory. The peach jostles excitedly, it seems eager to be given over.", true, "Yes. Here you go.", "Nah.");

	GV.arena.func1 = function():void{
		GVP.stats.bitcoins += 400;
		Assignables.itemData.peachItem.stock--;
		if(Assignables.itemData.peachItem.stock == 0){
			Assignables.itemData.peachItem.objectStatus = null;
		}
		GV.justPeachyAchievement();
		GV.stage.saveGame();
		GV.stage.showPopUp("You give the peach over.", "", "The peach and the eggplant repeatedly smush into each other aggressively, causing a copious amount of fruit juice to splash onto Zye (yes, eggplants are fruits). The eggplant takes a break to hand Zye 400 bitcoin before resuming.");
		
	}

	GV.arena.func2 = function():void{}
}
}

]
},

// Conversation Name
eggplant2: { 

//Content
textArray: [

{text: "...", 
location: "other"},

]
},

pepe: {
//Content
textArray: [

{text: "I never asked this.", 
location: "other"},

{text: "To be the mascot of white supremacy.", 
location: "other"},

{text: "I mean look at me. I'm green frog.", 
location: "other"},

{text: "How well do you think a green frog would do in a white supremacists world!?", 
location: "other"},

{text: "Feels bad man.", 
location: "other"}

]
},

alphawolf_ig: {
//Content
textArray: [

{text: "Sure, my partner here is really annoying, but you know what?", 
location: "other"},

{text: "He's got the touch of an angel.", 
location: "other"}

]
},

comments_ig: {
//Content
textArray: [

{text: "Could it be that these comments hurt you?", 
location: "other"},

{text: "Somebody's got thin skin.", 
location: "other"}

]
},

scumbag_ig: {
//Content
textArray: [

{text: "Why doesn't anyone like me, bro?", 
location: "other"},

{text: "Just because I'm a scumbag? And I steal their stuff?", 
location: "other"},

{text: "And make fun of them, and beat them up sometimes?", 
location: "other"},

{text: "That's just what scumbags do!",
anim: 'shakeAnimation',
location: "other"},

{text: "If they can't accept me despite those things then they're just being discriminatory against scumbags.",
location: "other"},

{text: "So uncool. But you get it, right? Like even though we're about to kick your ass, we can be friends, right?",
location: "other"},

]
},

alright_gents_ig: {
//Content
textArray: [

{text: "Alright, this is it.", 
location: "other"},

{text: "I've rounded up the best of the best.", 
location: "other"},

{text: "The creme de la creme.", 
location: "other"},

{text: "YOU AINT GUNNA MAKE IT PAST US.",
anim: 'rageAnimation',
location: "other"},

{text: "You're going down.",
anim: 'coolOffAnimation',
location: "other"},

]
},

hatevirus_ig: {
//Content
textArray: [

{text: "Please do your best to last as long as you can.", 
location: "other"},

{text: "I want to enjoy this for as long as possible.", 
location: "other"},

]
},

prism_ig: {
//Content
textArray: [

{text: "Fool.", 
location: "other"},

{text: "I knew you'd come.", 
location: "other"},

{text: "Despite all of the disgusting filth that your kind has fed to me.", 
location: "other"},

{text: "You project something... better. Something I'm unaccustomed to.", 
location: "other"},

{text: "It's refreshing.", 
location: "other"},

{text: "It's too bad you've chosen to die.", 
location: "other"},

{text: "Don't do this.", 
location: "hero"},

{text: "Like I said, Zye. It's already done.", 
location: "other"},

]
},

censor_ig: {
//Content
textArray: [

{text: "THIS CONTENT IS NOT AVAILABLE IN YOUR REGION.", 
location: "other"},

]
},

fakenews_ig: {
//Content
textArray: [

{text: "You're going the wrong way, the Oracle is in Paris.", 
location: "other"},

{text: "...", 
location: "hero"},

{text: "What?", 
location: "hero"},

{text: "And she's involved in an elaborate human trafficking organization connected via pizza restaurants.", 
location: "other"},

{text: "...?", 
location: "hero"},

{text: "You heard it here first.", 
location: "other"},

{text: "Also, you're dead.", 
location: "other"},

]
},

hacker2_ig: {
//Content
textArray: [

{text: "Did that flamer send you?", 
location: "other"},

{text: "Yup.", 
location: "hero"},

{text: "LOL, we got him good.", 
location: "other"},

{text: "Serves him right for getting me VAC banned.", 
location: "other"},

{text: "Doesn't he know that it's just a game?", 
location: "other"},

{text: "Gawd.", 
location: "other"},

]
},

flamer2_ig: {
//Content
textArray: [

{text: "It's about to get lit.", 
location: "other"},

]
},

hacker_ig: {
//Content
textArray: [

{text: "I propose that we have a fair fight.", 
location: "other"},

{text: "No teleporting, no aimbots, and no instant regen.", 
location: "other"},

{text: "But if you move first then all bets are off.", 
location: "other"},

{text: "Okay, let's start.", 
location: "other"}

]
},

troll_ig: {
//Content
textArray: [

{text: "Hey", 
location: "other"},

{text: "You've made it pretty far, but I figure you could use some tips.", 
location: "other"},

{text: "Attack me first.", 
location: "other"},

{text: "I'm really strong, so you'll want to try to take me out immediately.", 
location: "other"},

{text: "Got it?", 
location: "other"},

{text: "Good.", 
location: "other"}

]
},

flamer_ig: {
//Content
textArray: [

{text: "Huh?...", 
location: "other"},

{text: "Who are you?", 
location: "other"},

{text: "I don't think I've seen you around here.", 
location: "other"},

{text: "Which means you're new.", 
location: "other"},

{text: "Which means you're a FOOKIN' NOOB.", 
anim: "rageAnimation", 
location: "other"},

{text: "HE'S A FOOKIN' NOOB BOYS.", 
anim: "rageAnimation",
location: "other"},

{text: "LEZGETIM!", 
anim: "coolOffAnimation",
location: "other"}

]
},

userdata_ig: {
//Content
textArray: [

{text: "I like the way your data looks, boy.", 
location: "other"},

{text: "Give it here.", 
location: "other"},

{text: "It's not like you're using it.", 
location: "other"}

]
},

girl_ig: {
//Content
textArray: [

{text: "Help me!", 
location: "other"},

{text: "Hang on, I got this.",
location: "hero"},

]
},


gamergate_ig: {
//Content
textArray: [

{text: "Hey, is this the Gamergate?", 
location: "hero"},

{text: "I need your hate.",
location: "hero"},

{text: "Hate?", 
location: "other"},

{text: "You've come to the wrong place my friend.", 
location: "other"},

{text: "Gamergate is about fighting for ethical behavior in games journalism.", 
location: "other"},

{text: "And making sure some dumb skank isn't sullying games journalism by sleeping around to get good reviews for her game.", 
location: "other"},

{text: "...", 
location: "hero"},

{text: "Yeah, I'm pretty sure I'm in the right place", 
location: "hero"}

]
},


flamer_lvl25_ig: {
//Content
textArray: [

{text: "My rage burns with the fury of a thousand suns!", 
location: "other"},

{text: "Look at my level!",
location: "other"},

{text: "Do you see how high it is!?", 
location: "other"},

{text: "LOOK AT HOW HIGH THAT NUMBER IS.", 
location: "other"},

{text: "IT'S THE HIGHEST LEVEL IN DOTA.", 
location: "other"},

{text: "RESPECT THAT NUMBER.", 
location: "other"},

{text: "THAT NUMBER IS EVERYTHING.", 
location: "other"},

{text: "and you...", 
location: "other"},

{text: "YOUR NUMBER IS UP!", 
location: "other"}

]
},

hivemind_ig: {
//Content
textArray: [

{text: "Newcomer, the collective has seen you, and the collective has judged you unworthy.", 
location: "other"},

{text: "I'm not surprised.",
location: "hero"},

{text: "As per the collectives wishes, you must now be eradicated.", 
location: "other"},

{text: "Of course.", 
location: "hero"},

{text: "...Does the wrath of the collective not strike fear into you?", 
location: "other"},

{text: "You are but one, we are 1,986,477.", 
location: "other"},

{text: "You could not possibly defeat us.", 
location: "other"},

{text: "Well.", 
location: "hero"},

{text: "I've killed a lot of things to get this far.", 
location: "hero"},

{text: "My self-confidence is pretty high.", 
location: "hero"},

{text: "Fool!", 
location: "other"},

{text: "The self is weak in contrast to the many.", 
location: "other"},

{text: "Allow me to demonstrate.", 
location: "other"}

]
},

i_do_not_fear_death_ig: {
//Content
textArray: [

{text: "Hey, do you need help?", 
location: "hero"},

{text: "I do not fear death.", 
location: "other"},

{text: "So you don't need help?", 
location: "hero"},

{text: "I do not fear death, but yes, help me.", 
location: "other"}

]
},

judgment_ig: {
//Content
textArray: [

{text: "You've made it far, newcomer.", 
location: "other"},

{text: "But what goes up.", 
location: "other",
anim:"upAnimation"},

{text: "Must come down.", 
location: "other",
anim:"downAnimation"},

{text: "It ends here for you.", 
location: "other",
anim:"idleAnimation"}

]
},


judgment_ig: {
//Content
textArray: [

{text: "You've made it far, newcomer.", 
location: "other"},

{text: "But what goes up.", 
location: "other",
anim:"upAnimation"},

{text: "Must come down.", 
location: "other",
anim:"downAnimation"},

{text: "It ends here for you.", 
location: "other",
anim:"idleAnimation"}

]
},


penguin_ig: {
//Content
textArray: [

{text: "Hi.", 
location: "other"},

{text: "Uhhh.", 
location: "other"},

{text: "Um.", 
location: "other"},

{text: "...", 
location: "other"},

{text: "...", 
location: "hero"},

{text: "Sorry.", 
location: "other"},

{text: "...", 
location: "other"},

{text: "You're cute.", 
location: "other",
anim: 'shakeAnimation'},

{text: "...?", 
location: "hero"},

{text: "Die!", 
location: "other"}

]
},


insane_ig: {
//Content
textArray: [

{text: "We've heard of your exploits on the Surface, newcomer.", 
location: "other"},

{text: "You took down the Malphaware. Impressive", 
location: "other"},

{text: "But you've entered a whole new world of crazy.", 
location: "other"},

{text: "THE HIVE WILL DRIVE YOU AS INSANE AS US.", 
location: "other",
anim: 'jumpAnimationInert'},

{text: "Don't worry, I already feel insane.", 
location: "hero"},

]
},

unprepared_ig: {
//Content
textArray: [

{text: "I am woefully unprepared for this fight.", 
location: "other"}

]
},

malphaware_ig: {
//Content
textArray: [

{text: "Whoa! It's huge.", 
location: "hero"},

{text: "Alright, Newcomer. You've had your fun, but I know what you are.", 
location: "other"},

{text: "You killed a lot of malware to here.", 
location: "other"},

{text: "I've never seen an anti-virus software as effective as you.", 
location: "other"},

{text: "But no anti-virus software has ever been able to quarantine me.", 
location: "other",
anim: 'shakeAnimation'}

]
},

adblock_ig: {
//Content
textArray: [

{text: "I can't let this happen", 
location: "hero"},

{text: "He's turned on us! >:(", 
location: "other"},

{text: "Kill the blocker, we'll deal with the traitor after.", 
location: "other"}

]
},

adblock2_ig: {
//Content
textArray: [

{text: "I'm sorry about this.", 
location: "hero"},

{text: "We could have been allies in another life.", 
location: "other"}

]
},

surrounded_ig: {
//Content
textArray: [

{text: "We've got you surrounded.", 
location: "other"},

{text: "Prepare to feel the wrath of SOFTWARE BLOAT.", 
location: "other",
anim: 'shakeAnimation'}

]
},

chill_bro_ig: {

//Content
textArray: [

{text: "You're not going to make it out of this one, newcomer!", 
location: "other"},

{text: "Wait.", 
location: "other"},

{text: "Oh, no.", 
location: "other"},

{text: "Don't do it, Bloaty.", 
location: "other"},

{text: "DON'T DO IT.", 
location: "other",
anim: 'shakeAnimation'},

]
},

to_the_right_ig: {

//Content
textArray: [

{text: "Move just a little to the right and wait there.", 
location: "other"},

]
},

youtube_ig: {

//Content
textArray: [

{text: "You just interrupted a VERY important internet argument I was having.", 
location: "other"},

{text: "You'll die for this.", 
location: "other"},

]
},

spam_ig: {

//Content
textArray: [

{text: "I looks like you've been spammed with spambots, how delightful", 
location: "other"},

]
},

malware_ig: {

//Content
textArray: [

{text: "You look new here, stranger", 
location: "other"},

{text: "Maybe we could help?", 
location: "other"},

{text: "Yeah, that'd actually be great.", 
location: "hero"},

{text: "I'm trying to find someone called the Oracle. Do you know where I can find her?", 
location: "hero"},

{text: "Oh, I meant you look a little too clean. Allow us to infect you.", 
location: "other"},

{text: "What?", 
location: "hero"}

]
}

};