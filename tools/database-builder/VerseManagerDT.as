package com.qf3.desktop
{
   import com.qf3.VerseManager;
   import com.qf3.desktop.ui.*;
   import com.riadvice.qurani.*;
   import flash.events.Event;
   import flash.filesystem.*;
   
   public class VerseManagerDT extends VerseManager
   {
      
      private var mg:ManagerDT;
      
      public var sura:*;
      
      public var verse:*;
      
      public var page:*;
      
      private var vMenu:VerseMenuDT;
      
      public function VerseManagerDT()
      {
         super();
         this.mg = ManagerDT.getInstance();
      }
      
      override protected function verseClicked() : *
      {
         if(!enabled)
         {
            return;
         }
         var _loc1_:* = selectedElements[0];
         var _loc2_:* = selectedElements[1];
         var _loc3_:* = this.mg.fb.getClickedPage();
         this.sura = _loc1_;
         this.verse = _loc2_;
         this.page = _loc3_;
         if(!this.vMenu)
         {
            this.vMenu = new VerseMenuDT();
         }
         this.mg.root.stage.addChild(this.vMenu);
         this.vMenu.popUp(this.mg.root.stage.mouseX,this.mg.root.stage.mouseY);
         this.vMenu.addEventListener(VerseMenuDT.COPY,this.copyClicked);
         this.vMenu.addEventListener(VerseMenuDT.LISTEN,this.listenClicked);
         this.vMenu.addEventListener(VerseMenuDT.BOOKMARK,this.bookmarkClicked);
         this.vMenu.addEventListener(VerseMenuDT.TAFSEER,this.tafseerClicked);
         this.vMenu.addEventListener(VerseMenuDT.TRANSLATION,this.translationClicked);
         this.vMenu.addEventListener(VerseMenuDT.TRANSLITERATION,this.translitrationClicked);
         this.vMenu.addEventListener(VerseMenuDT.HIGHLIGHT_SELECTED,this.highLightVerse);
      }
      
      private function copyClicked(param1:Event) : void
      {
         var _loc2_:* = new ClipboardBoxDT();
         var _loc3_:* = new Object();
         _loc3_.sura = this.sura;
         _loc3_.verse = this.verse;
         var _loc4_:Quran = new Quran();
         _loc3_.txt = _loc4_.getAya(this.sura,this.verse).imlai;
         _loc3_.url = File.applicationStorageDirectory.resolvePath("perm/verses/" + this.sura + "_" + this.verse + ".png").url;
         _loc2_.show(_loc3_);
      }
      
      private function listenClicked(param1:Event) : void
      {
         var _loc2_:* = new Object();
         _loc2_.sura = this.sura;
         _loc2_.verse = this.verse;
         this.mg.am.playVerseFromJS(_loc2_);
      }
      
      private function bookmarkClicked(param1:Event) : void
      {
         var _loc2_:BookmarkDT = new BookmarkDT();
         _loc2_.show();
      }
      
      private function tafseerClicked(param1:Event) : void
      {
         var _loc2_:* = new Object();
         _loc2_.verse = this.verse;
         _loc2_.sura = this.sura;
         _loc2_.mode = "tafseer";
         this.mg.tb.showContent(_loc2_);
      }
      
      private function translationClicked(param1:Event) : void
      {
         var _loc2_:* = new Object();
         _loc2_.verse = this.verse;
         _loc2_.sura = this.sura;
         _loc2_.mode = "translation";
         this.mg.tb.showContent(_loc2_);
      }
      
      private function translitrationClicked(param1:Event) : void
      {
         var _loc2_:* = new Object();
         _loc2_.verse = this.verse;
         _loc2_.sura = this.sura;
         _loc2_.mode = "transliteration";
         this.mg.tb.showContent(_loc2_);
      }
      
      private function highLightVerse(param1:Event) : *
      {
         var _loc2_:Object = new Object();
         var _loc3_:* = Number(this.vMenu.currentColor);
         var _loc4_:* = this.mg.vm.getCurrentVerseColor();
         if(_loc4_ == _loc3_)
         {
            _loc3_ = -1;
         }
         _loc2_.color = _loc3_;
         this.mg.vm.addImmediateHighlight(_loc2_.color);
         _loc2_.currentSura = this.sura;
         _loc2_.currentVerse = this.verse;
         _loc2_.currentPage = this.page;
         _loc2_.mushafName = this.mg.param("mushafName");
         addLocalHighlight(_loc2_);
      }
      
      override protected function msgTagOver(param1:*) : *
      {
         if(!enabled)
         {
            return;
         }
         this.mg.cm.msgOver(param1);
      }
      
      private function getPageVerses(param1:*) : *
      {
      }
   }
}

