const express = require("express");
const router = express.Router();
const db = require("../../db-init/dbConn");
// const validateUser = require("../../db-init/validation").validateUser;
// const sendOTP = require("../../middlewares/sendOTP").sendOTP;
// const bcrypt = require("bcrypt");
// const generateToken = require("../../middlewares/token").generateToken;

/*
    @route to get all events
    @required id (event id) 
*/
router.get("/:id", async (req, res, next) => {
  try {
    const id = req.params.id;
    let allEvents = await db.any(`select * from events where id = ${id}`);
    if (allEvents.length === 0) {
      // sends response code of 400 with an error message
      res.status(400).json({
        status: 400,
        message: "No event found",
      });
    } else {
      // sends a 200 status code with a successs message
      res.status(200).json({
        status: 200,
        message: "All events retrieved successfully",
        data: allEvents[0],
      });
    }
  } catch (error) {
    next(error);
  }
});

/*
    @route to delete an event
    @required id (event id) 
*/
router.delete("/:id", async (req, res, next) => {
  try {
    const id = req.params.id;
    const events = await db.any(
      `delete from events where id=${id} returning id`
    );
    if (events.length !== 1) {
      throw {
        statusCode: 404,
        customMessage: "Event does not exist",
      };
    }
    res.status(200).json({
      status: 200,
      message: "Deleted one event",
      data: events,
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
});

module.exports = router;
