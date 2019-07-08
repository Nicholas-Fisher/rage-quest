package classes {
	
	import classes.FFParticleSystem.FFParticleSystem;
	import classes.FFParticleSystem.SystemOptions;	
	import starling.textures.Texture;
	import starling.events.Event;
	import starling.display.Sprite;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundMixer;
	import flash.utils.*;

	public class FX {

		[Embed(source = "../media/particles/arrowTexture.png")]
		private static const TextureArrow:Class;
		private static const textureArrow:Texture = Texture.fromBitmap(new TextureArrow());

		[Embed(source = "../media/particles/hateTexture.png")]
		private static const TextureHate:Class;
		private static const textureHate:Texture = Texture.fromBitmap(new TextureHate());

		[Embed(source = "../media/particles/loveTexture.png")]
		private static const TextureLove:Class;
		private static const textureLove:Texture = Texture.fromBitmap(new TextureLove());		

		[Embed(source = "../media/particles/squareTexture.png")]
		private static const TextureSquare:Class;
		private static const textureSquare:Texture = Texture.fromBitmap(new TextureSquare());

		[Embed(source = "../media/particles/circleTexture.png")]
		private static const TextureCircle:Class;
		private static const textureCircle:Texture = Texture.fromBitmap(new TextureCircle());

		[Embed(source = "../media/particles/mushroomTexture.png")]
		private static const TextureMushroom:Class;
		private static const textureMushroom:Texture = Texture.fromBitmap(new TextureMushroom());

		[Embed(source = "../media/particles/highResCircle.png")]
		private static const TextureHighResCircle:Class;
		private static const textureHighResCircle:Texture = Texture.fromBitmap(new TextureHighResCircle());

		[Embed(source = "../media/particles/gradientCircle.png")]
		private static const TextureGradientCircle:Class;
		private static const textureGradientCircle:Texture = Texture.fromBitmap(new TextureGradientCircle());

		[Embed(source = "../media/particles/ellipseTexture.png")]
		private static const TextureEllipse:Class;
		private static const textureEllipse:Texture = Texture.fromBitmap(new TextureEllipse());

		[Embed(source = "../media/particles/swordTexture.png")]
		private static const TextureSword:Class;
		private static const textureSword:Texture = Texture.fromBitmap(new TextureSword());

		[Embed(source = "../media/particles/shieldTexture.png")]
		private static const TextureShield:Class;
		private static const textureShield:Texture = Texture.fromBitmap(new TextureShield());

		[Embed(source = "../media/particles/healTexture.png")]
		private static const TextureHeal:Class;
		private static const textureHeal:Texture = Texture.fromBitmap(new TextureHeal());

		[Embed(source = "../media/particles/starTexture.png")]
		private static const TextureStun:Class;
		private static const textureStun:Texture = Texture.fromBitmap(new TextureStun());

		[Embed(source = "../media/particles/lineTexture.png")]
		private static const TextureLine:Class;
		private static const textureLine:Texture = Texture.fromBitmap(new TextureLine());

		[Embed(source="../media/particles/hitParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigHit:Class;
		private static const configHit:XML = XML(new ConfigHit());
		private static const optionHit:SystemOptions = SystemOptions.fromXML(configHit, textureLine);

		[Embed(source="../media/particles/apUpParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigApUp:Class;
		private static const configApUp:XML = XML(new ConfigApUp());
		private static const optionApUp:SystemOptions = SystemOptions.fromXML(configApUp, textureLine);

		[Embed(source="../media/particles/apDownParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigApDown:Class;
		private static const configApDown:XML = XML(new ConfigApDown());
		private static const optionApDown:SystemOptions = SystemOptions.fromXML(configApDown, textureLine);

		[Embed(source="../media/particles/smokeTrailParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigSmokeTrail:Class;
		private static const configSmokeTrail:XML = XML(new ConfigSmokeTrail());
		private static const optionSmokeTrail:SystemOptions = SystemOptions.fromXML(configSmokeTrail, textureCircle);

		[Embed(source="../media/particles/slimeySplashParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigSlimeySplash:Class;
		private static const configSlimeySplash:XML = XML(new ConfigSlimeySplash());
		private static const optionSlimeySplash:SystemOptions = SystemOptions.fromXML(configSlimeySplash, textureCircle);

		[Embed(source="../media/particles/slimeyPinkSplashParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigSlimeyPinkSplash:Class;
		private static const configSlimeyPinkSplash:XML = XML(new ConfigSlimeyPinkSplash());
		private static const optionSlimeyPinkSplash:SystemOptions = SystemOptions.fromXML(configSlimeyPinkSplash, textureCircle);

		[Embed(source="../media/particles/slimeTrailParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigSlimeTrail:Class;
		private static const configSlimeTrail:XML = XML(new ConfigSlimeTrail());
		private static const optionSlimeTrail:SystemOptions = SystemOptions.fromXML(configSlimeTrail, textureEllipse);

		[Embed(source="../media/particles/corruptSlimeySplashParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigCorruptSlimeySplash:Class;
		private static const configCorruptSlimeySplash:XML = XML(new ConfigCorruptSlimeySplash());
		private static const optionCorruptSlimeySplash:SystemOptions = SystemOptions.fromXML(configCorruptSlimeySplash, textureCircle);

		[Embed(source="../media/particles/corruptSlimeTrailParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigCorruptSlimeTrail:Class;
		private static const configCorruptSlimeTrail:XML = XML(new ConfigCorruptSlimeTrail());
		private static const optionCorruptSlimeTrail:SystemOptions = SystemOptions.fromXML(configCorruptSlimeTrail, textureEllipse);

		[Embed(source="../media/particles/explosionParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigExplosion:Class;
		private static const configExplosion:XML = XML(new ConfigExplosion());
		private static const optionExplosion:SystemOptions = SystemOptions.fromXML(configExplosion, textureHighResCircle);

		[Embed(source="../media/particles/sodaExplosionParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigSodaExplosion:Class;
		private static const configSodaExplosion:XML = XML(new ConfigSodaExplosion());
		private static const optionSodaExplosion:SystemOptions = SystemOptions.fromXML(configSodaExplosion, textureHighResCircle);

		[Embed(source="../media/particles/poofParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigPoof:Class;
		private static const configPoof:XML = XML(new ConfigPoof());
		private static const optionPoof:SystemOptions = SystemOptions.fromXML(configPoof, textureHighResCircle);

		[Embed(source="../media/particles/blackMistParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigBlackMist:Class;
		private static const configBlackMist:XML = XML(new ConfigBlackMist());
		private static const optionBlackMist:SystemOptions = SystemOptions.fromXML(configBlackMist, textureHighResCircle);

		[Embed(source="../media/particles/shoopExplosionParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigShoopExplosion:Class;
		private static const configShoopExplosion:XML = XML(new ConfigShoopExplosion());
		private static const optionShoopExplosion:SystemOptions = SystemOptions.fromXML(configShoopExplosion, textureLine);

		[Embed(source="../media/particles/corruptExplosionParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigCorruptExplosion:Class;
		private static const configCorruptExplosion:XML = XML(new ConfigCorruptExplosion());
		private static const optionCorruptExplosion:SystemOptions = SystemOptions.fromXML(configCorruptExplosion, textureSquare);
		
		[Embed(source="../media/particles/sodaTrailParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigSodaTrail:Class;
		private static const configSodaTrail:XML = XML(new ConfigSodaTrail());
		private static const optionSodaTrail:SystemOptions = SystemOptions.fromXML(configSodaTrail, textureCircle);

		[Embed(source="../media/particles/shoopTrailParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigShoopTrail:Class;
		private static const configShoopTrail:XML = XML(new ConfigShoopTrail());
		private static const optionShoopTrail:SystemOptions = SystemOptions.fromXML(configShoopTrail, textureCircle);

		[Embed(source="../media/particles/prismTrailParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigPrismTrail:Class;
		private static const configPrismTrail:XML = XML(new ConfigPrismTrail());
		private static const optionPrismTrail:SystemOptions = SystemOptions.fromXML(configPrismTrail, textureCircle);

		[Embed(source="../media/particles/prismExplosionParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigPrismExplosion:Class;
		private static const configPrismExplosion:XML = XML(new ConfigPrismExplosion());
		private static const optionPrismExplosion:SystemOptions = SystemOptions.fromXML(configPrismExplosion, textureLine);

		[Embed(source="../media/particles/moblingTrailParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigMoblingTrail:Class;
		private static const configMoblingTrail:XML = XML(new ConfigMoblingTrail());
		private static const optionMoblingTrail:SystemOptions = SystemOptions.fromXML(configMoblingTrail, textureCircle);

		[Embed(source="../media/particles/explosionCoreParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigExplosionCore:Class;
		private static const configExplosionCore:XML = XML(new ConfigExplosionCore());
		private static const optionExplosionCore:SystemOptions = SystemOptions.fromXML(configExplosionCore, textureHighResCircle);

		[Embed(source="../media/particles/sparkParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigSpark:Class;
		private static const configSpark:XML = XML(new ConfigSpark());
		private static const optionSpark:SystemOptions = SystemOptions.fromXML(configSpark, textureCircle);

		[Embed(source="../media/particles/sparkTrailParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigSparkTrail:Class;
		private static const configSparkTrail:XML = XML(new ConfigSparkTrail());
		private static const optionSparkTrail:SystemOptions = SystemOptions.fromXML(configSparkTrail, textureCircle);

		[Embed(source="../media/particles/corruptTrailParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigCorruptTrail:Class;
		private static const configCorruptTrail:XML = XML(new ConfigCorruptTrail());
		private static const optionCorruptTrail:SystemOptions = SystemOptions.fromXML(configCorruptTrail, textureSquare);

		[Embed(source="../media/particles/spamTrailParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigSpamTrail:Class;
		private static const configSpamTrail:XML = XML(new ConfigSpamTrail());
		private static const optionSpamTrail:SystemOptions = SystemOptions.fromXML(configSpamTrail, textureSquare);

		[Embed(source="../media/particles/greenMissleTrailParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigGreenMissleTrail:Class;
		private static const configGreenMissleTrail:XML = XML(new ConfigGreenMissleTrail());
		private static const optionGreenMissleTrail:SystemOptions = SystemOptions.fromXML(configGreenMissleTrail, textureSquare);

		[Embed(source="../media/particles/purpleMissleTrailParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigPurpleMissleTrail:Class;
		private static const configPurpleMissleTrail:XML = XML(new ConfigPurpleMissleTrail());
		private static const optionPurpleMissleTrail:SystemOptions = SystemOptions.fromXML(configPurpleMissleTrail, textureSquare);

		[Embed(source="../media/particles/orangeMissleTrailParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigOrangeMissleTrail:Class;
		private static const configOrangeMissleTrail:XML = XML(new ConfigOrangeMissleTrail());
		private static const optionOrangeMissleTrail:SystemOptions = SystemOptions.fromXML(configOrangeMissleTrail, textureSquare);

		[Embed(source="../media/particles/redMissleTrailParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigRedMissleTrail:Class;
		private static const configRedMissleTrail:XML = XML(new ConfigRedMissleTrail());
		private static const optionRedMissleTrail:SystemOptions = SystemOptions.fromXML(configRedMissleTrail, textureSquare);

		[Embed(source="../media/particles/bloatParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigBloat:Class;
		private static const configBloat:XML = XML(new ConfigBloat());
		private static const optionBloat:SystemOptions = SystemOptions.fromXML(configBloat, textureSquare);

		[Embed(source="../media/particles/analyzeParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigAnalyze:Class;
		private static const configAnalyze:XML = XML(new ConfigAnalyze());
		private static const optionAnalyze:SystemOptions = SystemOptions.fromXML(configAnalyze, textureSquare);

		[Embed(source="../media/particles/statUpParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigStatUp:Class;
		private static const configStatUp:XML = XML(new ConfigStatUp());

		private static const optionPowUp:SystemOptions = SystemOptions.fromXML(configStatUp, textureSword);
		private static const optionDefUp:SystemOptions = SystemOptions.fromXML(configStatUp, textureShield);

		[Embed(source="../media/particles/statDownParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigStatDown:Class;
		private static const configStatDown:XML = XML(new ConfigStatDown());

		private static const optionPowDown:SystemOptions = SystemOptions.fromXML(configStatDown, textureSword);
		private static const optionDefDown:SystemOptions = SystemOptions.fromXML(configStatDown, textureShield);

		[Embed(source="../media/particles/healParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigHeal:Class;
		private static const configHeal:XML = XML(new ConfigHeal());
		private static const optionHeal:SystemOptions = SystemOptions.fromXML(configHeal, textureHeal);

		[Embed(source="../media/particles/stunParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigStun:Class;
		private static const configStun:XML = XML(new ConfigStun());
		private static const optionStun:SystemOptions = SystemOptions.fromXML(configStun, textureStun);

		[Embed(source="../media/particles/randomDataParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigRandomData:Class;
		private static const configRandomData:XML = XML(new ConfigRandomData());
		private static const optionRandomData:SystemOptions = SystemOptions.fromXML(configRandomData, textureCircle);

		[Embed(source="../media/particles/oracleParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigOracle:Class;
		private static const configOracle:XML = XML(new ConfigOracle());
		private static const optionOracle:SystemOptions = SystemOptions.fromXML(configOracle, textureSquare);

		[Embed(source="../media/particles/waterEffectParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigWaterEffect:Class;
		private static const configWaterEffect:XML = XML(new ConfigWaterEffect());
		private static const optionWaterEffect:SystemOptions = SystemOptions.fromXML(configWaterEffect, textureCircle);

		[Embed(source="../media/particles/bitParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigBit:Class;
		private static const configBit:XML = XML(new ConfigBit());
		private static const optionBit:SystemOptions = SystemOptions.fromXML(configBit, textureSquare);

		[Embed(source="../media/particles/hateParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigHate:Class;
		private static const configHate:XML = XML(new ConfigHate());
		private static const optionHate:SystemOptions = SystemOptions.fromXML(configHate, textureHate);

		[Embed(source="../media/particles/loveParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigLove:Class;
		private static const configLove:XML = XML(new ConfigLove());
		private static const optionLove:SystemOptions = SystemOptions.fromXML(configLove, textureLove);		

		[Embed(source="../media/particles/hateSwirlParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigHateSwirl:Class;
		private static const configHateSwirl:XML = XML(new ConfigHateSwirl());
		private static const optionHateSwirl:SystemOptions = SystemOptions.fromXML(configHateSwirl, textureHate);

		[Embed(source="../media/particles/likeMissleTrailParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigLikeMissleTrail:Class;
		private static const configLikeMissleTrail:XML = XML(new ConfigLikeMissleTrail());
		private static const optionLikeMissleTrail:SystemOptions = SystemOptions.fromXML(configLikeMissleTrail, textureArrow);

		[Embed(source="../media/particles/dislikeMissleTrailParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigDislikeMissleTrail:Class;
		private static const configDislikeMissleTrail:XML = XML(new ConfigDislikeMissleTrail());
		private static const optionDislikeMissleTrail:SystemOptions = SystemOptions.fromXML(configDislikeMissleTrail, textureArrow);

		[Embed(source="../media/particles/castingParticle.pex", mimeType="application/octet-stream")]
		private static const ConfigCasting:Class;
		private static const configCasting:XML = XML(new ConfigCasting());
		private static const optionCasting:SystemOptions = SystemOptions.fromXML(configCasting, textureCircle);

		//Each effect is named a pool because they're a collection of usable sprite objects; object pools.		
		public static const smokeTrailPool = new SpritePool(FFParticleSystem, 99, [optionSmokeTrail]);
		public static const hitPool = new SpritePool(FFParticleSystem, 99, [optionHit]);
		public static const apUpPool = new SpritePool(FFParticleSystem, 99, [optionApUp]);
		public static const apDownPool = new SpritePool(FFParticleSystem, 99, [optionApDown]);
		public static const slimeTrailPool = new SpritePool(FFParticleSystem, 99, [optionSlimeTrail]);
		public static const slimeySplashPool = new SpritePool(FFParticleSystem, 99, [optionSlimeySplash]);		
		public static const slimeyPinkSplashPool = new SpritePool(FFParticleSystem, 99, [optionSlimeyPinkSplash]);
		public static const corruptSlimeTrailPool = new SpritePool(FFParticleSystem, 99, [optionCorruptSlimeTrail]);
		public static const corruptSlimeySplashPool = new SpritePool(FFParticleSystem, 99, [optionCorruptSlimeySplash]);
		public static const explosionPool = new SpritePool(FFParticleSystem, 99, [optionExplosion]);
		public static const sodaExplosionPool = new SpritePool(FFParticleSystem, 99, [optionSodaExplosion]);
		public static const poofPool = new SpritePool(FFParticleSystem, 99, [optionPoof]);
		public static const poofForProjectilePool = new SpritePool(FFParticleSystem, 99, [optionPoof]);
		public static const blackMistPool = new SpritePool(FFParticleSystem, 99, [optionBlackMist]);		
		public static const corruptExplosionPool = new SpritePool(FFParticleSystem, 99, [optionCorruptExplosion]);
		public static const brownMisslePool = new SpritePool(FFParticleSystem, 99, [optionSodaTrail]);
		public static const shoopTrailPool = new SpritePool(FFParticleSystem, 99, [optionShoopTrail]);
		public static const shoopExplosionPool = new SpritePool(FFParticleSystem, 99, [optionShoopExplosion]);
		public static const prismTrailPool = new SpritePool(FFParticleSystem, 99, [optionPrismTrail]);
		public static const prismExplosionPool = new SpritePool(FFParticleSystem, 99, [optionPrismExplosion]);
		public static const moblingTrailPool = new SpritePool(FFParticleSystem, 99, [optionMoblingTrail]);
		public static const explosionCorePool = new SpritePool(FFParticleSystem, 99, [optionExplosionCore]);
		public static const sparkPool = new SpritePool(FFParticleSystem, 99, [optionSpark]);
		public static const sparkTrailPool = new SpritePool(FFParticleSystem, 99, [optionSparkTrail]);
		public static const corruptTrailPool = new SpritePool(FFParticleSystem, 99, [optionCorruptTrail]);
		public static const whiteMisslePool = new SpritePool(FFParticleSystem, 99, [optionSpamTrail]);
		public static const redMisslePool = new SpritePool(FFParticleSystem, 99, [optionRedMissleTrail]);
		public static const bloatPool = new SpritePool(FFParticleSystem, 99, [optionBloat]);
		public static const analyzePool = new SpritePool(FFParticleSystem, 99, [optionAnalyze]);
		public static const powUpPool = new SpritePool(FFParticleSystem, 99, [optionPowUp]);
		public static const defUpPool = new SpritePool(FFParticleSystem, 99, [optionDefUp]);
		public static const powDownPool = new SpritePool(FFParticleSystem, 99, [optionPowDown]);
		public static const defDownPool = new SpritePool(FFParticleSystem, 99, [optionDefDown]);
		public static const healPool = new SpritePool(FFParticleSystem, 99, [optionHeal]);
		public static const stunPool = new SpritePool(FFParticleSystem, 99, [optionStun]);
		public static const randomDataPool = new SpritePool(FFParticleSystem, 99, [optionRandomData]);
		public static const waterEffectPool = new SpritePool(FFParticleSystem, 99, [optionWaterEffect]);
		public static const bitPool = new SpritePool(FFParticleSystem, 99, [optionBit]);
		public static const oraclePool = new SpritePool(FFParticleSystem, 99, [optionOracle]);
		public static const hatePool = new SpritePool(FFParticleSystem, 99, [optionHate]);
		public static const lovePool = new SpritePool(FFParticleSystem, 99, [optionLove]);
		public static const hateSwirlPool = new SpritePool(FFParticleSystem, 99, [optionHateSwirl]);
		public static const likeMissleTrailPool = new SpritePool(FFParticleSystem, 99, [optionLikeMissleTrail]);
		public static const dislikeMissleTrailPool = new SpritePool(FFParticleSystem, 99, [optionDislikeMissleTrail]);
		public static const redCastingPool = new SpritePool(FFParticleSystem, 99, [optionCasting]);
		public static const greenMisslePool = new SpritePool(FFParticleSystem, 99, [optionGreenMissleTrail]);
		public static const purpleMisslePool = new SpritePool(FFParticleSystem, 99, [optionPurpleMissleTrail]);
		public static const orangeMisslePool = new SpritePool(FFParticleSystem, 99, [optionOrangeMissleTrail]);

		// SFX
		public static const woosh:Sound = new Woosh();
		public static const kaboom:Sound = new Kaboom();
		public static const run1:Sound = new GrassStep();		
		public static const squish1:Sound = new Squish1();
		public static const squish2:Sound = new Squish2(); 
		public static const slimeMove:Sound = new SlimeMove();
		public static const btnClick:Sound = new BtnClick();
		public static const error:Sound = new ErrorSound();
		public static const refresh:Sound = new Refresh();
		public static const powerUp:Sound = new PowerUp();
		public static const powerDown:Sound = new PowerDown();
		public static const shield:Sound = new Shield();
		public static const genericMissle:Sound = new GenericMissle();
		public static const rubberStretch1:Sound = new RubberStretch1();
		public static const rubberStretch2:Sound = new RubberStretch2();
		public static const rubberStretch3:Sound = new RubberStretch3();
		public static const rubberStretch4:Sound = new RubberStretch4();
		public static const rubberStretch5:Sound = new RubberStretch5();
		public static const hit1:Sound = new Hit1();
		public static const hit2:Sound = new Hit2();
		public static const hit3:Sound = new Hit3();
		public static const hit4:Sound = new Hit4();
		public static const hit5:Sound = new Hit5();		
		public static const penguinSound:Sound = new PenguinSound();
		public static const dogBark1Sound:Sound = new DogBark1();
		public static const dogBark2Sound:Sound = new DogBark2();
		public static const hoverMove:Sound = new HoverMove();
		public static const death:Sound = new Death();
		public static const abilityTargetedSound:Sound = new Bloop();
		public static const abilityQueuedSound:Sound = new BounceBloop();
		public static const slotReadySound:Sound = new SeatbeltBloop();
		public static const gunshot:Sound = new Gunshot();		
		public static var canPlayPowerUp:Boolean = true;
		public static var canPlayPowerDown:Boolean = true;

		// TEST
		// public static const battle0:Sound = new Woosh();
		// public static const battle1:Sound = new Woosh();
		// public static const battle2:Sound = new Woosh();
		// public static const battle3:Sound = new Woosh();
		// public static const battle4:Sound = new Woosh();
		// public static const battle5:Sound = new Woosh();
		// public static const topMusic:Sound = new Woosh();
		// public static const betrayed:Sound = new Woosh();
		// public static const ending:Sound = new Woosh();
		// public static const gamergate:Sound = new Woosh();
		// public static const hateVirus:Sound = new Woosh();
		// public static const hiveMind:Sound = new Woosh();
		// public static const intro:Sound = new Woosh();
		// public static const malphaware:Sound = new Woosh();
		// public static const minigame:Sound = new Woosh();
		// public static const oracle:Sound = new Woosh();
		// public static const prism:Sound = new Woosh();
		// public static const training:Sound = new Woosh();
		// public static const hateVirusConversation:Sound = new Woosh();
		// public static const alphaWolfOmegaPenguin:Sound = new Woosh();

		// public static function playMusic(song:Sound):void{
		// 	stopMusic();
		// 	currentMusic = song;						
		// 	musicChannel = song.play(GV.AUDIO_START_TIME, 1, GV.bgm);
		// }

		//BGM
		public static const battle0:Sound = new Battle0();
		public static const battle1:Sound = new Battle1();
		public static const battle2:Sound = new Battle2();
		public static const battle3:Sound = new Battle3();
		public static const battle4:Sound = new Battle4();
		public static const battle5:Sound = new Battle5();	
		public static const topMusic:Sound = new TopMusic();
		public static const betrayed:Sound = new Betrayed();
		public static const ending:Sound = new Ending();
		public static const gamergate:Sound = new GamergateSound();
		public static const hateVirus:Sound = new HateVirusSound();
		public static const hiveMind:Sound = new HiveMindSound();
		public static const intro:Sound = new Intro();
		public static const malphaware:Sound = new MalphawareSound();		
		public static const minigame:Sound = new Minigame();
		public static const oracle:Sound = new OracleSound();
		public static const prism:Sound = new PrismSound();
		public static const training:Sound = new Training();
		public static const hateVirusConversation:Sound = new HateVirusConversation();
		public static const alphaWolfOmegaPenguin:Sound = new AlphaWolfOmegaPenguin();

		public static function playMusic(song:Sound):void{
			stopMusic();
			currentMusic = song;			
			musicChannel = song.play(GV.AUDIO_START_TIME, 9999, GV.bgm);			
		}

		public static var run1Channel:SoundChannel = new SoundChannel();		
		public static var speechChannel:SoundChannel = new SoundChannel();
		public static var slimeMoveChannel:SoundChannel = new SoundChannel();
		public static var hoverMoveChannel:SoundChannel = new SoundChannel();
		public static var battleThemeSurfaceChannel:SoundChannel = new SoundChannel();
		public static var musicChannel:SoundChannel = new SoundChannel();
		public static var currentMusic:Sound;		

		public static function stopMusic():void{
			currentMusic = null;
			stopSoundChannel(musicChannel);
		}	

		public static function runSound1Play():void{runSound1Stop(); run1Channel = run1.play(GV.AUDIO_START_TIME, 9999, GV.sfx);}
		public static function runSound1Stop():void{stopSoundChannel(run1Channel);}
		public static function playSlimeMove():void{stopSlimeMove(); slimeMoveChannel = slimeMove.play(GV.AUDIO_START_TIME, 9999, GV.sfx);}
		public static function stopSlimeMove():void{stopSoundChannel(slimeMoveChannel);}
		public static function playHoverMove():void{stopHoverMove(); hoverMoveChannel = hoverMove.play(GV.AUDIO_START_TIME, 9999, GV.sfx);}
		public static function stopHoverMove():void{stopSoundChannel(hoverMoveChannel);}		
		public static function playHit():void{
			var soundFx = Math.floor(Math.random()*5);
			switch(soundFx){
				case 0: hit1.play(GV.AUDIO_START_TIME, 0, GV.sfx);
				case 1: hit2.play(GV.AUDIO_START_TIME, 0, GV.sfx);
  				case 2: hit3.play(GV.AUDIO_START_TIME, 0, GV.sfx);
				case 3: hit4.play(GV.AUDIO_START_TIME, 0, GV.sfx);
				default: hit5.play(GV.AUDIO_START_TIME, 0, GV.sfx);
			}
		}

		public static function playPowerDown():void{
			if(canPlayPowerDown){
				canPlayPowerDown = false;
				powerDown.play(GV.AUDIO_START_TIME, 0, GV.sfx);
				setTimeout(function(){
					canPlayPowerDown = true;
				},  100);
			}			
		}

		public static function playPowerUp():void{
			if(canPlayPowerUp){
				canPlayPowerUp = false;
				powerUp.play(GV.AUDIO_START_TIME, 0, GV.sfx);
				setTimeout(function(){
					canPlayPowerUp = true;
				},  100);
			}			
		}

		public static function stopSoundChannel(sc:SoundChannel){
			if(sc) sc.stop();
		}

		public static function showParticleEffect(pool:SpritePool, emitterX:int = 0, emitterY:int = 0, emitDuration:Number = 0.1, behindCombatants:Boolean = false):FFParticleSystem{	
			if(!GV.arena) return null;
			var p:FFParticleSystem = pool.getSprite() as FFParticleSystem;
			if(behindCombatants){
				GV.arena.belowCombatantContainer.addChild(p);
			}else{
				GV.arena.aboveCombatantContainer.addChild(p);
			}
			GV.s.juggler.add(p);
			p.emitterX = emitterX;
			p.emitterY = emitterY;
			if(!p.hasEventListener(Event.COMPLETE)){
				p.addEventListener(Event.COMPLETE, function():void{
				 	GV.arena.aboveCombatantContainer.removeChild(p);
					GV.s.juggler.remove(p);
					pool.returnSprite(p);
				});
			}
			if(emitDuration > 0){
				p.start(emitDuration);
			}else if(emitDuration == 0){
				p.start();
			}
			return p;
		}

		public static function showExplosion(emitterX:int = 0, emitterY:int = 0, emitDuration:Number = 0):void{
			kaboom.play(GV.AUDIO_START_TIME, 0, GV.sfx);
			FX.showParticleEffect(FX.explosionCorePool, emitterX, emitterY, emitDuration);
			FX.showParticleEffect(FX.explosionPool, emitterX, emitterY, emitDuration);
			FX.showParticleEffect(FX.sparkPool, emitterX, emitterY, emitDuration);
			GV.arena.shakeAnimation(200);
		}

		public static function stopAllSound():void{
			SoundMixer.stopAll();
		}
	}
}

