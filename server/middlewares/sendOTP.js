const config = require("config");
const email = config.get("mailId");
const password = config.get("mailPass");
const nodemailer = require("nodemailer");
const db = require("../db-init/dbConn");

module.exports.sendOTP = async (userEmail) => {
  console.log("OTP FUNCTION EMAIL ID -> ", userEmail);
  try {
    var otp = Math.floor(Math.random() * 599999 + 299999);
    console.log("OTP IS -> ", otp);

    // Hashing the otp using bcrypt - Aditya [27-04-2020]
    const query = `insert into otp (otp_no,email) values(${otp},'${userEmail}')`;
    db.any(query);

    // Specifying the smtp service - Aditya [27-04-2020]
    var smtpTransport = nodemailer.createTransport({
      service: "Gmail",
      auth: {
        user: email,
        pass: password,
      },
    });
    // Sending the mail to the the user with the given email - Aditya [27-04-2020]
    await smtpTransport.sendMail({
      from: email,
      to: userEmail,
      subject: "Here's your OTP to register on HSDB",
      html:
        "Hi " +
        userEmail +
        ". Please DO NOT share OTP with anyone." +
        " Your OTP is " +
        otp,
    });
    return true;
  } catch (err) {
    console.log(err);
  }
};
