// supertest is a library that allows you to do an integration test and is built on mocha
const request = require("supertest");
// index.js imports express which routes the get requests later to the right .js files
const app = require("../../../index");
let id;

describe("Test the GET APIs for processing", () => {
  it("should return a status of 200 and a message along with all the events data", (done) => {
    request(app)
      .get("/" + id)
      .then((response) => {
        expect(response.statusCode).toBe(200);
        expect(response.body).toEqual(expect.any(Object));
        expect(response.body.message).toEqual(
          "All events retrieved successfully"
        );
        expect(response.body.data).toEqual(expect.any(Array));
        // done to wait for expects to be finished
        done();
      });
  });
  it("should return a status of 200 and a message along with all the events data created by user", (done) => {
    request(app)
      .get("/user/" + id)
      .then((response) => {
        expect(response.statusCode).toBe(200);
        expect(response.body).toEqual(expect.any(Object));
        expect(response.body.message).toEqual(
          "All user events retrieved successfully"
        );
        expect(response.body.data).toEqual(expect.any(Array));
        // done to wait for expects to be finished
        done();
      });
  });
});
