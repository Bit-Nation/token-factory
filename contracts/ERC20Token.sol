pragma solidity ^0.4.4;

contract ERC20Token {

     string public _symbol;
     string public _name;
     uint8 public _decimals;
     uint256 _totalSupply;

     address public _owner;

     mapping(address => uint256) balances;

     mapping(address => mapping (address => uint256)) allowed;

     function ERC20Token(address owner, string symbol, string name, uint8 decimals, uint256 totalSupply) {

         _owner = owner;
         _symbol = symbol;
         _name = name;
         _decimals = decimals;
         _totalSupply = totalSupply;

         balances[owner] = _totalSupply;

     }

     function totalSupply() constant returns (uint256 totalSupply) {

         totalSupply = _totalSupply;

     }

     function balanceOf(address _owner) constant returns (uint256 balance) {

         return balances[_owner];

     }

     // Transfer the balance from owner's account to another account
     function transfer(address _to, uint256 _amount) returns (bool success) {

         if (balances[msg.sender] >= _amount && _amount > 0 && balances[_to] + _amount > balances[_to]) {

             balances[msg.sender] -= _amount;
             balances[_to] += _amount;
             Transfer(msg.sender, _to, _amount);

             return true;

         }

         return false;

     }

     function transferFrom(address _from, address _to, uint256 _amount) returns (bool success) {

         if (balances[_from] >= _amount && allowed[_from][msg.sender] >= _amount && _amount > 0 && balances[_to] + _amount > balances[_to]) {

             balances[_from] -= _amount;
             allowed[_from][msg.sender] -= _amount;
             balances[_to] += _amount;
             Transfer(_from, _to, _amount);

             return true;

         }

         return false;

     }

     function approve(address _spender, uint256 _amount) returns (bool success) {

         allowed[msg.sender][_spender] = _amount;
         Approval(msg.sender, _spender, _amount);

         return true;

     }

     function allowance(address _owner, address _spender) constant returns (uint256 remaining) {

         return allowed[_owner][_spender];

     }

     event Transfer(address indexed _from, address indexed _to, uint _value);
     event Approval(address indexed _owner, address indexed _spender, uint _value);

}
