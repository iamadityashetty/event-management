const express = require("express");
const app = express();
const bodyParser = require("body-parser");
const cors = require("cors");
const logger = require("morgan");
const db = require("./db-init/dbConn");

// const error = require("./middlewares/error");
// const auth = require("./middlewares/auth");

// importing router files
const events = require("./routes/api/events");

const auth = require("./middlewares/auth");

app.use(bodyParser.json());
app.use(cors());
app.disable("etag");
app.use(
  bodyParser.urlencoded({
    extended: false,
  })
);
// [Ankit] To view the logs in cmd console
app.use(logger("common"));

app.use("/api/events", events);

// app.use(error);

const port = process.env.PORT || 5000;

db.connect()
  .then((obj) => {
    obj.done(); // success, release connection;
    if (process.env.NODE_ENV !== "test")
      app.listen(port, () =>
        console.log(`Server is listening at http://localhost:${port}`)
      );
  })
  .catch((error) => {
    console.log("ERROR:", error.message);
  });

module.exports = app;
