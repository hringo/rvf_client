package rvf.classes
{
	public class User
	{
		private var game:String;
		private var user:String;
		private var password:String;
		
		public function User(sGame, sUser, sPassword)
		{
			this.game = sGame;
			this.user = sUser;
			this.password = sPassword;
		}
		
		public function getGame():String {return game;}
		public function getUser():String {return game;}
		public function getPassword():String {return game;}
	}
}