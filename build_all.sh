rm -rf node_modules
rm -rf ../protocol-v2/sdk/node_modules
rm -rf ../velocity-common/common-ts/node_modules

echo "building sdk..."
cd ../protocol-v2/sdk
yarn clean && yarn && yarn build && yarn link
cd ../../dlob-server

echo "building velocity-common..."
cd ../velocity-common/common-ts
yarn clean && yarn && yarn build && yarn link
cd ../../dlob-server

echo "building dlob server..."
yarn clean && yarn link "@velocity-exchange/sdk" && yarn link "@velocity-exchange/common" && yarn && yarn build
