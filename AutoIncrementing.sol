pragma solidity ^0.4.24;


/**
 * @title AutoIncrementing
 * @author Matt Condon (@shrugs)
 * @dev Provides an auto-incrementing uint256 id acquired by the `Counter#nextId` getter.
 * Use this for issuing ERC721 ids or keeping track of request ids, anything you want, really.
 *
 * Include with `using AutoIncrementing for AutoIncrementing.Counter;`
 * @notice Does not allow an Id of 0, which is popularly used to signify a null state in solidity.
 * Does not protect from overflows, but if you have 2^256 ids, you have other problems.
 * (But actually, it's generally impossible to increment a counter this many times, energy wise
 * so it's not something you have to worry about.)
 */
library AutoIncrementing {

    struct CounterUser {
        uint256 prevId; // default: 0
    }

    struct CounterProperty {
        uint256 prevId; // default: 0
    }
    
    struct CounterContract {
        uint256 prevId; // default: 0
    }

    function nextIdUser(CounterUser storage counter)
      internal
      returns (uint256)
    {
        counter.prevId = counter.prevId + 1;
        return counter.prevId;
    }

    function nextIdProperty(CounterProperty storage counter)
      internal
      returns (uint256)
    {
        counter.prevId = counter.prevId + 1;
        return counter.prevId;
    }
    
    function nextIdContract(CounterContract storage counter)
      internal
      returns (uint256)
    {
        counter.prevId = counter.prevId + 1;
        return counter.prevId;
    }
}

