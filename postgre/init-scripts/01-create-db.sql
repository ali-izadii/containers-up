-- No need to create test_db - it already exists from POSTGRES_DB
-- Just switch to it and create tables

\c test_db;

CREATE TABLE IF NOT EXISTS test_users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for better query performance
-- CREATE INDEX IF NOT EXISTS idx_users_username ON users(username);
-- CREATE INDEX IF NOT EXISTS idx_users_email ON users(email);
-- CREATE INDEX IF NOT EXISTS idx_users_created_at ON users(created_at);

CREATE TABLE IF NOT EXISTS test_products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indexes for better query performance
-- CREATE INDEX IF NOT EXISTS idx_products_name ON products(name);
-- CREATE INDEX IF NOT EXISTS idx_products_price ON products(price);
-- CREATE INDEX IF NOT EXISTS idx_products_created_at ON products(created_at);

-- Insert sample data
INSERT INTO test_users (username, email) VALUES 
    ('john_doe', 'john@example.com'),
    ('jane_smith', 'jane@example.com')
ON CONFLICT (username) DO NOTHING;

INSERT INTO test_products (name, price) VALUES 
    ('Laptop', 999.99),
    ('Mouse', 29.99),
    ('Keyboard', 79.99)
ON CONFLICT DO NOTHING;