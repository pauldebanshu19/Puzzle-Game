# 🧩 On-Chain Puzzle Game (BlockSlide-Inspired)

The **On-Chain Puzzle Game** is a simple Solidity-based blockchain game inspired by *BlockSlide*.  
Players can submit move sequences (`"UP"`, `"DOWN"`, `"LEFT"`, `"RIGHT"`) which are stored permanently **on-chain**.  
It demonstrates key Solidity concepts like **state management**, **arrays**, and **mappings** while keeping gameplay fun and educational.

---

## 🌐 Deployment Information

- **Network:** Flow Testnet  
- **Contract Address:** `0x66621BaADB95b8F2c9b360032B3f82ceE43d067C`  
- **Compiler Version:** Solidity ^0.8.0  
- **License:** MIT  

---

## ⚙️ Smart Contract Code

```solidity
// SPDX-License-Identifier: MIT
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
```

---

## 🎮 Game Overview

| Feature | Description |
|----------|--------------|
| 🎯 **Submit Moves** | Players send directional moves which are stored on-chain |
| 📊 **Track Progress** | Each player’s total move count is recorded |
| 🧩 **Solve Puzzle** | When a player exceeds 3 moves, they are marked as “solved” |
| ⛓️ **Immutable Logic** | All data lives on-chain — transparent and permanent |

---

## 🚀 How to Interact with the Game

### 1️⃣ Via Remix IDE

1. Visit [Remix IDE](https://remix.ethereum.org/).  
2. Paste the smart contract code.  
3. Go to **Deploy & Run Transactions**.  
4. Select **Injected Provider - MetaMask** (connect to **Flow Testnet**).  
5. In the “At Address” field, paste the deployed address:
   ```
   0x4F07adc1cF4973d937e2FbcA10c22ea415536a56
   ```
6. Interact with these functions:
   - `submitMove("UP")` — record a move  
   - `totalMoves()` — view total moves  
   - `checkSolved(<your_address>)` — check if solved  

---

### 2️⃣ Via Ethers.js (Example Script)

```js
import { ethers } from "ethers";

const provider = new ethers.providers.JsonRpcProvider("https://testnet.flow.io/rpc");
const contractAddress = "0x4F07adc1cF4973d937e2FbcA10c22ea415536a56";

const abi = [
  "function submitMove(string _direction) public",
  "function totalMoves() public view returns (uint)",
  "function checkSolved(address _player) public view returns (bool)"
];

async function play() {
  const signer = provider.getSigner();
  const game = new ethers.Contract(contractAddress, abi, signer);

  await game.submitMove("UP");
  console.log("Move submitted!");
  console.log("Total moves:", (await game.totalMoves()).toString());
  console.log("Puzzle solved:", await game.checkSolved(await signer.getAddress()));
}

play();
```

---

## 🕹️ Example Gameplay

| Step | Player Action | Result |
|------|----------------|--------|
| 1 | Call `submitMove("UP")` | Move stored on-chain |
| 2 | Call `submitMove("LEFT")` | Another move recorded |
| 3 | Call `totalMoves()` | Shows total moves count |
| 4 | Call `checkSolved(address)` | Returns `true` after 4+ moves |

---

## 🧠 Learning Objectives

This project helps you understand:
- Persistent **state variables**
- **Structs** and **arrays** for storing structured data
- **Mappings** for tracking player-specific stats
- Function visibility and **public interactions**
- Reading data from **view** functions  

---

## 💡 Future Improvements

- 🧩 Add grid-based puzzle validation  
- 🏆 Integrate ERC20 or ERC721 rewards  
- 📊 Build a player leaderboard  
- 🌐 Create a React frontend for live interaction  

---

## 👨‍💻 Author

**Your Name**  
Blockchain Developer | Smart Contract Enthusiast  
📬 [Your Contact or GitHub Profile](https://github.com/yourusername)

---

## 📜 License

This project is licensed under the **MIT License**.  
See the [LICENSE](LICENSE) file for details.

