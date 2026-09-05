package src.com
{
   public class RedPao extends BasePao
   {
      
      public function RedPao()
      {
         super();
      }
      
      override public function initPao() : void
      {
         _cB = true;
         _pao = new GoodPao();
         addChild(_pao);
         _pao.x = _pao.width / 2 + 258 + Math.random() * (416 - _pao.width);
         _pao.y = 560;
      }
   }
}

