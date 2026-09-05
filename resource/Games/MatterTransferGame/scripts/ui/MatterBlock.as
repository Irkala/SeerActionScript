package ui
{
   import data.MapData;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Point;
   import flash.text.TextField;
   
   public class MatterBlock extends Sprite
   {
      
      public var type:uint = 1;
      
      public var maxEnergy:uint;
      
      public var energy:uint;
      
      private var _nearbyBlockArr:Array = [];
      
      private var mc:MovieClip;
      
      private var _position:Point;
      
      public var rows:uint;
      
      public var clickable:Boolean = false;
      
      public var bFilled:Boolean = false;
      
      public var energyCost:uint = 1;
      
      public var cols:uint;
      
      public var targetID:Array;
      
      public function MatterBlock(r:uint, c:uint, t:uint)
      {
         super();
         type = t;
         this.rows = r;
         this.cols = c;
         mc = new MatterBlockMC();
         this.addChild(mc);
         mc.gotoAndStop(type);
         _position = MapData.gameMapDic[this.rows + "_" + this.cols];
         switch(type)
         {
            case 1:
               break;
            case 2:
               energyCost = 0;
               energy = 5;
               break;
            case 3:
               energyCost = 0;
               energy = 10;
               break;
            case 4:
               maxEnergy = 5;
               break;
            case 5:
            case 6:
         }
         var txt:TextField = new TextField();
         txt.x = -15;
         txt.y = -15;
         txt.text = c + "|" + r;
         txt.textColor = 16711680;
         txt.mouseEnabled = false;
      }
      
      public function get nearbyBlockArr() : Array
      {
         return [leftMb,rightMb,topMb,bottomMb];
      }
      
      public function get topMb() : MatterBlock
      {
         return MapData.gameBlockDic[_position.x - MapData.blockWidth / 2 + "_" + (_position.y - MapData.blockHeight / 2)];
      }
      
      public function get rightMb() : MatterBlock
      {
         return MapData.gameBlockDic[_position.x + MapData.blockWidth / 2 + "_" + (_position.y - MapData.blockHeight / 2)];
      }
      
      public function get bottomMb() : MatterBlock
      {
         return MapData.gameBlockDic[_position.x + MapData.blockWidth / 2 + "_" + (_position.y + MapData.blockHeight / 2)];
      }
      
      public function set nearbyBlockArr(arr:Array) : void
      {
         _nearbyBlockArr = arr;
      }
      
      public function get leftMb() : MatterBlock
      {
         return MapData.gameBlockDic[_position.x - MapData.blockWidth / 2 + "_" + (_position.y + MapData.blockHeight / 2)];
      }
   }
}

