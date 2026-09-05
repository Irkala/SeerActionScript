package src.com
{
   public class BluePao extends BasePao
   {
      
      public function BluePao()
      {
         super();
      }
      
      override public function initPao() : void
      {
         _cB = false;
         _pao = new BadPao();
         addChild(_pao);
         _pao.x = _pao.width / 2 + 258 + Math.random() * (416 - _pao.width);
         _pao.y = 560;
      }
   }
}

