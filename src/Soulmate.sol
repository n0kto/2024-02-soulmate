// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {ERC721} from "@solmate/tokens/ERC721.sol";

contract Soulmate is ERC721 {
    uint256 nextID = 1;

    string[4] niceWords = ["sweetheart", "darling", "my dear", "honey"];

    mapping(uint256 id => address[2] owners) public idToOwners;
    mapping(address owner => uint256 id) public ownerToId;

    mapping(bytes32 id => string) public sharedSpace;

    modifier alreadyHaveASoulmate() {
        require(ownerToId[msg.sender] == 0);
        _;
    }

    constructor() ERC721("Soulmate", "SLMT") {}

    function mintToken() public alreadyHaveASoulmate {
        // Since there is only 8 billions people on earth, there is no need to check the supply.
        // known issue : no limit mint
        if (idToOwners[nextID][0] == address(0)) {
            idToOwners[nextID][0] = msg.sender;
            ownerToId[msg.sender] = nextID;
        } else if (idToOwners[nextID][1] == address(0)) {
            idToOwners[nextID][1] = msg.sender;
            // Once 2 soulmates are reunited, the token is minted
            _mint(msg.sender, nextID++);
        }
        ownerToId[msg.sender] = nextID;
    }

    function tokenURI(uint256) public pure override returns (string memory) {
        return "";
    }

    function totalSupply() external view returns (uint256) {
        return nextID - 1;
    }

    function transferFrom(
        address from,
        address to,
        uint256 id
    ) public override {
        // Soulbound token cannot be transfered

        // This require is enough thanks to those in the parent function: from == msg.sender and from == _owner(id)
        require(ownerToId[msg.sender] != id);
        super.transferFrom(from, to, id);
    }

    function writeMessageInSharedSpace(
        address soulmate1,
        address soulmate2,
        string calldata message
    ) external {
        require(soulmate1 == msg.sender || soulmate2 == msg.sender);
        bytes32 id = keccak256(abi.encodePacked(soulmate1, soulmate2));
        sharedSpace[id] = message;
    }

    function readMessageInSharedSpace(
        address soulmate1,
        address soulmate2
    ) external view returns (string memory) {
        bytes32 id = keccak256(abi.encodePacked(soulmate1, soulmate2));

        // Add a little touch of romantism
        return
            string.concat(
                sharedSpace[id],
                ", ",
                niceWords[block.timestamp % niceWords.length]
            );
    }
}
