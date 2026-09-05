package ui
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class NearbyArrowHead extends Sprite
   {
      
      private var _nearbyAH:MovieClip;
      
      public function NearbyArrowHead()
      {
         super();
         _nearbyAH = new NearbyAhMC();
         this.addChild(_nearbyAH);
         this.visible = false;
      }
      
      public function showNearbyAH(arr:Array) : void
      {
         this.visible = true;
         var leftMb:MatterBlock = arr[0];
         var rightMb:MatterBlock = arr[1];
         var topMb:MatterBlock = arr[2];
         var bottomMb:MatterBlock = arr[3];
         if(Boolean(leftMb) && !leftMb.bFilled)
         {
            _nearbyAH["t1"].visible = true;
         }
         else
         {
            _nearbyAH["t1"].visible = false;
         }
         if(Boolean(rightMb) && !rightMb.bFilled)
         {
            _nearbyAH["t2"].visible = true;
         }
         else
         {
            _nearbyAH["t2"].visible = false;
         }
         if(Boolean(topMb) && !topMb.bFilled)
         {
            _nearbyAH["t3"].visible = true;
         }
         else
         {
            _nearbyAH["t3"].visible = false;
         }
         if(Boolean(bottomMb) && !bottomMb.bFilled)
         {
            _nearbyAH["t4"].visible = true;
         }
         else
         {
            _nearbyAH["t4"].visible = false;
         }
      }
   }
}

