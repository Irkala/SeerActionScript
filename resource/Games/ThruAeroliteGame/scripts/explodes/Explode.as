package explodes
{
   import com.ming.managers.utils.display.DisplayUtil;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.utils.getDefinitionByName;
   
   public class Explode extends BasicElement
   {
      
      public static const MIN_EXPLODE:uint = 0;
      
      public static const Burst_EXPLODE:uint = 1;
      
      public static const Unit_EXPLODE:uint = 2;
      
      public static const Boss_EXPLODE:uint = 3;
      
      private var ExplodeArr:Array = [MinExplpdeMC,BurstExplodeMC,UnitExplodeMC,BossExplodeMC];
      
      private var _explodeMC:MovieClip;
      
      public function Explode(type:uint)
      {
         super();
         _explodeMC = new ExplodeArr[type]();
         this.addChild(_explodeMC);
         explode();
      }
      
      private function explode() : void
      {
         if(_explodeMC == null)
         {
            return;
         }
         _explodeMC.gotoAndPlay(2);
         _explodeMC.addEventListener(Event.ENTER_FRAME,function():void
         {
            if(_explodeMC.currentFrame == _explodeMC.totalFrames)
            {
               this.erasable = true;
               _explodeMC.removeEventListener(Event.ENTER_FRAME,arguments.callee);
               DisplayUtil.removeForParent(_explodeMC);
               _explodeMC = null;
            }
         });
      }
   }
}

