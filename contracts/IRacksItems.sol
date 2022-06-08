// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

interface IRacksItems { 
   
 
  struct itemOnSale{
    uint256 tokenId;
    uint256 marketItemId;
    uint256 price;
    address itemOwner;
    bool isOnSale;
  }

  struct caseTicket {
    address owner;
    address spender;
    uint256 numTries;
    uint256 timeWhenSold;
    uint256 duration;
    uint256 price;

  }


  
  event CaseOpened(address user, uint256 casePrice, uint256 item);
  event casePriceChanged(uint256 newPrice);
  event itemExchanged(address user, uint256 tokenId);
  event sellingItem(address user, uint256 tokenId, uint256 price);
  event itemBought(address buyer, address seller, uint256 marketItemId, uint256 price);
  event unListedItem(address owner, uint256 marketItemId);
  event itemPriceChanged(address owner, uint256 marketItemId, uint256 oldPrice, uint256 newPrice);
  event newTicketOnSale(address seller, uint256 numTries, uint256 _hours, uint256 price);
  event unListTicketOnSale(address owner);
  event ticketConditionsChanged(address owner, uint256 newTries, uint256 newHours, uint256 newPrice);
  event ticketBought(address oldOwner, address newOwner, uint256 price);
  event ticketClaimedBack(address borrower, address realOwner);
  

  
  function getTicketData(address user) external view returns(uint256 durationLeft, uint256 triesLeft, uint256 ownerOrSpender);
  function getCasePrice() external view returns(uint256);

  function openCase() external;

  function supplyOfItem(uint256 tokenId) external view returns(uint);
  function viewItems(address owner) external view returns(uint256[] memory);



 
  function listItemOnMarket(uint256 marketItemId, uint256 price) external;

  
  function changeMarketItem(uint256 marketItemId,  uint256 newPrice) external;

  function exchangeItem(uint256 tokenId) external;

  function buyItem(uint256 marketItemId) external;

  function getMarketItem(uint marketItemId) external view returns(itemOnSale memory);

  function getItemsOnSale() external view returns(itemOnSale[] memory);

  function listTicket(uint256 numTries, uint256 _hours, uint256 price) external;

  function changeMarketTicket(uint256 newTries, uint256 newHours, uint256 newPrice) external;

  function buyTicket(address owner) external;

  function claimTicketBack() external;

   function getTicketsOnSale() external view returns(caseTicket[] memory);

  function isVip(address user) external view returns(bool) ;

  function memberList() external view returns(address [] memory);
  
  
  function uri(uint256 tokenId) external view returns (string memory);

  function receiveFunds() external payable;


}