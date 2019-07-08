public function areEqual(a:Array,b:Array):Boolean{
    if(a.length != b.length){
        return false;
    }
    var len:int = a.length;
    for(var i:int = 0, ilen:int = len; i < ilen; i++){
        if(a[i] !== b[i]){
            return false;
        }
    }
    return true;
}

public function between(min:Number , value:Number , max:Number):Boolean{
    return min > value ? false : ( max < value ? false : true );
}

public function distanceBetween(pos1:Array, pos2:Array):int{
    var xd:int = Math.abs(pos1[0] - pos2[0]);
    var yd:int = Math.abs(pos1[1] - pos2[1]);
    return Math.max(xd, yd);
}

public function perpindicular(pos1:Array, pos2:Array):Boolean{
    return(pos1[0] == pos2[0] || pos1[1] == pos2[1]);
}

public function cleanNulls(a:Array):void{
    var i:int = 0;
    while(i < a.length){
        if(!a[i]){
            a.splice(i, 1);
        }else{
            i++
        }
    }
}

public function superNull(obj:Object):void{
    if(obj){        
        if(obj.hasOwnProperty('dispose')) obj.dispose();
    }      
}

public function returnColor(id:int):uint{
    switch(id){
        case 0: return 0x00CCCC; break;
        case 1: return 0xCC0000; break;
        case 2: return 0x00CC00; break; 
    }
    return 0x555555;
}

public function returnColorText(id:int):String{
    switch(id){
        case 0: return 'BLUE'; break;
        case 1: return 'RED'; break;
        case 2: return 'GREEN'; break; 
    }
    return 'PAUSE';
}

public function msToHours(ms:Number):String{
    var seconds:int = Math.round(ms * 0.001);
    var mins:int = Math.floor(seconds/60);
    var hours:int = Math.floor(mins/60);
    var leadingZeroForSeconds = (seconds % 60 >= 10 ? '': '0')
    var leadingZeroForMinutes = (mins % 60 >= 10 ? '': '0')
    return hours + ":" + leadingZeroForMinutes + (mins % 60) + ":" + leadingZeroForSeconds + (seconds % 60);
}