const fs = require('fs');
let auth;

if (process.env.RPCCOOKIE) {
  try {
    auth = fs.readFileSync(process.env.RPCCOOKIE);
  } catch (e) {
    console.log(e);
  }
}

if (process.env.RPCAUTH) {
    auth = process.env.RPCAUTH;
}

if (!auth) {
  console.log(`RPCAUTH or RPCCOOKIE must be specified`);
}

module.exports = require('yajrpc/qup')({
  url: process.env.RPC || 'http://localhost:18443',
  auth: auth,
  batch: process.env.RPCBATCHSIZE || 500,
  concurrent: process.env.RPCCONCURRENT || 16
})
