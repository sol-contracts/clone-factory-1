pragma solidity 0.4.23;

import "./TweetWallet.sol";
import "./CloneFactory.sol";

contract TweetWalletFactory is CloneFactory {

  address public libraryAddress;

  event TweetWalletCreated(address newThingAddress, address libraryAddress);

  constructor (address _libraryAddress) public {
    libraryAddress = _libraryAddress;
  }

  function onlyCreate() public {
    createClone(libraryAddress);
  }

  function createTweetWallet(string _username) public {
    address clone = createClone(libraryAddress);
    TweetWallet(clone).init(_username);
    emit TweetWalletCreated(clone, libraryAddress);
  }
}
