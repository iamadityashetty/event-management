const express = require("express");
const router = express.Router();
const db = require("../../db-init/dbConn");
const validateUser = require("../../db-init/validation").validateUser;
// const sendOTP = require("../../middlewares/sendOTP").sendOTP;
const bcrypt = require("bcrypt");
const generateToken = require("../../middlewares/token").generateToken;

/*
    @route to get all events
    @required event_id (event id) 
    @required event_status (event status)
*/
router.get("/:event_id", async (req, res, next) => {
  try {
    const { event_id } = req.params;
    const { event_status } = req.body;
    let allEvents = await db.any(
      `select * from events where event_id = ${event_id} AND event_status ='${event_status}'`
    );
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
    @route to get all events created by user
    @required user_id (user id)
*/
router.get("/user/:user_id", async (req, res, next) => {
  try {
    const { user_id } = req.params;
    let userEvents = await db.any(
      `select * from events where user_id = ${user_id}`
    );
    if (userEvents.length === 0) {
      // sends response code of 400 with an error message
      res.status(400).json({
        status: 400,
        message: "No event found",
      });
    } else {
      // sends a 200 status code with a successs message
      res.status(200).json({
        status: 200,
        message: "All user events retrieved successfully",
        data: userEvents[0],
      });
    }
  } catch (error) {
    next(error);
  }
});

/*
   @route to create a new event
   @required organizer_name (organizer name)
   @required organizer_phone_number (organizer phone number)
   @required organizer_website_url (organizer website url)
   @required event_name (event name)
   @required event_description (event description)
   @required event_date (event date)
   @required event_region (event region)
   @required event_state (event state)
   @required event_type (event type)
   @required event_status (event status)
 */
router.post("/", async (req, res, next) => {
  try {
    const {
      organizer_name,
      organizer_phone_number,
      organizer_website_url,
      event_name,
      event_description,
      event_date,
      event_region,
      event_state,
      event_type,
      event_status,
    } = req.body;
    //Check if valid details are provided
    //If not, throw an error with appropriate message
    if (
      !organizer_name ||
      !organizer_website_url ||
      !event_name ||
      !event_description ||
      !event_date ||
      !event_region ||
      !event_state ||
      !event_type ||
      !event_status ||
      (organizer_phone_number &&
        organizer_phone_number.toString().length !== 10)
    ) {
      const statusCode = 400;
      const customMessage = `All parameters are required.${
        !organizer_name ? " Organizer name is required." : ""
      }${!organizer_website_url ? " URL is missing." : ""}${
        !organizer_phone_number ? " Phone number is missing." : ""
      }${
        organizer_phone_number &&
        organizer_phone_number.toString().length !== 10
          ? " Please enter a valid phone number."
          : ""
      }${!event_name ? " Event name is required." : ""}${
        !event_description ? " Event description is required." : ""
      }${!event_date ? " Event date is required." : ""}${
        !event_region ? " Event region is required." : ""
      }${!event_state ? " Event state is required." : ""}${
        !event_type ? " Event type is required." : ""
      }${!event_status ? " Event status is required." : ""}`;
      throw {
        statusCode,
        customMessage,
      };
    }

    //construct the query
    // console.log(query);
    //run the query
    db.tx((t) => {
      const eventQuery = `insert into applications (organizer_name,organizer_website_url,organizer_phone_number,event_name,event_description,event_date,event_region,event_state,event_type,event_status) values('${organizer_name}','${organizer_website_url}','${organizer_phone_number}','${event_name}','${event_description}','${event_date}','${event_region}','${event_state}','${event_type}','${event_status}') returning id`;
      return t.one(eventQuery).then((event) => {
        console.log(event);
      });
    })
      .then((event) => {
        res.status(200).json({
          status: 200,
          message: "New Event Created Successfully",
          data: event,
        });
      })
      .catch((err) => {
        console.log(err);
        next(err);
      });
  } catch (err) {
    console.log(err);
    next(err);
    //In case of any error, pass it to the error middleware
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
      `delete from events where id = ${id} returning id`
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

/*
    @route to update an event status
    @required id (event id)
    @required event_status (event status)
*/
router.put("/status/:id", async (req, res, next) => {
  try {
    const { id } = req.params;
    const { event_status } = req.body;

    if (!id) {
      //Check if valid id is provided.
      //If not, throw an error with appropriate message
      throw {
        statusCode: 400,
        customMessage: "Event id is required",
      };
    }
    //Create initial query

    const eventStatus = `update users set event_status = '${event_status}' where id = ${id}`;
    await db.any(eventStatus);
    //Run the query

    //Send response to user along with all updated fields
    res.status(200).json({
      status: 200,
      message: "Updated Event Status Successfully",
      data: eventStatus,
    });
  } catch (err) {
    console.log(err);
    next(err);
  }
});

/*
    @route to login
    @required email (email address)
    @required password (password)
*/
router.post("/login", async (req, res, next) => {
  try {
    // checks if email and password params are passed or not, if not throws error
    if (req.body) {
      if (
        !req.body.hasOwnProperty("email") ||
        !req.body.hasOwnProperty("password")
      ) {
        throw {
          statusCode: 400,
          customMessage: "params are absent",
        };
      }
    }

    const { email, password } = req.body;

    const user = {
      email,
    };

    // checks for the validation of email
    const { error } = validateUser(user);

    // throws the error message if email param is empty or email is invalid
    if (error !== undefined) {
      console.log("ValidationError: ", error.details[0].message);
      throw {
        statusCode: 404,
        customMessage: error.details[0].message.replace(/"/g, ""),
      };
    }

    // checks if the email id already exists or not
    let query = `select * from users where email = '${email}'`;
    let userResult = await db.any(query);

    // returns 400 status with message user already exists
    if (userResult.length < 1) {
      throw {
        statusCode: 400,
        customMessage: "Account not found",
      };
    } else {
      // checking the user entered password with existing db password
      if (!bcrypt.compareSync(password, userResult[0].password)) {
        throw {
          statusCode: 404,
          customMessage: "Invalid credentials",
        };
      }

      // sets the token with payload id and role (user or admin)
      const token = generateToken({
        user_id: userResult[0].id,
        role: userResult[0].role,
      });

      // sends positive response to client with token, userData, message and status code 200
      res.status(200).json({
        statusCode: 200,
        token: token,
        userData,
        message: "Logged in successful",
      });
    }
  } catch (err) {
    console.log(err);
    next(err);
  }
});

module.exports = router;
