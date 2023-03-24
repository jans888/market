const nodemailer = require("nodemailer");
const smtpTransport = require("nodemailer-smtp-transport");
const link = `http://localhost:3000`;
const email = process.env.EMAIL_USER;
const password = process.env.EMAIL_PASS;

const transporter = nodemailer.createTransport(
  smtpTransport({
    service: "gmail",
    auth: {
      user: email,
      pass: password,
    },
  })
);

const send = (destination, token, type) => {
  return new Promise(async (resolve, reject) => {
    try {
      if (type === "verify") {
        const info = await transporter.sendMail({
          from: email,
          to: destination,
          subject: "Account Verification",
          html: `
            Hello ${destination},
            <br/>
            <br/>
            Thank you for registering on the app!
            <br/>
            <br/>
            In order for your email to be used for logging in, we need to verify your email address. Please use the link below to confirm your email address and complete the process.
            <br/>
            <br/>
            Click this link to verify your account : <a href="${link}/register/?email=${destination}&token=${token}">Verirfy Now</a>
            <br/>
            <br/>
            Thank you,
            <br/>
            <br/>
            The team
          `,
        });
        resolve(info);
      } else if (type === "forgot") {
        const info = await transporter.sendMail({
          from: email,
          to: destination,
          subject: "Reset Password",
          html: `
            Hello ${destination},
            <br/>
            <br/>
            Please use the link below to reset your password and complete the process.
            <br/>
            <br/>
            Click this link to reset your password : <a href="${link}/reset/?email=${destination}&token=${token}">Reset Now</a>
            <br/>
            <br/>
            Thank you,
            <br/>
            <br/>
            The team
          `,
        });
        resolve(info);
      }
    } catch (error) {
      reject(error);
    }
  });
};

module.exports = {
  send,
};
