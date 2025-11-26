const hre = require("hardhat");

async function main() {
    // Change this name based on which contract you want to deploy
    const contractName = "Day2_DataStructures";

    const Factory = await hre.ethers.getContractFactory(contractName);
    const contract = await Factory.deploy();

    await contract.waitForDeployment();

    console.log(`${contractName} deployed to:`, await contract.getAddress());
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
