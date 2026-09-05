package src.com
{
   public class HouPao extends BasePao
   {
      
      public function HouPao()
      {
         super();
      }
      
      override public function enterFrame() : void
      {
         if(_pao)
         {
            _pao.y -= (700 - _pao.y) * 0.02;
         }
      }
      
      override public function initPao() : void
      {
         _cB = false;
         _pao = new HouPao_ui();
         addChild(_pao);
         var ran:Number = int(5 + Math.random() * 5) * 0.1;
         _pao.scaleX = ran;
         _pao.scaleY = ran;
         _pao.x = _pao.width / 2 + 258 + Math.random() * (416 - _pao.width);
         _pao.y = 560;
      }
   }
}

