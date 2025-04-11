// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataType {
    uint256 public positiveNumber = 100;
    int256 public negativeNumber = -50;
    address public recipient;
    address public wallet = address(0);

    constructor(address _recipient) {
        recipient = _recipient;
    }

    function setPositiveNumber(uint256 _positiveNumber) public {
        positiveNumber = _positiveNumber;
    }
    //함수명 사용 시 데이터타입 잘 신경쓰기!
    function setNegativeNumber(int256 _negativeNumber) public {
        negativeNumber = _negativeNumber;
    }

    bool public isActive = true;
    function toggleActive() public {
        isActive = !isActive;
    }

    function setWallet(address newWallet) public {
        wallet = newWallet;
        recipient = newWallet;
    }

    bytes32 public fixedData = "0xabcdef123456";
    bytes public dynamicData = "";

    function setFixedData(bytes32 _fixedData) public {
        fixedData = _fixedData;
    }

    function setDynamicData(bytes memory _dynamicData) public {
        dynamicData = _dynamicData;
    }

    function getDynamicDataLength() public view returns (uint) {
        return dynamicData.length;
    }

    function getDynamicDataAsString() public view returns (string memory) {
        return string(dynamicData);
    }

    enum State {
        Created,
        Active,
        Inactive
    }

    State public currentState = State.Active;

    function setState(uint _state) public {
        require(_state <= uint(State.Inactive), "revert");
        currentState = State(_state);
    }

    function getDetails()
        public
        view
        returns (uint, int, bool, address, address, bytes32, bytes memory, uint)
    {
        return (
            positiveNumber,
            negativeNumber,
            isActive,
            wallet,
            recipient,
            fixedData,
            dynamicData,
            uint(currentState)
        );
    }
}
