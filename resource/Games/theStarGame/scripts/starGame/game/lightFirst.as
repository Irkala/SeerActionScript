package starGame.game
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.filters.ColorMatrixFilter;
   
   public class lightFirst extends MovieClip
   {
      
      private var isJ:Boolean = false;
      
      private var _level:int;
      
      private var _words_mc:MovieClip;
      
      private var _light:MovieClip;
      
      private var _star_name:String;
      
      public function lightFirst(l:int, s:String)
      {
         super();
         _star_name = s;
         _level = l;
         init();
      }
      
      public function removeThis() : void
      {
         if(_words_mc)
         {
            _words_mc.removeEventListener(Event.ENTER_FRAME,alphaEvent);
            removeChild(_words_mc);
            _words_mc = null;
         }
         if(_light)
         {
            _light.removeEventListener(Event.ENTER_FRAME,lightEvent);
            removeChild(_light);
            _light = null;
         }
      }
      
      private function lightEvent(e:Event) : void
      {
         if(_light.light_mc.currentFrame == 10)
         {
            addWords();
         }
         if(_light.light_mc.currentFrame >= 59)
         {
            _light.removeEventListener(Event.ENTER_FRAME,lightEvent);
            removeChild(_light);
            _light = null;
         }
      }
      
      private function addWords() : void
      {
         _words_mc = new WordsUI_StarGame();
         var le:int = int(_level + 1);
         _words_mc.level_mc.gotoAndStop(le);
         _words_mc.star_txt.text = _star_name;
         _words_mc.star_txt.filters = [new ColorMatrixFilter()];
         _words_mc.x = 390;
         _words_mc.y = 208;
         _words_mc.alpha = 0;
         addChild(_words_mc);
         _words_mc.addEventListener(Event.ENTER_FRAME,alphaEvent);
      }
      
      private function init() : void
      {
         isJ = false;
         _light = new LightUI_StarGame();
         _light.x = 450;
         _light.y = 360;
         addChild(_light);
         _light.addEventListener(Event.ENTER_FRAME,lightEvent);
      }
      
      private function alphaEvent(e:Event) : void
      {
         if(isJ)
         {
            _words_mc.alpha -= 0.02;
         }
         else
         {
            _words_mc.alpha += 0.02;
         }
         if(_words_mc.alpha > 1)
         {
            isJ = true;
         }
         else if(_words_mc.alpha < 0)
         {
            _words_mc.removeEventListener(Event.ENTER_FRAME,alphaEvent);
            removeChild(_words_mc);
            _words_mc = null;
            this.dispatchEvent(new Event("goingame"));
         }
      }
   }
}

