package classes {

    import starling.display.Sprite;
    import starling.events.Event;
    import starling.text.TextField;
    import starling.textures.Texture;
    import starling.text.BitmapFont;
    import starling.animation.Transitions;
    import flash.text.Font;
    import flash.utils.*;

    public class SC extends Sprite {

        [Embed(source='../media/fonts/orbitron.fnt', mimeType='application/octet-stream')]
        public static const OrbitronXML:Class;

         public function SC() {
            super();
            this.addEventListener(starling.events.Event.ADDED_TO_STAGE, initialize);
            GV.sc = this;

            Transitions.register("SINE", function(ratio:Number):Number
            {
               if (ratio == 0.0 || ratio == 1.0) return ratio;
               else return Math.sin(getTimer() / 300);
            });

            Transitions.register("SINENEG", function(ratio:Number):Number
            {
               if (ratio == 0.0 || ratio == 1.0) return ratio;
               else return -1*(Math.sin(getTimer() / 300));
            });
        }

        private function initializeFonts():void{
            var texture:Texture = Assets.getAtlasTexture(GV.HUD_SPRITESHEET, 'orbitron')
            var xml:XML = XML(new OrbitronXML());
            TextField.registerBitmapFont(new BitmapFont(texture, xml)); 
        }

         protected function initialize(e:starling.events.Event):void {
            initializeFonts();
        }

        public function clearStarlingContainer():void{
            GV.s.juggler.purge();
            while (numChildren > 0) {
                removeChildAt(0);
            }
            if(GV.stage.avatar){
               GV.stage.avatar.preDispose();
               GV.stage.avatar.dispose();
            }
        }
    }
}
