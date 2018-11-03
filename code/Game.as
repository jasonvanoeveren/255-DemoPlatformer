﻿package code {

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.geom.Point;

	/**
	 * The class for the Game.
	 */
	public class Game extends MovieClip {

		/** Holds all platform game objects. */
		static public var platforms: Array = new Array();

		/**
		 * The constructor function for Game.
		 * Sets up keyboard input and our game loop.
		 */
		public function Game() {
			KeyboardInput.setup(stage);
			addEventListener(Event.ENTER_FRAME, gameLoop);
		} // ends Game

		/**
		 * The gameLoop design pattern.
		 * Updates time, the player, and keyboard input.
		 */
		private function gameLoop(e: Event): void {
			Time.update();
			
			player.update();

			doCollisionDetection();

			KeyboardInput.update();
		} // ends gameLoop

		/**
		 * Detects collision for the player using AABB collision detection and response.
		 */
		private function doCollisionDetection(): void {

			for (var i: int = 0; i < platforms.length; i++) {
				if (player.collider.checkOverlap(platforms[i].collider)) { // if overlapping...
					// find the fix:
					var fix: Point = player.collider.findOverlapFix(platforms[i].collider);

					// apply the fix:
					player.applyFix(fix);
				}
			} // ends for
			
		} // ends doCollisionDetection
	} // ends Game class
} // ends package