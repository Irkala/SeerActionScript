package starGame.game
{
   public class StarArray
   {
      
      private static const star_baiyang:Array = new Array("白羊座","Star_baiyang",5,0,0,["0102","0203","0304","0405"],2,1);
      
      private static const star_tianquan:Array = new Array("天犬座","Star_tianquan",6,0,0,["0102","0203","0304","0405","0206"],1,27);
      
      private static const star_tianmao:Array = new Array("天猫座","Star_tianmao",6,0,0,["0102","0203","0304","0405","0506"],2,24);
      
      private static const star_shuangzi:Array = new Array("双子座","Star_shuangzi",6,0,0,["0102","0203","0304","0405","0506"],3,15);
      
      private static const star_juxie:Array = new Array("巨蟹座","Star_juxie",6,0,0,["0102","0203","0205","0405","0506"],3,7);
      
      private static const star_tiangping:Array = new Array("天平座","Star_tiangping",6,0,0,["0102","0203","0304","0205","0306"],3,25);
      
      private static const star_tiange:Array = new Array("天鸽座","Star_tiange",6,0,0,["0102","0203","0304","0405","0306"],3,19);
      
      private static const star_haitun:Array = new Array("海豚座","Star_haitun",6,0,0,["0102","0203","0304","0405","0106","0306"],4,5);
      
      private static const star_tianxie:Array = new Array("天蝎座","Star_tianxie",6,0,0,["0102","0203","0304","0405","0406"],3,29);
      
      private static const star_tiane:Array = new Array("天鹅座","Star_tiane",7,0,0,["0102","0203","0304","0306","0405","0607"],3,18);
      
      private static const star_tianhe:Array = new Array("天鹤座","Star_tianhe",7,0,0,["0102","0203","0304","0405","0306","0307"],3,20);
      
      private static const star_tiantu:Array = new Array("天兔座","Star_tiantu",7,0,0,["0102","0203","0304","0305","0506","0507"],2,28);
      
      private static const star_shuipin:Array = new Array("水瓶座","Star_shuipin",8,0,0,["0102","0203","0304","0405","0206","0207","0708"],3,16);
      
      private static const star_jingniu:Array = new Array("金牛座","Star_jingniu",8,0,0,["0102","0203","0304","0405","0607","0307","0308"],2,6);
      
      private static const star_tianma:Array = new Array("飞马座","Star_tianma",8,0,0,["0102","0203","0304","0405","0306","0307","0708"],3,23);
      
      private static const star_tianying:Array = new Array("天鹰座","Star_tianying",8,0,0,["0102","0203","0304","0405","0506","0407","0408"],3,30);
      
      private static const star_fenghuang:Array = new Array("凤凰座","Star_fenghuang",8,0,0,["0102","0203","0304","0405","0506","0607","0308","0508"],3,4);
      
      private static const star_mojie:Array = new Array("魔羯座","Star_mojie",9,0,0,["0104","0204","0304","0405","0506","0607","0708","0809"],3,10);
      
      private static const star_shizi:Array = new Array("狮子座","Star_shizi",9,0,0,["0102","0203","0304","0405","0506","0307","0708","0809"],3,13);
      
      private static const star_tianqing:Array = new Array("天琴座","Star_tianqing",9,0,0,["0102","0203","0304","0405","0506","0607","0708","0809","0609"],2,26);
      
      private static const star_tianlang:Array = new Array("天狼座","Star_tianlang",9,0,0,["0102","0203","0304","0405","0506","0607","0708","0809","0308"],3,21);
      
      private static const star_chunv:Array = new Array("处女座","Star_chunv",10,0,0,["0102","0203","0304","0405","0407","0607","0708","0809","0910","0110"],2,2);
      
      private static const star_shuangyu:Array = new Array("双鱼座","Star_shuangyu",10,0,0,["0102","0203","0304","0405","0506","0607","0708","0809","0910","0710"],3,14);
      
      private static const star_keque:Array = new Array("孔雀座","Star_keque",10,0,0,["0102","0203","0304","0405","0506","0607","0708","0809","0209","0210"],2,8);
      
      private static const star_shefu:Array = new Array("蛇夫座","Star_shefu",10,0,0,["0102","0203","0304","0405","0506","0608","0708","0609","0610"],3,12);
      
      private static const star_liehu:Array = new Array("猎户座","Star_liehu",11,0,0,["0102","0203","0304","0405","0506","0607","0309","0910","1011","0811","0508"],2,9);
      
      private static const star_renma:Array = new Array("人马座","Star_renma",11,0,0,["0102","0203","0304","0405","0207","0607","0708","0709","0910","0811"],3,11);
      
      private static const star_tianlong:Array = new Array("天龙座","Star_tianlong",11,0,0,["0102","0203","0304","0405","0506","0607","0708","0809","0910","1011","0811"],3,22);
      
      private static const star_daxiong:Array = new Array("大熊座","Star_daxiong",13,0,0,["0102","0203","0304","0405","0506","0607","0408","0809","0413","1011","1113","1213"],3,3);
      
      private static const star_tianchuan:Array = new Array("天船座","Star_tianchuan",18,0,0,["0102","0203","0304","0405","0610","0105","0607","0708","0809","0910","1112","1213","1314","1415","1516","1617","1718"],2,17);
      
      private static const star_all:Array = new Array(star_baiyang,star_tianquan,star_tianmao,star_shuangzi,star_juxie,star_tiangping,star_tiange,star_haitun,star_tianxie,star_tiane,star_tianhe,star_tiantu,star_shuipin,star_jingniu,star_tianma,star_tianying,star_fenghuang,star_mojie,star_shizi,star_tianqing,star_tianlang,star_chunv,star_shuangyu,star_keque,star_shefu,star_liehu,star_renma,star_tianlong,star_daxiong,star_tianchuan);
      
      public function StarArray()
      {
         super();
      }
      
      private static function getA(arr:Array, ai:int) : Array
      {
         var ran:int = 0;
         var j:int = 0;
         var reArr:Array = new Array();
         var i:int = 0;
         while(reArr.length < ai)
         {
            ran = int(Math.random() * (arr.length - 1));
            j = reArr.indexOf(arr[ran]);
            if(j < 0)
            {
               reArr.push(arr[ran]);
            }
         }
         return reArr;
      }
      
      public static function getStarArray() : Array
      {
         return getStarArr(star_all);
      }
      
      private static function getStarArr(arr:Array) : Array
      {
         var ran:int = 0;
         var array:Array = new Array();
         var j:int = 0;
         for(var i:int = 0; i < 10; i++)
         {
            ran = int(Math.random() * 3);
            j = i * 3 + ran;
            array.push(arr[j]);
         }
         return array;
      }
   }
}

