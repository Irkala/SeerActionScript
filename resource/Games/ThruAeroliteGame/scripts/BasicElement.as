package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import layers.Layer;
   
   public class BasicElement extends MovieClip
   {
      
      public var erasable:Boolean;
      
      public var explodeType:int;
      
      public var speed:Number;
      
      public var stageSpeed:Number = 1;
      
      public var moveable:Boolean;
      
      public var moverange:Array;
      
      public var layer:Layer;
      
      public var explodeable:Boolean;
      
      public function BasicElement()
      {
         super();
         erasable = false;
         explodeable = false;
         moverange = [0,GameSettings.sceneWidth,0,GameSettings.sceneHeight];
         this.addEventListener(Event.ENTER_FRAME,onEntFrame,false,0,true);
      }
      
      protected function onEntFrame(evt:Event) : void
      {
         if(isInRange())
         {
            move();
         }
      }
      
      public function removeEvent() : void
      {
         this.removeEventListener(Event.ENTER_FRAME,onEntFrame);
      }
      
      protected function isInRange() : Boolean
      {
         if(!moverange)
         {
            return true;
         }
         if(this.x >= moverange[0] && this.x <= moverange[1] && this.y >= moverange[2] && this.y < moverange[3])
         {
            return true;
         }
         if(this.parent)
         {
            this.parent.setChildIndex(this,0);
         }
         erasable = true;
         removeEvent();
         return false;
      }
      
      protected function move() : void
      {
      }
   }
}

