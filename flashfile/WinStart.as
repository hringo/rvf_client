package
{
	import flash.display.MovieClip;
	
	import rvf.socket.Client;
	
	public class WinStart extends MovieClip {
		
		private var client:Client;
		
		public function WinStart(c:Client) {
			client = c;
		}
	}
}