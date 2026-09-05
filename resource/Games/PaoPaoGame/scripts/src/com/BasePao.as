package src.com
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class BasePao extends Sprite
   {
      
      public var _cB:Boolean;
      
      public var _pao:MovieClip;
      
      public function BasePao()
      {
         super();
         initPao();
      }
      
      public function enterFrame() : void
      {
         if(_pao)
         {
            _pao.y -= (700 - _pao.y) * 0.01;
         }
      }
      
      public function initPao() : void
      {
      }
      
      public function destroy() : void
      {
         removeChild(_pao);
         _pao = null;
      }
   }
}

