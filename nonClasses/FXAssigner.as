public function fxAssigner():void{

    hitEffectTime = 0.15;
    trailSpacing = 200;
    hitPool = FX.hitPool;
    movementTrailPool = FX.smokeTrailPool;
    projectileTrailPool = FX.smokeTrailPool;

    switch(unitType){

        case 'Malware':
            movementTrailPool = FX.slimeTrailPool;
            hitPool = FX.slimeySplashPool;
            hitEffectTime = 0.2;
        break;
        case 'CorruptedMalware':
            movementTrailPool = FX.corruptSlimeTrailPool;
            hitPool = FX.corruptSlimeySplashPool;
            hitEffectTime = 0.2;
        break;
        case 'Malphaware':
            movementTrailPool = FX.corruptSlimeTrailPool;
            hitPool = FX.corruptSlimeySplashPool;
            projectileTrailPool = FX.corruptSlimeySplashPool;
            hitEffectTime = 0.2;
        break;
        case 'HiveMind':
            projectileTrailPool = FX.moblingTrailPool;
        break;
        case 'Spambot':
            projectileTrailPool = FX.whiteMisslePool;
        break;
        case 'Scumbag':
            projectileTrailPool = FX.brownMisslePool;
        break;
        case 'Flamer':
            movementTrailPool = FX.explosionCorePool;
            projectileTrailPool = FX.sparkTrailPool;
        break;
        case 'Mobling':
            projectileTrailPool = FX.redMisslePool;
        break;
        case 'FakeNews':
            projectileTrailPool = FX.smokeTrailPool;
        break;
        case 'HateVirus':
            projectileTrailPool = FX.hatePool;
        break;
        case 'UserData':
            projectileTrailPool = FX.greenMisslePool;
        break;
    }
}