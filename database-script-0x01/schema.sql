CREATE DATABASE alx_airbnb_database;


CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    phone VARCHAR(20),
    is_host BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE property (
    id SERIAL PRIMARY KEY,
    host_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    address TEXT,
    city VARCHAR(100),
    state VARCHAR(100),
    country VARCHAR(100),
    price_per_night DECIMAL(10, 2) NOT NULL,
    max_guests INTEGER,
    num_bedrooms INTEGER,
    num_bathrooms INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    property_id INTEGER REFERENCES property(id) ON DELETE CASCADE,
    guest_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    check_in DATE NOT NULL,
    check_out DATE NOT NULL,
    total_price DECIMAL(10, 2),
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE payments (
    id SERIAL PRIMARY KEY,
    booking_id INTEGER REFERENCES bookings(id) ON DELETE CASCADE,
    amount DECIMAL(10, 2),
    payment_method VARCHAR(100),
    payment_status VARCHAR(50),
    paid_at TIMESTAMP
);


CREATE TABLE reviews (
    id SERIAL PRIMARY KEY,
    property_id INTEGER REFERENCES property(id) ON DELETE CASCADE,
    reviewer_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    rating INTEGER CHECK (rating BETWEEN 1 AND 5),
    comment TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);