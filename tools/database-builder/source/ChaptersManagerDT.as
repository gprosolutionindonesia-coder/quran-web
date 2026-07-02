package com.qf3.desktop
{
   import com.greensock.*;
   import com.qf3.*;
   import flash.events.*;
   import flash.geom.*;
   import flash.text.*;
   
   public class ChaptersManagerDT extends ChaptersManager
   {
      
      private var mg:ManagerDT;
      
      private var msg:*;
      
      public function ChaptersManagerDT()
      {
         super();
         this.mg = ManagerDT.getInstance();
      }
      
      override public function msgOver(param1:MouseEvent) : void
      {
         var _loc2_:* = param1.currentTarget;
         this.hideMsg();
         this.msg = this.createMsg(_loc2_.msg);
         this.mg.root.stage.addChild(this.msg);
         this.msg.alpha = 0;
         TweenLite.to(this.msg,0.2,{
            "alpha":1,
            "onComplete":this.msg.addEventListener,
            "onCompleteParams":[MouseEvent.MOUSE_OUT,this.fadeMsg]
         });
         var _loc3_:* = Func.getPoint(new Point(_loc2_.parent.mouseX,_loc2_.parent.mouseY),_loc2_.parent,this.mg.root.stage);
         this.msg.x = _loc3_.x - _loc2_.width;
         this.msg.y = _loc3_.y - _loc2_.height;
         if(this.mg.param("language") == "Arabic")
         {
            this.msg.x = _loc3_.x + _loc2_.width - this.msg.width;
         }
      }
      
      private function createMsg(param1:*) : *
      {
         var _loc4_:TextFormat = null;
         var _loc5_:* = undefined;
         var _loc2_:* = this.mg.getClass("BookmarkMsgDT");
         var _loc3_:* = new _loc2_();
         _loc3_.txt.text = param1;
         _loc3_.txt.mouseEnabled = false;
         if(this.mg.param("language") == "Arabic")
         {
            _loc3_.bg.scaleX *= -1;
            _loc3_.bg.x = _loc3_.bg.width;
            _loc4_ = _loc3_.txt.defaultTextFormat;
            _loc4_.font = "Times New Roman";
            _loc4_.align = TextFormatAlign.RIGHT;
            _loc4_.size += 4;
            _loc3_.txt.setTextFormat(_loc4_);
            _loc3_.txt.defaultTextFormat = _loc4_;
            _loc5_ = Text.getTLFImage(_loc3_.txt,true);
            _loc3_.txt.visible = false;
            _loc5_.x = _loc3_.txt.x;
            _loc5_.y = _loc3_.txt.y;
            _loc3_.addChild(_loc5_);
         }
         return _loc3_;
      }
      
      private function fadeMsg(param1:*) : void
      {
         TweenLite.to(this.msg,0.3,{
            "alpha":0,
            "onComplete":this.hideMsg
         });
      }
      
      private function hideMsg() : void
      {
         Func.removeMoviefExists(this.msg);
      }
   }
}

