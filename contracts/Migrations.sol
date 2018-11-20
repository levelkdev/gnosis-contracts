pragma solidity ^0.4.24;
import "canonical-weth/contracts/WETH9.sol";
/* import "openzeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol"; */
/* import "./Tokens/ERC20Gnosis.sol"; */

contract Migrations {
    address public owner;
    uint public last_completed_migration;

    modifier restricted() {
        if (msg.sender == owner) _;
    }

    constructor() public {
        owner = msg.sender;
    }

    function setCompleted(uint completed) public restricted {
        last_completed_migration = completed;
    }

    function upgrade(address new_address) public restricted {
        Migrations upgraded = Migrations(new_address);
        upgraded.setCompleted(last_completed_migration);
    }
}
