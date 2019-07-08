public function customHeuristic(firstTile:Tile, destinationTile:Tile):Number{
    var xd:Number = Math.abs(firstTile.pos[0] - destinationTile.pos[0]);
    var yd:Number = Math.abs(firstTile.pos[1] - destinationTile.pos[1]);
    var diagonalPenalty = 0
    if(firstTile.pos[0] != pos[0]){
        diagonalPenalty+=0.1;
    }
    if(firstTile.pos[1] != pos[1]){
        diagonalPenalty+=0.1;
    }
    return Math.max(xd, yd) + diagonalPenalty;
}

public function findConnectedTiles( tile:Tile ):Array{
	var connectedTiles:Array = [];
	var topLeftX:int = tile.pos[0] - 1;
	var topLeftY:int = tile.pos[1] - 1;
	var bottomRightX:int = tile.pos[0] + 1;
	var bottomRightY:int = tile.pos[1] + 1;

	for (var i:int = topLeftX; i < bottomRightX + 1; i++){
		for (var j:int = topLeftY; j < bottomRightY + 1; j++){
			var testTile:Tile = GV.arena.getTile([i, j]);
			if(testTile){
				if( testTile != tile){
					connectedTiles.push(testTile);
				}
			}
		}
	}
	return connectedTiles;
}

public static function isOpen(tile:Tile, openTiles:Array):Boolean {
	var l:int = openTiles.length;
	for (var i:int = 0; i < l; ++i) {
		if( openTiles[i] == tile ) return true;
	}
	return false;
}

public static function isClosed(tile:Tile, closedTiles:Array):Boolean {
	var l:int = closedTiles.length;
	for (var i:int = 0; i < l; ++i) {
		if(closedTiles[i] == tile ) return true;
	}
	return false;
}

public function tileToMoveTo(firstTile:Tile, destinationTile:Tile):Array{

    var openTiles:Array = [];
    var closedTiles:Array = [];
    var path:Array = [];
    var currentTile:Tile = firstTile;
    var testTile:Tile;
    var l:int;
    var i:int;
    var connectedTiles:Array;
    var travelCost:Number = 1.0;
    var g:Number;
    var h:Number;
    var f:Number;
    currentTile.g = 0;
    currentTile.h = heuristicFunc(currentTile, destinationTile);
    currentTile.f = currentTile.g + currentTile.h;

	while (currentTile != destinationTile) {
        connectedTiles = findConnectedTiles( currentTile );


        l = connectedTiles.length;

        for (i = 0; i < l; ++i) {

            testTile = connectedTiles[i];

            if(testTile == currentTile || testTile.traversableForAI == false) continue;

            g = currentTile.g + travelCost;
            h = heuristicFunc(testTile, destinationTile);
            f = g + h;

            if( isOpen(testTile, openTiles) || isClosed( testTile, closedTiles) ){

                if(testTile.f > f)
                {
                    testTile.f = f;
                    testTile.g = g;
                    testTile.h = h;
                    testTile.parentTile = currentTile;
                }
            }
            else {
                testTile.f = f;
                testTile.g = g;
                testTile.h = h;
                testTile.parentTile = currentTile;
                openTiles.push(testTile);
            }

        }

        closedTiles.push( currentTile );

        if(openTiles.length == 0) {
            if(closedTiles.length){           
                var closestClosedTile:Tile = closedTiles[0];
                var currLowestCost = closedTiles[0].h;
                for(i = 1; i < closedTiles.length; i++){
                    var currTile:Tile = closedTiles[i];
                    if(currTile.h < currLowestCost){
                        currLowestCost = currTile.h;
                        closestClosedTile = currTile;
                    }
                }
                return buildPath(closestClosedTile, firstTile);
            }
            return null;
        }

        openTiles.sortOn('f', Array.NUMERIC);
        currentTile = openTiles.shift() as Tile;

    }

    return buildPath(destinationTile, firstTile);
}

public static function buildPath(destinationTile:Tile, firstTile:Tile):Array{
    var path:Array = [];
    var tile:Tile = destinationTile;
    path.push(tile);
    while (tile != firstTile) {
        tile = tile.parentTile;
        path.unshift( tile );
    }
    return path;
}