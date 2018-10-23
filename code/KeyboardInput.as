﻿package code {

	import flash.events.KeyboardEvent;
	import flash.display.Stage;

	/**
	 * The KeyboardInput class.
	 * Handles all keyboard input events.
	 */
	public class KeyboardInput {
		
		static public var keysState: Array = new Array();
		static public var keysPrevState: Array = new Array();

		/**
		 * Constructor function for KeyboardInput
		 * @param stage The main scene of the game.
		 */
		static public function setup(stage: Stage) {

			stage.addEventListener(KeyboardEvent.KEY_DOWN, handleKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, handleKeyUp);

		} // ends KeyboardInput
		
		/**
		 * This funciton's job is to cache all of the key values, for the NEXT frame.
		 */
		static public function update(): void {
			keysPrevState = keysState.slice(); // in this context, slice() gives us a copy of the array
		}

		/** 
		 * Updates the key booleans when a certain key is pressed.
		 * @param keyCode The keycode of the key that is pressed.
		 * @param isDown Switches to true if the key has been pressed.
		 * @return void This method should not return anything.
		 */
		static private function updateKey(keyCode: int, isDown: Boolean): void {

			keysState[keyCode] = isDown;

		} // ends updateKey

		/**
		 * If key is pressed, set boolean to true.
		 * @param e The keyboard input event.
		 * @return void This method should not return anything.
		 */
		static private function handleKeyDown(e: KeyboardEvent): void {

			updateKey(e.keyCode, true);

		} // ends handleKeyDown

		/**
		 * If key is not pressed, set boolean to false.
		 * @param e The keyboard input event.
		 * @return void This method should not return anything.
		 */
		static private function handleKeyUp(e: KeyboardEvent): void {

			updateKey(e.keyCode, false);

		} // ends handleKeyUp
		
		static public function IsKeyDown(keyCode: int): Boolean {
			if (keyCode < 0) return false;
			if (keyCode >= keysState.length) return false;
			
			return keysState[keyCode];
		}
		
		static public function OnKeyDown(keyCode: int): Boolean {
			if (keyCode < 0) return false;
			if (keyCode >= keysState.length) return false;
			
			return (keysState[keyCode] && !keysPrevState[keyCode]);
		}
	} // ends class
} // ends package