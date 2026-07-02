package com.riadvice.qurani
{
   import flash.data.*;
   import flash.events.*;
   import flash.filesystem.*;
   import flash.utils.ByteArray;
   
   public class QuranHelper
   {
      
      private static var connection:SQLConnection;
      
      private static var statement:SQLStatement;
      
      private static var oldResultHandler:Function;
      
      private static var dbFileName:String;
      
      private static var quranDatabase:Class = QuranHelper_quranDatabase;
      
      public function QuranHelper()
      {
         super();
      }
      
      public static function getConnection() : SQLConnection
      {
         var _loc1_:File = null;
         var _loc2_:FileStream = null;
         var _loc3_:ByteArray = null;
         if(!connection)
         {
            connection = new SQLConnection();
            _loc1_ = File.createTempFile();
            _loc2_ = new FileStream();
            _loc3_ = new quranDatabase();
            _loc2_.open(_loc1_,FileMode.WRITE);
            _loc2_.writeBytes(_loc3_);
            _loc2_.close();
            addCloseListenerToMainApp(_loc1_.nativePath);
            connection.open(_loc1_,SQLMode.READ);
         }
         return connection;
      }
      
      public static function executeQuery(param1:String, param2:Function, param3:Array = null, param4:Array = null) : void
      {
         if(!statement)
         {
            statement = new SQLStatement();
            statement.sqlConnection = getConnection();
         }
         else
         {
            statement.clearParameters();
            statement.removeEventListener(SQLEvent.RESULT,oldResultHandler);
         }
         fillParameters(statement,param3,param4);
         statement.text = param1;
         statement.addEventListener(SQLEvent.RESULT,param2);
         oldResultHandler = param2;
         statement.execute();
      }
      
      public static function fillParameters(param1:SQLStatement, param2:Array, param3:Array) : void
      {
         if(!param2 || !param3)
         {
            return;
         }
         var _loc4_:int = 0;
         while(_loc4_ < param2.length)
         {
            param1.parameters[param2[_loc4_]] = param3[_loc4_];
            _loc4_++;
         }
      }
      
      public static function inTransaction() : Boolean
      {
         return connection.inTransaction;
      }
      
      private static function addCloseListenerToMainApp(param1:String) : void
      {
         dbFileName = param1;
      }
      
      private static function mainAppClosingHandler(param1:Event) : void
      {
         connection.close();
         new File(dbFileName).deleteFile();
      }
   }
}

