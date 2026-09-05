package com.game
{
   import flash.display.MovieClip;
   
   public class DownMc extends MovieClip
   {
      
      private var _downMc:MovieClip;
      
      private var _array:Array;
      
      public function DownMc()
      {
         super();
         init();
      }
      
      private function init() : void
      {
         _downMc = new GameUI_donwMc();
         addChild(_downMc);
         randomBoard(_downMc);
      }
      
      public function destroy() : void
      {
         _downMc = null;
         _array = null;
      }
      
      private function randomBoard(mc:MovieClip) : void
      {
         _array = new Array();
         for(var i:int = 0; i < mc.numChildren - 1; i++)
         {
            mc["down_" + i].y = Math.random() * 400 + 100;
            _array.push(mc["down_" + i]);
            mc["down_" + i].guang_mc.gotoAndStop(1);
         }
         mc["down_" + 5].guang_mc.gotoAndStop(1);
      }
      
      public function getArray() : Array
      {
         var ran:int = 0;
         var ranl:int = 0;
         var arr:Array = new Array();
         while(_array.length > 0)
         {
            ran = int(_array.length);
            ranl = int(Math.random() * ran);
            arr.push(_array[ranl]);
            _array.splice(ranl,1);
         }
         arr.push(_downMc["down_" + 5]);
         return arr;
      }
   }
}

