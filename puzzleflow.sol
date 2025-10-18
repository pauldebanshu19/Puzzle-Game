/ SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract PuzzleGame {
    struct Move {
        address player;
        string direction;
        uint timestamp;
    }

    Move[] public moves;
    mapping(address => uint) public playerMoveCount;

    function submitMove(string memory _direction) public {
        moves.push(Move(msg.sender, _direction, block.timestamp));
        playerMoveCount[msg.sender]++;
    }

    // Get total moves
    function totalMoves() public view returns (uint) {
        return moves.length;
    }

    // Example: check if player solved puzzle (mock condition)
    function checkSolved(address _player) public view returns (bool) {
        return playerMoveCount[_player] > 3; // arbitrary win condition
    }
}
