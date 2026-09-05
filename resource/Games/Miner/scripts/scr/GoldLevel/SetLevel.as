package scr.GoldLevel
{
   import flash.display.Sprite;
   import scr.Claw.TimerClass;
   import scr.GoldThings.BigGold;
   import scr.GoldThings.CapsoleClass;
   import scr.GoldThings.DiamandClass;
   import scr.GoldThings.LittleBoxClass;
   import scr.GoldThings.LittleGold;
   import scr.GoldThings.MiddleBoxClass;
   import scr.GoldThings.MoveLittleGold;
   import scr.GoldThings.StoneGold;
   import scr.GoldThings.UnkownBoxClass;
   import scr.MainMethod.NextScrene;
   
   public class SetLevel extends Sprite
   {
      
      public static var AimScore:Number;
      
      public static var goldArray:Array = [];
      
      public static var hadScore:Number = 0;
      
      private var bigGold:BigGold;
      
      private var moveStone:MoveLittleGold;
      
      private var stoneGold:StoneGold;
      
      private var diamand:DiamandClass;
      
      private var unKown:UnkownBoxClass;
      
      private var littleBox:LittleBoxClass;
      
      private var middleBox:MiddleBoxClass;
      
      private var littleGold:LittleGold;
      
      private var capsole:CapsoleClass;
      
      public function SetLevel()
      {
         super();
      }
      
      public function levelSet() : void
      {
         var i:uint = 0;
         if(TimerClass.levelNum == 1)
         {
            AimScore = 500;
            for(i = 0; i < 3; i++)
            {
               stoneGold = new StoneGold();
               NextScrene.con.addChild(stoneGold.goldMC);
               goldArray.push(stoneGold.goldMC);
            }
            for(i = 0; i < 2; i++)
            {
               middleBox = new MiddleBoxClass();
               NextScrene.con.addChild(middleBox.goldMC);
               goldArray.push(middleBox.goldMC);
            }
            for(i = 0; i < 5; i++)
            {
               littleBox = new LittleBoxClass();
               NextScrene.con.addChild(littleBox.goldMC);
               goldArray.push(littleBox.goldMC);
            }
            for(i = 0; i < 3; i++)
            {
               littleGold = new LittleGold();
               NextScrene.con.addChild(littleGold.goldMC);
               goldArray.push(littleGold.goldMC);
            }
            bigGold = new BigGold();
            NextScrene.con.addChild(bigGold.goldMC);
            goldArray.push(bigGold.goldMC);
            middleBox = new MiddleBoxClass();
            NextScrene.con.addChild(middleBox.goldMC);
            goldArray.push(middleBox.goldMC);
            goldArray[0].x = 100;
            goldArray[0].y = 80;
            goldArray[1].x = 630;
            goldArray[1].y = 150;
            goldArray[2].x = 500;
            goldArray[2].y = 200;
            goldArray[3].x = 240;
            goldArray[3].y = 290;
            goldArray[4].x = 650;
            goldArray[4].y = 360;
            goldArray[5].x = 200;
            goldArray[5].y = 340;
            goldArray[6].x = 100;
            goldArray[6].y = 260;
            goldArray[7].x = 860;
            goldArray[7].y = 300;
            goldArray[8].x = 250;
            goldArray[8].y = 190;
            goldArray[9].x = 560;
            goldArray[9].y = 200;
            goldArray[10].x = 700;
            goldArray[10].y = 250;
            goldArray[11].x = 60;
            goldArray[11].y = 300;
            goldArray[12].x = 400;
            goldArray[12].y = 160;
            goldArray[13].x = 350;
            goldArray[13].y = 260;
            goldArray[14].x = 120;
            goldArray[14].y = 420;
         }
         else if(TimerClass.levelNum == 2)
         {
            AimScore = 1050;
            for(i = 0; i < 2; i++)
            {
               diamand = new DiamandClass();
               NextScrene.con.addChild(diamand.goldMC);
               goldArray.push(diamand.goldMC);
            }
            for(i = 0; i < 2; i++)
            {
               stoneGold = new StoneGold();
               NextScrene.con.addChild(stoneGold.goldMC);
               goldArray.push(stoneGold.goldMC);
            }
            for(i = 0; i < 6; i++)
            {
               littleGold = new LittleGold();
               NextScrene.con.addChild(littleGold.goldMC);
               goldArray.push(littleGold.goldMC);
            }
            for(i = 0; i < 3; i++)
            {
               littleBox = new LittleBoxClass();
               NextScrene.con.addChild(littleBox.goldMC);
               goldArray.push(littleBox.goldMC);
            }
            unKown = new UnkownBoxClass();
            NextScrene.con.addChild(unKown.goldMC);
            goldArray.push(unKown.goldMC);
            goldArray[0].x = 100;
            goldArray[0].y = 200;
            goldArray[1].x = 630;
            goldArray[1].y = 130;
            goldArray[2].x = 500;
            goldArray[2].y = 150;
            goldArray[3].x = 420;
            goldArray[3].y = 120;
            goldArray[4].x = 750;
            goldArray[4].y = 130;
            goldArray[5].x = 120;
            goldArray[5].y = 90;
            goldArray[6].x = 250;
            goldArray[6].y = 200;
            goldArray[7].x = 650;
            goldArray[7].y = 180;
            goldArray[8].x = 120;
            goldArray[8].y = 260;
            goldArray[9].x = 290;
            goldArray[9].y = 80;
            goldArray[12].x = 220;
            goldArray[12].y = 300;
            goldArray[10].x = 400;
            goldArray[10].y = 240;
            goldArray[11].x = 800;
            goldArray[11].y = 290;
            goldArray[13].x = 650;
            goldArray[13].y = 250;
         }
         else if(TimerClass.levelNum == 3)
         {
            AimScore = 1910;
            for(i = 0; i < 2; i++)
            {
               capsole = new CapsoleClass();
               NextScrene.con.addChild(capsole.goldMC);
               goldArray.push(capsole.goldMC);
            }
            for(i = 0; i < 6; i++)
            {
               littleGold = new LittleGold();
               NextScrene.con.addChild(littleGold.goldMC);
               goldArray.push(littleGold.goldMC);
            }
            for(i = 0; i < 3; i++)
            {
               littleBox = new LittleBoxClass();
               NextScrene.con.addChild(littleBox.goldMC);
               goldArray.push(littleBox.goldMC);
            }
            for(i = 0; i < 2; i++)
            {
               middleBox = new MiddleBoxClass();
               NextScrene.con.addChild(middleBox.goldMC);
               goldArray.push(middleBox.goldMC);
            }
            for(i = 0; i < 2; i++)
            {
               unKown = new UnkownBoxClass();
               NextScrene.con.addChild(unKown.goldMC);
               goldArray.push(unKown.goldMC);
            }
            goldArray[0].x = 150;
            goldArray[0].y = 100;
            goldArray[1].x = 700;
            goldArray[1].y = 160;
            goldArray[2].x = 120;
            goldArray[2].y = 230;
            goldArray[3].x = 620;
            goldArray[3].y = 200;
            goldArray[4].x = 420;
            goldArray[4].y = 160;
            goldArray[5].x = 340;
            goldArray[5].y = 238;
            goldArray[6].x = 165;
            goldArray[6].y = 170;
            goldArray[7].x = 700;
            goldArray[7].y = 230;
            goldArray[8].x = 150;
            goldArray[8].y = 230;
            goldArray[9].x = 380;
            goldArray[9].y = 165;
            goldArray[10].x = 650;
            goldArray[10].y = 240;
            goldArray[11].x = 380;
            goldArray[11].y = 280;
            goldArray[12].x = 650;
            goldArray[12].y = 520;
            goldArray[13].x = 500;
            goldArray[13].y = 150;
            goldArray[14].x = 250;
            goldArray[14].y = 130;
         }
         else if(TimerClass.levelNum == 4)
         {
            AimScore = 4200;
            for(i = 0; i < 3; i++)
            {
               capsole = new CapsoleClass();
               NextScrene.con.addChild(capsole.goldMC);
               goldArray.push(capsole.goldMC);
            }
            for(i = 0; i < 5; i++)
            {
               stoneGold = new StoneGold();
               NextScrene.con.addChild(stoneGold.goldMC);
               goldArray.push(stoneGold.goldMC);
            }
            for(i = 0; i < 2; i++)
            {
               moveStone = new MoveLittleGold();
               NextScrene.con.addChild(moveStone.goldMC);
               goldArray.push(moveStone.goldMC);
            }
            for(i = 0; i < 3; i++)
            {
               unKown = new UnkownBoxClass();
               NextScrene.con.addChild(unKown.goldMC);
               goldArray.push(unKown.goldMC);
            }
            goldArray[0].x = 100;
            goldArray[0].y = 200;
            goldArray[1].x = 600;
            goldArray[1].y = 160;
            goldArray[2].x = 360;
            goldArray[2].y = 100;
            goldArray[3].x = 420;
            goldArray[3].y = 120;
            goldArray[4].x = 750;
            goldArray[4].y = 150;
            goldArray[5].x = 120;
            goldArray[5].y = 70;
            goldArray[6].x = 250;
            goldArray[6].y = 250;
            goldArray[7].x = 650;
            goldArray[7].y = 180;
            goldArray[8].x = 50;
            goldArray[8].y = 260;
            goldArray[9].x = 900;
            goldArray[9].y = 80;
            goldArray[10].x = 300;
            goldArray[10].y = 120;
            goldArray[11].x = 430;
            goldArray[11].y = 220;
            goldArray[12].x = 750;
            goldArray[12].y = 260;
         }
         else if(TimerClass.levelNum == 5)
         {
            AimScore = 6075;
            for(i = 0; i < 4; i++)
            {
               capsole = new CapsoleClass();
               NextScrene.con.addChild(capsole.goldMC);
               goldArray.push(capsole.goldMC);
            }
            for(i = 0; i < 2; i++)
            {
               bigGold = new BigGold();
               NextScrene.con.addChild(bigGold.goldMC);
               goldArray.push(bigGold.goldMC);
            }
            for(i = 0; i < 3; i++)
            {
               stoneGold = new StoneGold();
               NextScrene.con.addChild(stoneGold.goldMC);
               goldArray.push(stoneGold.goldMC);
            }
            for(i = 0; i < 4; i++)
            {
               littleGold = new LittleGold();
               NextScrene.con.addChild(littleGold.goldMC);
               goldArray.push(littleGold.goldMC);
            }
            unKown = new UnkownBoxClass();
            NextScrene.con.addChild(unKown.goldMC);
            goldArray.push(unKown.goldMC);
            middleBox = new MiddleBoxClass();
            NextScrene.con.addChild(middleBox.goldMC);
            goldArray.push(middleBox.goldMC);
            goldArray[0].x = 750;
            goldArray[0].y = 180;
            goldArray[1].x = 230;
            goldArray[1].y = 130;
            goldArray[2].x = 450;
            goldArray[2].y = 120;
            goldArray[3].x = 680;
            goldArray[3].y = 120;
            goldArray[4].x = 230;
            goldArray[4].y = 330;
            goldArray[5].x = 650;
            goldArray[5].y = 240;
            goldArray[6].x = 320;
            goldArray[6].y = 100;
            goldArray[7].x = 470;
            goldArray[7].y = 180;
            goldArray[8].x = 750;
            goldArray[8].y = 210;
            goldArray[9].x = 600;
            goldArray[9].y = 280;
            goldArray[10].x = 300;
            goldArray[10].y = 180;
            goldArray[11].x = 500;
            goldArray[11].y = 150;
            goldArray[12].x = 780;
            goldArray[12].y = 290;
            goldArray[13].x = 450;
            goldArray[13].y = 230;
            goldArray[14].x = -20;
            goldArray[14].y = 370;
         }
         else if(TimerClass.levelNum == 6)
         {
            AimScore = 7850;
            for(i = 0; i < 3; i++)
            {
               moveStone = new MoveLittleGold();
               NextScrene.con.addChild(moveStone.goldMC);
               goldArray.push(moveStone.goldMC);
               capsole = new CapsoleClass();
               moveStone.goldMC.addChild(capsole.goldMC);
               capsole.goldMC.mouseChildren = false;
               capsole.goldMC.scaleX = capsole.goldMC.scaleY = 0.8;
               capsole.goldMC.x = 30;
               capsole.goldMC.y = 10;
            }
            for(i = 0; i < 3; i++)
            {
               stoneGold = new StoneGold();
               NextScrene.con.addChild(stoneGold.goldMC);
               goldArray.push(stoneGold.goldMC);
            }
            for(i = 0; i < 2; i++)
            {
               middleBox = new MiddleBoxClass();
               NextScrene.con.addChild(middleBox.goldMC);
               goldArray.push(middleBox.goldMC);
            }
            goldArray[0].x = 50;
            goldArray[0].y = 150;
            goldArray[1].x = 250;
            goldArray[1].y = 280;
            goldArray[2].x = 750;
            goldArray[2].y = 100;
            goldArray[3].x = 750;
            goldArray[3].y = 210;
            goldArray[4].x = 250;
            goldArray[4].y = 250;
            goldArray[5].x = 550;
            goldArray[5].y = 100;
            goldArray[6].x = 250;
            goldArray[6].y = 380;
            goldArray[7].x = 600;
            goldArray[7].y = 350;
         }
         else if(TimerClass.levelNum == 7)
         {
            AimScore = 9500;
            for(i = 0; i < 4; i++)
            {
               diamand = new DiamandClass();
               NextScrene.con.addChild(diamand.goldMC);
               goldArray.push(diamand.goldMC);
            }
            for(i = 0; i < 4; i++)
            {
               moveStone = new MoveLittleGold();
               NextScrene.con.addChild(moveStone.goldMC);
               goldArray.push(moveStone.goldMC);
            }
            for(i = 0; i < 2; i++)
            {
               bigGold = new BigGold();
               NextScrene.con.addChild(bigGold.goldMC);
               goldArray.push(bigGold.goldMC);
            }
            goldArray[0].x = 150;
            goldArray[0].y = 250;
            goldArray[1].x = 350;
            goldArray[1].y = 180;
            goldArray[2].x = 650;
            goldArray[2].y = 210;
            goldArray[3].x = 800;
            goldArray[3].y = 290;
            goldArray[4].x = 0;
            goldArray[4].y = 100;
            goldArray[5].x = 900;
            goldArray[5].y = 160;
            goldArray[6].x = 250;
            goldArray[6].y = 270;
            goldArray[7].x = 750;
            goldArray[7].y = 200;
            goldArray[8].x = 250;
            goldArray[8].y = 290;
            goldArray[9].x = 650;
            goldArray[9].y = 340;
         }
         else if(TimerClass.levelNum == 8)
         {
            AimScore = 11200;
            for(i = 0; i < 2; i++)
            {
               diamand = new DiamandClass();
               NextScrene.con.addChild(diamand.goldMC);
               goldArray.push(diamand.goldMC);
            }
            for(i = 0; i < 2; i++)
            {
               capsole = new CapsoleClass();
               NextScrene.con.addChild(capsole.goldMC);
               goldArray.push(capsole.goldMC);
            }
            for(i = 0; i < 2; i++)
            {
               bigGold = new BigGold();
               NextScrene.con.addChild(bigGold.goldMC);
               goldArray.push(bigGold.goldMC);
            }
            for(i = 0; i < 3; i++)
            {
               stoneGold = new StoneGold();
               NextScrene.con.addChild(stoneGold.goldMC);
               goldArray.push(stoneGold.goldMC);
            }
            for(i = 0; i < 2; i++)
            {
               middleBox = new MiddleBoxClass();
               NextScrene.con.addChild(middleBox.goldMC);
               goldArray.push(middleBox.goldMC);
            }
            for(i = 0; i < 3; i++)
            {
               littleBox = new LittleBoxClass();
               NextScrene.con.addChild(littleBox.goldMC);
               goldArray.push(littleBox.goldMC);
            }
            unKown = new UnkownBoxClass();
            NextScrene.con.addChild(unKown.goldMC);
            goldArray.push(unKown.goldMC);
            goldArray[0].x = 250;
            goldArray[0].y = 250;
            goldArray[1].x = 800;
            goldArray[1].y = 165;
            goldArray[2].x = 80;
            goldArray[2].y = 220;
            goldArray[3].x = 450;
            goldArray[3].y = 130;
            goldArray[4].x = 320;
            goldArray[4].y = 280;
            goldArray[5].x = 650;
            goldArray[5].y = 320;
            goldArray[6].x = 250;
            goldArray[6].y = 240;
            goldArray[7].x = 350;
            goldArray[7].y = 150;
            goldArray[8].x = 700;
            goldArray[8].y = 200;
            goldArray[9].x = 250;
            goldArray[9].y = 310;
            goldArray[10].x = 500;
            goldArray[10].y = 350;
            goldArray[11].x = 80;
            goldArray[11].y = 350;
            goldArray[12].x = 560;
            goldArray[12].y = 250;
            goldArray[13].x = 750;
            goldArray[13].y = 380;
            goldArray[14].x = 120;
            goldArray[14].y = 310;
         }
         else if(TimerClass.levelNum == 9)
         {
            AimScore = 13500;
            for(i = 0; i < 8; i++)
            {
               littleGold = new LittleGold();
               NextScrene.con.addChild(littleGold.goldMC);
               goldArray.push(littleGold.goldMC);
            }
            for(i = 0; i < 3; i++)
            {
               capsole = new CapsoleClass();
               NextScrene.con.addChild(capsole.goldMC);
               goldArray.push(capsole.goldMC);
            }
            for(i = 0; i < 2; i++)
            {
               unKown = new UnkownBoxClass();
               NextScrene.con.addChild(unKown.goldMC);
               goldArray.push(unKown.goldMC);
            }
            for(i = 0; i < 2; i++)
            {
               bigGold = new BigGold();
               NextScrene.con.addChild(bigGold.goldMC);
               goldArray.push(bigGold.goldMC);
            }
            goldArray[0].x = 120;
            goldArray[0].y = 100;
            goldArray[8].x = 120;
            goldArray[8].y = 150;
            goldArray[1].x = 80;
            goldArray[1].y = 140;
            goldArray[2].x = 180;
            goldArray[2].y = 140;
            goldArray[3].x = 120;
            goldArray[3].y = 180;
            goldArray[4].x = 670;
            goldArray[4].y = 100;
            goldArray[9].x = 670;
            goldArray[9].y = 150;
            goldArray[5].x = 630;
            goldArray[5].y = 140;
            goldArray[6].x = 730;
            goldArray[6].y = 140;
            goldArray[7].x = 670;
            goldArray[7].y = 180;
            goldArray[10].x = 450;
            goldArray[10].y = 80;
            goldArray[11].x = 250;
            goldArray[11].y = 250;
            goldArray[12].x = 600;
            goldArray[12].y = 250;
            goldArray[13].x = 430;
            goldArray[13].y = 250;
            goldArray[14].x = 530;
            goldArray[14].y = 250;
         }
         else if(TimerClass.levelNum == 10)
         {
            AimScore = 15000;
            for(i = 0; i < 3; i++)
            {
               moveStone = new MoveLittleGold();
               NextScrene.con.addChild(moveStone.goldMC);
               goldArray.push(moveStone.goldMC);
               capsole = new CapsoleClass();
               moveStone.goldMC.addChild(capsole.goldMC);
               capsole.goldMC.mouseChildren = false;
               capsole.goldMC.scaleX = capsole.goldMC.scaleY = 0.8;
               capsole.goldMC.x = 30;
               capsole.goldMC.y = 10;
            }
            for(i = 0; i < 5; i++)
            {
               moveStone = new MoveLittleGold();
               NextScrene.con.addChild(moveStone.goldMC);
               goldArray.push(moveStone.goldMC);
            }
            goldArray[0].x = 0;
            goldArray[0].y = 50;
            goldArray[1].x = 550;
            goldArray[1].y = 120;
            goldArray[2].x = 900;
            goldArray[2].y = 170;
            goldArray[3].x = -100;
            goldArray[3].y = 70;
            goldArray[4].x = 100;
            goldArray[4].y = 140;
            goldArray[5].x = 650;
            goldArray[5].y = 180;
            goldArray[6].x = 400;
            goldArray[6].y = 230;
            goldArray[7].x = 900;
            goldArray[7].y = 300;
         }
      }
   }
}

