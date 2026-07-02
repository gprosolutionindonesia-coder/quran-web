package com.riadvice.qurani
{
   public class Queries
   {
      
      public static const GET_AYA_SQL:String = "SELECT othmani, imlai FROM Quran WHERE id >= :ayaId ORDER BY id LIMIT :ayatLength";
      
      public static const GET_SUWAR_INFO:String = "SELECT rowid, sura_name, other_names, makki, starting_row, comment FROM SuraInfo ORDER BY rowid";
      
      public static const GET_PAGE:String = "SELECT id, sura, aya FROM Page where id = :pageId";
      
      public static const GET_HIZB:String = "SELECT sura, aya FROM Tahzeeb limit :hizbStartIndex,4";
      
      public static const SEARCH:String = "SELECT id, imlai, rawText FROM Quran WHERE rawText LIKE :keyword LIMIT :resultCount OFFSET :resultStart";
      
      public static const SEARCHCOUNT:String = "SELECT id FROM Quran WHERE rawText LIKE :keyword";
      
      public function Queries()
      {
         super();
      }
   }
}

