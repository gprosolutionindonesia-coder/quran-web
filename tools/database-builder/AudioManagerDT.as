package com.qf3.desktop
{
   import Ayman.Utils.*;
   import com.qf3.*;
   import com.qf3.desktop.ui.*;
   import flash.display.*;
   import flash.events.*;
   import flash.filesystem.*;
   import flash.text.*;
   
   public class AudioManagerDT extends AudioManager2
   {
      
      private var mg:ManagerDT;
      
      private var currentReciterLabel:*;
      
      public function AudioManagerDT()
      {
         super();
         this.mg = ManagerDT.getInstance();
      }
      
      override public function showAudioConfig() : void
      {
         var _loc1_:* = this.mg.param("recitationsXML").reciters;
         if(reciterBox)
         {
            reciterBox.clean();
         }
         reciterBox = new ReciterBoxDT("ReciterBoxSkin",_loc1_);
         reciterBox.show();
         reciterBox.addEventListener(ReciterBox.ITEM_SELECTED,this.reciterSelected);
      }
      
      override public function getAudioURL(param1:*, param2:* = null) : *
      {
         if(!param2)
         {
            changeReciter(this.reciter);
            param2 = this.reciter;
         }
         var _loc3_:* = Func.zeroCorrection(param1.sura,3);
         var _loc4_:* = Func.zeroCorrection(param1.verse,3);
         return File.applicationStorageDirectory.resolvePath("perm/audio/" + param2 + "/" + _loc3_ + _loc4_ + ".mp3").url;
      }
      
      public function getSampleAudioURL(param1:*, param2:* = null) : *
      {
         if(!param2)
         {
            changeReciter(this.reciter);
            param2 = this.reciter;
         }
         var _loc3_:* = Func.zeroCorrection(param1.sura,3);
         var _loc4_:* = Func.zeroCorrection(param1.verse,3);
         return "http://www.quranflash.com/assets/audio/verses/" + param2 + "/" + _loc3_ + _loc4_ + ".mp3";
      }
      
      private function checkIfNoReciter() : *
      {
         var options:* = undefined;
         var d:DialogPromptDT = null;
         if(!this.reciterExists(reciter))
         {
            options = Object();
            options.btnArray = [DialogPromptDT.YES,DialogPromptDT.NO];
            d = new DialogPromptDT();
            d.setContent(this.mg.lang("reciternotexist"),options);
            d.showDialog();
            d.getBtn(DialogPromptDT.YES).addEventListener(MouseEvent.CLICK,function(param1:*):*
            {
               new TimeOut(100,showAudioConfig);
            });
            return true;
         }
         return false;
      }
      
      private function checkIfNoSuraForReciter(param1:*) : *
      {
         var options:* = undefined;
         var d:DialogPromptDT = null;
         var sura:* = param1;
         if(!reciter)
         {
            reciter = changeReciter(this.reciter);
         }
         if(!this.reciterExists(reciter))
         {
            options = Object();
            options.btnArray = [DialogPromptDT.YES,DialogPromptDT.NO];
            d = new DialogPromptDT();
            d.setContent(this.mg.lang("reciternotexist"),options);
            d.showDialog();
            d.getBtn(DialogPromptDT.YES).addEventListener(MouseEvent.CLICK,function(param1:*):*
            {
               new TimeOut(100,showAudioConfig);
            });
            this.mg.am.stopAudio();
            return true;
         }
         if(!this.reciterSuraExists(reciter,sura))
         {
            options = Object();
            options.btnArray = [DialogPromptDT.YES,DialogPromptDT.NO,"chooseanother"];
            d = new DialogPromptDT();
            d.setContent(this.mg.lang("recitersuranotexist"),options);
            d.showDialog();
            d.getBtn(DialogPromptDT.YES).addEventListener(MouseEvent.CLICK,function(param1:*):*
            {
               var _loc2_:Object = new Object();
               _loc2_.folderName = reciter;
               _loc2_.label = currentReciterLabel;
               initiateDownloadSura(_loc2_,sura);
            });
            d.getBtn("chooseanother").addEventListener(MouseEvent.CLICK,function(param1:*):*
            {
               new TimeOut(100,showAudioConfig);
            });
            this.mg.am.stopAudio();
            return true;
         }
         return false;
      }
      
      private function initiateDownloadSura(param1:*, param2:*) : void
      {
         var _loc3_:* = {
            "reciterLabel":String(param1.label),
            "reciterFolder":String(param1.folderName),
            "sura":param2
         };
         var _loc4_:* = this.mg.param("suraArray");
         var _loc5_:* = _loc4_.chapter[param2 - 1].@title;
         var _loc6_:* = Func.zeroCorrection(param2,3);
         var _loc7_:* = this.mg.param("downloadPath") + "assets/audio/verses/" + param1.folderName + "/" + _loc6_ + ".zip";
         var _loc8_:* = this.mg.um.add(this.mg.lang(_loc5_) + " - " + this.mg.lang(param1.label),_loc7_,"audio",null,_loc3_);
         this.mg.um.show();
      }
      
      override public function playVerse(param1:*, param2:*, param3:* = null) : *
      {
         if(this.checkIfNoSuraForReciter(param1))
         {
            return;
         }
         super.playVerse(param1,param2,param3);
      }
      
      override protected function playPage(param1:*, param2:* = null) : *
      {
         var _loc3_:Array = this.mg.vm.getPageVerseOb(param1);
         selectedSura = _loc3_[0].sura;
         if(this.checkIfNoSuraForReciter(selectedSura))
         {
            return;
         }
         super.playPage(param1,param2);
      }
      
      override public function playAudio() : *
      {
         if(this.checkIfNoReciter())
         {
            return;
         }
         super.playAudio();
      }
      
      private function reciterExists(param1:*) : *
      {
         if(File.applicationStorageDirectory.resolvePath("perm/audio/" + param1).exists)
         {
            return true;
         }
         return false;
      }
      
      private function reciterSuraExists(param1:*, param2:*) : *
      {
         var _loc3_:* = Func.zeroCorrection(param2,3) + "001.mp3";
         var _loc4_:File = File.applicationStorageDirectory.resolvePath("perm/audio/" + param1 + "/" + _loc3_);
         if(_loc4_.exists)
         {
            return true;
         }
         return false;
      }
      
      override protected function setReciterControlLabel(param1:*) : void
      {
         var _loc2_:TextFormat = null;
         var _loc3_:* = undefined;
         var _loc4_:* = undefined;
         if(this.mg.param("language") == "Arabic")
         {
            controls.left.configBtn.txt.text = this.mg.lang(param1);
            this.currentReciterLabel = param1;
            _loc2_ = new TextFormat();
            _loc2_ = controls.left.configBtn.txt.defaultTextFormat;
            if(controls.left.configBtn.mc)
            {
               controls.left.configBtn.mc.visible = false;
               controls.left.configBtn.removeChild(controls.left.configBtn.mc);
            }
            _loc3_ = new MovieClip();
            _loc4_ = this.textToImage(controls.left.configBtn.txt);
            _loc3_.addChild(_loc4_);
            _loc3_.imageTxt = _loc4_;
            controls.left.configBtn.addChild(_loc3_);
            controls.left.configBtn.mc = _loc3_;
            Func.colorize(_loc3_,controls.left.configBtn.txt.textColor);
            _loc3_.mouseEnabled = _loc3_.mouseChildren = false;
         }
         else
         {
            _loc2_ = controls.left.configBtn.txt.defaultTextFormat;
            _loc2_.size = 12;
            controls.left.configBtn.txt.defaultTextFormat = _loc2_;
            controls.left.configBtn.txt.setTextFormat(_loc2_);
            controls.left.configBtn.txt.y = 2;
            this.mg.langTxtReplace(controls.left.configBtn.txt,param1);
         }
      }
      
      override public function nextTrack() : *
      {
         if(audioStopped)
         {
            return;
         }
         if(audioPage == null)
         {
            return;
         }
         var _loc1_:* = this.mg.vm.getNextVerse(currentAudioOb.sura,currentAudioOb.verse);
         if(!_loc1_)
         {
            return;
         }
         this.mg.vm.selectVerse({
            "sura":_loc1_.sura,
            "verse":_loc1_.verse,
            "page":_loc1_.page
         });
         this.playVerse(_loc1_.sura,_loc1_.verse,{"page":_loc1_.page - 1});
      }
      
      private function textToImage(param1:TextField) : *
      {
         var _loc2_:TextField = new TextField();
         _loc2_.width = param1.width;
         _loc2_.height = param1.height;
         _loc2_.x = param1.x;
         _loc2_.y = param1.y;
         _loc2_.text = param1.text;
         _loc2_.setTextFormat(param1.defaultTextFormat);
         _loc2_.defaultTextFormat = param1.defaultTextFormat;
         var _loc3_:TextFormat = _loc2_.defaultTextFormat;
         _loc3_.font = "Times New Roman";
         _loc3_.size += 2;
         _loc2_.setTextFormat(_loc3_);
         _loc2_.defaultTextFormat = _loc3_;
         _loc2_.mouseEnabled = false;
         var _loc4_:* = Text.getTLFText(_loc2_,true);
         _loc4_.x = _loc2_.x;
         _loc4_.y = _loc2_.y + 2;
         _loc2_.visible = false;
         param1.visible = false;
         return _loc4_;
      }
   }
}

