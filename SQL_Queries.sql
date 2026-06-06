-- Status Distribution
SELECT status, COUNT(*) AS total_requests
FROM uber_requests
GROUP BY status;

-- Requests by Pickup Point
SELECT pickup_point, COUNT(*) AS total_requests
FROM uber_requests
GROUP BY pickup_point;

-- Demand by Hour
SELECT HOUR(STR_TO_DATE(Request_timestamp,
'%d-%m-%Y %H:%i')) AS request_hour,
COUNT(*) AS total_requests
FROM uber_requests
GROUP BY request_hour
ORDER BY request_hour;

-- Status by pickup point
SELECT pickup_point,
status,
COUNT(*) AS total_requests
FROM uber_requests
GROUP BY pickup_point, status;

-- Top drivers by Completed Trips 
SELECT driver_id,
COUNT(*) AS completed_trips
FROM uber_requests
WHERE status='Trip Completed'
GROUP BY driver_id
ORDER BY completed_trips DESC
LIMIT 10;

-- Total cancelled trips
SELECT COUNT(*) AS cancelled_trips
FROM uber_requests
WHERE status='Cancelled';

-- Total No Cars Available Requests
SELECT COUNT(*) AS no_car_requests
FROM uber_requests
WHERE status='No Cars Available';

-- Demand-Supply Gap
SELECT status,
COUNT(*) AS total_requests
FROM uber_requests
WHERE status IN ('Cancelled','No Cars Available')
GROUP BY status;
