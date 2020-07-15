drop database if exists event_management;
create database event_management;

\c event_management;

-- creating the otp table
CREATE TABLE otp
(
    id serial,
    otp_no INT,
    email VARCHAR(255),
    PRIMARY KEY(id, otp_no, email)
);

-- creates users table
CREATE TABLE users
(
    user_id SERIAL,
    email VARCHAR(255),
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    user_password VARCHAR(255),
    isAdmin BOOLEAN,
    isSubscribed BOOLEAN,
    PRIMARY KEY(user_id)
);
-- lookup table for event type
CREATE TABLE event_type
(
    event_type_id SERIAL,
    event_type VARCHAR,
    PRIMARY KEY(event_type_id)
);

-- creates events table
CREATE TABLE events
(
    event_id SERIAL,
    event_name VARCHAR(255),
    event_description VARCHAR(255),
    event_location VARCHAR(255),
    event_type_id INT,
    event_date DATE,
    event_region_id INT,
    event_website VARCHAR,
    user_id INT,
    
    PRIMARY KEY(event_id),
            FOREIGN KEY (user_id) REFERENCES users(user_id),
                        FOREIGN KEY (event_type_id) REFERENCES event_type(event_type_id)


);




-- REGION TABLE

CREATE TABLE region
(
    region_id SERIAL,
    region_name VARCHAR,
    PRIMARY KEY(region_id)
);

-- states
CREATE TABLE states
(
    state_id SERIAL,
    state_name VARCHAR,
    region_id INT,
    PRIMARY KEY(state_id),
        FOREIGN KEY (region_id) REFERENCES region(region_id)

);
