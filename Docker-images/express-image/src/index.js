/**
 * @fileoverview Entrypoint of an Express Application
 * @author  Gabrielli Alexandre 
 */

const express = require("express");
const app = express();

const { User } = require("./users");
/**
 * Route : /test
 */
app.get("/test", (req, res) => {
  res.send("Hello - test is working\n");
});

/**
 * Route : /
 * Send an array of randomly generated users
 */
app.get("/", (req, res) => {
  res.send(User.generate());
});

app.listen(3000, () => {
  console.log("Accepting HTTP requests on port 3000");
});