# hangman

A command-line Hangman game built in Ruby to practice serialization (saving and loading).

## Description

A command-line implementation of Hangman written in Ruby. The secret word is automatically generated at the start of the game. You have 6 lives to try and guess the word before a game over. You can save the game at the start of each turn. After loading a save data to resume playing, the save data is deleted to prevent reusing the same save state. You can only have one save state at a time. 

## Purpose

This project was built to practice serialization in Ruby using YAML. The game state (secret word, guessed letters, remaining lives and board state) is converted into a storable format and written to a file, then later reconstructed to resume gameplay. 

## How to run

```bash
ruby game.rb
```

## Usage

- Enter "n" or "l" to start a new game or load a save data. 
- Enter your guess one letter at a time. 
- The game board will reload to reflect your guess.
- You have 6 lives. 
- The game ends when you correctly guess the secret word or run out of lives. 

## Example Output

```
**GUESSES**
a b c f
Enter your 1 letter guess. Type SAVE to save the game.
i
           ♥ Lives: 3            
---------------------------------
|  _______                      |
| |/      |                     |
| |       O                     |
| |       |\                    |
| |                             |
| |                             |
---------------------------------
b _ i _ _ i _ _

**GUESSES**
a b c f i
Enter your 1 letter guess. Type SAVE to save the game.

```

