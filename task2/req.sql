
#Query 1: What is the total number of reservations in the dataset?
SELECT 
    *
FROM
    hotel_reservation;


#Query 2:Which meal plan is the most popular among guests?
SELECT 
    type_of_meal_plan, COUNT(*) AS count
FROM
    hotel_reservation
GROUP BY type_of_meal_plan
ORDER BY count DESC
LIMIT 1;


#Query 3: What is the average price per room for reservations involving children?
SELECT 
    no_of_children, avg_price_per_room
FROM
    hotel_reservation
WHERE
    no_of_children > 0
GROUP BY no_of_children;


#Query 4: How many reservations were made for the year 20XX (replace XX with the desired year)?
SELECT 
    year(arrival_date) as Year, count(*) as total_reservation
FROM
    hotel_reservation
WHERE
    EXTRACT(YEAR FROM arrival_date) = 2017;


#Query 5: What is the most commonly booked room type?
SELECT 
    room_type_reserved AS Room_type,
    COUNT(room_type_reserved) AS count
FROM
    hotel_reservation
GROUP BY room_type_reserved
ORDER BY count DESC;



#Query 6: How many reservations fall on a weekend (no_of_weekend_nights > 0)?
SELECT 
    COUNT(booking_id) AS total_weekend_reservation
FROM
    hotel_reservation
WHERE
    no_of_weekend_nights > 0;


#Query 7: What is the highest and lowest lead time for reservations?
  SELECT 
    MIN(lead_time) AS min_lead_time,
    MAX(lead_time) AS max_lead_time
FROM
    hotel_reservation;
    


#Query 8: What is the most common market segment type for reservations?
    SELECT 
    market_segment_type, COUNT(market_segment_type) AS count
FROM
    hotel_reservation
GROUP BY market_segment_type
ORDER BY count DESC;


#Query 10: How many reservations have a booking status of "Confirmed"?
SELECT 
    COUNT(booking_id) AS num_of_Confirmed_booking
FROM
    hotel_reservation
WHERE
    booking_status = 'Not_Canceled';
    
    
#Query 10. What is the total number of adults and children across all reservations ?
    SELECT 
    COUNT(booking_id) AS Num_of_booking,
    SUM(no_of_adults) AS Total_num_of_adults,
    SUM(no_of_children) AS Total_num_of_children
FROM
    hotel_reservation;
    

#Query 11: What is the average number of weekend nights for reservations involving children?
SELECT 
    round(AVG(no_of_weekend_nights),1) AS avg_weekend_nights
FROM
    hotel_reservation
WHERE
    no_of_children > 0;
    
#Query 12: how many reservations were made in each month of the year?
    SELECT 
    month(arrival_date) AS month,
    COUNT(*) AS number_of_reservations
FROM
    hotel_reservation
GROUP by month(arrival_date)
ORDER BY count(*) asc;

#Query 13: What is the average number of nights (both weekend and weekday) spent by guests for each room type?
SELECT 
    room_type_reserved,
    round((no_of_weekend_nights)) AS
    Avg_weekend_nights,
    round(AVG(no_of_week_nights)) AS
    Avg_week_nights
FROM
    hotel_reservation
GROUP BY room_type_reserved;

#14. For reservations involving children, what is the most common room type, and what is the average price for that room type?
SELECT 
    room_type_reserved,
    COUNT(*) AS count,
    avg_price_per_room AS average_price
FROM
    hotel_reservation
WHERE
    no_of_children > 0
GROUP BY room_type_reserved
ORDER BY count DESC
LIMIT 1;


# 15. Find the market segment type that generates the highest average price per room.
SELECT 
    market_segment_type, avg_price_per_room
FROM
    hotel_reservation
GROUP BY market_segment_type
ORDER BY avg_price_per_room DESC
LIMIT 1;


