\c event_management;
-- inserting countries into countries table

INSERT INTO events
    (event_id, event_name,event_description, event_location, event_type_id,event_date,event_region_id,event_website,event_status_id,organizer_name,organizer_email,organizer_phone_number,organizer_website,user_id)
VALUES     (1, 'Dance party','All those crazy people who want to loosen up and just have some fun. 
Come lets dance and forget the world.',

'location',1,'27-07-2020',1,'www.facebook.com',1,'organiser name','organiser@gmail.com',123456789,'www.organiserwebsite.com',1),
 (2, 'Dance party','All those crazy people who want to loosen up and just have some fun. 
Come lets dance and forget the world.',

'location',1,'27-07-2020',1,'www.facebook.com',1,'organiser name','organiser@gmail.com',123456789,'www.organiserwebsite.com',1);