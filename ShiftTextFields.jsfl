fl.outputPanel.clear();

var dx;
var dy;
var timelines = fl.getDocumentDOM().timelines;
var library = fl.getDocumentDOM().library;
var items = library.items;
var fieldTypes = String( prompt( "TextField types to shift", "static, dynamic, input" ) ).toLowerCase();
var count = 0;

// ensure numbers were entered for shift values;
while ( isNaN( dx ) || isNaN( dy ) ) promptForShiftValues();

// adjust main timeline of all scenes;
for ( var i = 0; i < timelines.length; i++ ) shiftTextFieldsInTimeline( timelines[ i ] );

// loop through library;
for ( i = 0; i < items.length; i++ ) if ( items[ i ].itemType == "movie clip" ) shiftTextFieldsInTimeline( items[ i ].timeline );

function promptForShiftValues () 
{	
	if ( isNaN( dx ) ) dx = Math.round( Number( prompt( "Enter pixel shift for TextField x values", "0" ) ) );
	if ( isNaN( dy ) ) dy = Math.round( Number( prompt( "Enter pixel shift for TextField y values", "0" ) ) );
}

function shiftTextFieldsInTimeline ( timeline )
{
	var i = timeline.layerCount;

	while ( i-- )
	{
		var j = timeline.layers[ i ].frameCount;
		
		while ( j-- )
		{
			var element;
			var elements = timeline.layers[ i ].frames[ j ].elements;
			var k = elements.length;
			
			if ( j != timeline.layers[ i ].frames[ j ].startFrame ) continue;
			
			while ( k-- )
			{
				element = elements[ k ];
				
				if ( element.elementType == "text" && fieldTypes.indexOf( element.textType ) > -1 )
				{
					element.x = Math.round( element.x + dx );
					element.y = Math.round( element.y + dy );
					
					count++;
				}
			}	
		}
	}
}

fl.trace( count + " TextFields shifted by ( " + dx + ", " + dy + " );" );