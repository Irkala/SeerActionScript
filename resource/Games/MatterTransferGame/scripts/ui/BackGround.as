package ui
{
   import data.MapData;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class BackGround extends Sprite
   {
      
      private static const cols:uint = Math.round(MapData.stgWidth / MapData.blockWidth);
      
      private static const rows:uint = Math.round(MapData.stgHeight / MapData.blockHeight);
      
      public function BackGround()
      {
         super();
         this.addChild(drawBg());
      }
      
      public function drawBg() : Sprite
      {
         var j:uint = 0;
         var b:Block = null;
         var bgSprite:Sprite = new Sprite();
         for(var i:uint = 0; i < 2 * rows + 2; i++)
         {
            for(j = 0; j < cols + 1; j++)
            {
               b = new Block();
               bgSprite.addChild(b);
               if(i % 2 == 0)
               {
                  b.x = j * MapData.blockWidth;
                  b.setMc(1);
               }
               else
               {
                  b.x = j * MapData.blockWidth - MapData.blockWidth / 2;
                  b.setMc(2);
               }
               b.y = i * MapData.blockHeight / 2;
               b.txt.text = j + "|" + i;
               b.txt.textColor = 6684671;
               MapData.gameMapDic[i + "_" + j] = new Point(b.x,b.y);
            }
         }
         return bgSprite;
      }
   }
}

