// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 < 0.8.0;

contract Crowd {
    uint256 public total;
    address payable public needy;
    address public owner;
    constructor() public {
        total=0;
        owner=msg.sender;
    }
    modifier onlyOwner()  {
         require(msg.sender==owner); 
         _;
    }
    function donate() public payable{
           total=total+msg.value;
    }
    function registerNeedy() public {
            needy=msg.sender;
    }
    function distribute() public onlyOwner {
       
        needy.transfer(total);
        total=0;
        needy=address(0);
    }
 
}