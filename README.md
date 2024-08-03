# `EXT`

Welcome to your new `EXT` project and to the Internet Computer development community. By default, creating a new project adds this README and some template files to your project directory. You can edit these template files to customize your project and to include your own code to speed up the development cycle.

To get started, you might want to explore the project directory structure and the default configuration file. Working with this project in your development environment will not affect any production deployment or identity tokens.

To learn more before you start working with `EXT`, see the following documentation available online:

- [Quick Start](https://internetcomputer.org/docs/current/developer-docs/setup/deploy-locally)
- [SDK Developer Tools](https://internetcomputer.org/docs/current/developer-docs/setup/install)
- [Motoko Programming Language Guide](https://internetcomputer.org/docs/current/motoko/main/motoko)
- [Motoko Language Quick Reference](https://internetcomputer.org/docs/current/motoko/main/language-manual)

If you want to start working on your project right away, you might want to try the following commands:

```bash
cd EXT/
dfx help
dfx canister --help
```

## Running the project locally

If you want to test your project locally, you can use the following commands:

```bash
# Starts the replica, running in the background
dfx start --background

# Deploys your canisters to the replica and generates your candid interface
dfx deploy
```

Once the job completes, your application will be available at `http://localhost:4943?canisterId={asset_canister_id}`.

If you have made changes to your backend canister, you can generate a new candid interface with

```bash
npm run generate
```

at any time. This is recommended before starting the frontend development server, and will be run automatically any time you run `dfx deploy`.

If you are making frontend changes, you can start a development server with

```bash
npm start
```

Which will start a server at `http://localhost:8080`, proxying API requests to the replica at port 4943.

### Note on frontend environment variables

If you are hosting frontend code somewhere without using DFX, you may need to make one of the following adjustments to ensure your project does not fetch the root key in production:

- set`DFX_NETWORK` to `ic` if you are using Webpack
- use your own preferred method to replace `process.env.DFX_NETWORK` in the autogenerated declarations
  - Setting `canisters -> {asset_canister_id} -> declarations -> env_override to a string` in `dfx.json` will replace `process.env.DFX_NETWORK` with the string in the autogenerated declarations
- Write your own `createActor` constructor


# EXT NFT_STANDARD MOTOKO Canister Installation and Local Deployment

This guide will walk you through the installation and local deployment of an EXT NFT_STANDARD MOTOKO Canister. Please follow the steps carefully to ensure successful deployment and operation.

## Prerequisites

- Ensure you have `dfx` (DFINITY's SDK) installed on your system. You can download it from [DFINITY's official site](https://sdk.dfinity.org/docs/quickstart/quickstart.html).
- A working knowledge of the command line.
- An Internet Computer identity principal. You can create one using `dfx`.

## Steps

### 1. Start the Local Internet Computer

First, start the local Internet Computer in the background:

```bash
dfx start --background
```

### 2. Deploy the Canister

Deploy the canister using the specified ID:

```bash
dfx deploy --specified-id bkyz2-fmaaa-aaaaa-qaaaq-cai EXT_backend
```

During the deployment, you will be asked for the principal of the minter. Use your own principal, which can be obtained using the following command:

```bash
dfx identity use anonymous
dfx identity get-principal
dfx identity use `previous-identity`
```

Copy and paste the principal you get when prompted.

### 3. Mint an NFT

After the canister is deployed, you can mint an NFT using the following command:

```bash
dfx canister call EXT_backend mintNFT '(to :principal  '<principal of user to send the nft>', metadata : "{\22name\22:\22Minimalistic Villas#0\22,\22mimeType\22:\22image\22,\22url\22:\22https://cf-assets.yuku.app/BatchMint/Minimalistic/0.png\22,\22thumb\22:\22https://cf-assets.yuku.app/BatchMint/Minimalistic/0_thumb.png\22,\22description\22:\22This is the NFT from Minimalistic Villas collection\22,\22attributes\22:[{\22trait_type\22:\22Common\22,\22value\22:\22Common\22}]}")'
```

### Example

1. Get your principal:

```bash
dfx identity get-principal
```

2. Replace `<principal of user to send the nft>` with the principal you want to have the NFT.

3. Run the command to mint the NFT.

## Notes

- Make sure your principal is correctly copied and pasted.
- The metadata in the minting command can be customized to match your NFT's attributes.

## Troubleshooting

- If you encounter any issues with `dfx start`, ensure no other instance of the Internet Computer is running.
- Verify your principal by running `dfx identity get-principal` again if you encounter authentication errors.

For further assistance, refer to [DFINITY's documentation](https://sdk.dfinity.org/docs/developers-guide/overview.html) or reach out to the community for support.
