var TweetWallet = artifacts.require("TweetWallet");
var TweetWalletFactory = artifacts.require("TweetWalletFactory");

module.exports = function(deployer) {
  deployer.deploy(TweetWallet("master")).then(function(){
    deployer.deploy(TweetWalletFactory, TweetWallet.address)
	});
};