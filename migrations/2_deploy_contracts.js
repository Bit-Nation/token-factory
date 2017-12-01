const ERC20Token = artifacts.require("./ERC20Token.sol");

module.exports = function(deployer) {
  deployer.deploy(ERC20Token);
  //deployer.deploy(ConvertLib);
  //deployer.link(ConvertLib, MetaCoin);
  //deployer.deploy(MetaCoin);
};
