package com.robot.module.game.spritePieceTogether
{
   import flash.display.MovieClip;
   import flash.utils.getDefinitionByName;
   
   public class SpritePiece extends MovieClip
   {
      
      public var type:uint;
      
      private var mc:MovieClip;
      
      public function SpritePiece(i:uint)
      {
         super();
         type = i;
         mc = new SpritePieceData.pieceArr[i]();
         this.addChild(mc);
         mc.gotoAndStop(2);
         var str:String = SpritePieceData.pieceArr[i].toString();
         this.name = str.split("_")[0].split(" ")[1] + "_" + str.split("_")[1].substr(0,1);
      }
   }
}

