# SeaBattle
Wow Addon to play SeaBattle

This is a fully distributed game of SeaBattle.

All games will be recorded by everyone.
All games will be sent to everyone.

A game can be played across servers, as long as one or more person logs across servers.
A game can be played across factions in the same manner.

Games are recorded as IDs based on starting positions of both players.

Ships used:
0 Empty
1 Carrier : 5
2 BattleShip: 4
3 Sub: 3
4 Cruiser: 3
5 PT: 2

    0  1  2  3  4  5  6  7  8  9
A|
B|
C|
D|
E|
F|
G|
H|
I|
J|

====
Note:  Lua is 32 bit
Library:   Are slow because of being a scripting language
bit.bnot(a)
bit.band(w1,...)
bit.bor(w1,...)
bit.bxor(w1,...)
bit.lshift(a,b)  a << b
bit.rshift(a,b)  a >> b
bit.arshift(a,b) arithmetically right?
bit.mod(a,b)  remainder of a / b

====
Each grid has a value:
"ship map"

3 bits: Type of ship in that grid, or 0  (0 - 5)
1 bit:  Direction (0 = down or right, 1 = up or left)
1 bit:  Fired on (1 or 0)

    16 8 4 2 1
 8   0 0 1 1 0   - Carrier (reverse), not hit
 5   0 0 1 0 1   - Carrier, hit
23   1 0 1 1 1   - PT (reverse), hit
22   1 0 1 1 0   - PT (reverse), not hit
 0   0 0 0 0 0   - Empty, not hit
 1   0 0 0 0 1   - Empty, hit

Values are 0 - 31 (x00 - x17) - up to a possible 7 ships

Keep 2 maps, one for each player's ships.
The 'target' map for each player can be extracted from the 'ship' map from the other player.

5 bits per coordinate
6 columns = 30 bits
4 columns = 20 bits
2 integers per row
10 rows = 20 integers
2 maps = 40 integers

-------------------
"ship map"

3 bits: Type of ship in that grid, or 0 (0 - 5)
1 bit : Direction (0 = down or right, 1 = up or left)

    8 4 2 1
 2  0 0 1 0    - Carrier
11  1 0 1 1    - PT - reverse
 6  0 1 1 0    - Sub

 4 bits per coordinate
 8 columns = 32 bits
 2 columns = 8 bits
 (2 integers, or an interger + 1 char) per row
 10 rows = 20 integers
 2 maps = 40 integers

Fire map:

each grid has a value
2 bits: player2 fired, player1 fired

    2 1
 0  0 0  - No fire
 1  0 1  - player 1 fired
 2  1 0  - player 2 fired
 3  1 1  - both fired

2 bits per coordinate
10 columns = 20 bits = 1 integer
10 rows = 10 integers

Total = 50 integers

--------------------
Non-bit compressed:

direction = 0 = north, 90 = east, 180 = south, 270 = west  (facing)
player1Ships = { carrier: { x, y, direction }, Battleship: {x,y,dir}, .....}
player2Ships = Same

player1FireMap = { {x,y}, {x,y},...}
player2FireMap = { {x,y}, {x,y},...}



