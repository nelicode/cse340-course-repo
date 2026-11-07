-- ========================================
-- Organization Table Setup
-- ========================================
CREATE TABLE organization (
    organization_id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    contact_email VARCHAR(255) NOT NULL,
    logo_filename VARCHAR(255) NOT NULL
);

-- ========================================
-- Insert Sample Data: Organizations
-- ========================================
INSERT INTO organization (name, description, contact_email, logo_filename) VALUES
('BrightFuture Builders', 'A nonprofit focused on improving community infrastructure through sustainable construction projects.', 'info@brightfuturebuilders.org', 'brightfuture-logo.png'),
('GreenHarvest Growers', 'An urban farming collective promoting food sustainability and education in local neighborhoods.', 'contact@greenharvest.org', 'greenharvest-logo.png'),
('UnityServe Volunteers', 'A volunteer coordination group supporting local charities and service initiatives.', 'hello@unityserve.org', 'unityserve-logo.png');

-- ========================================
-- Service Projects Table Setup
-- ========================================
CREATE TABLE service_project (
    project_id SERIAL PRIMARY KEY,
    organization_id INT NOT NULL,
    title VARCHAR(150) NOT NULL,
    description TEXT NOT NULL,
    location VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    CONSTRAINT fk_organization
        FOREIGN KEY (organization_id)
        REFERENCES organization(organization_id)
        ON DELETE CASCADE
);

-- ========================================
-- Insert Sample Data: Service Projects
-- ========================================
INSERT INTO service_project (organization_id, title, description, location, date) VALUES
-- Proyectos para BrightFuture Builders (ID 1)
(1, 'Community Center Renovation', 'Repairing and painting the local community hall roof and walls.', 'Arequipa - Cerro Colorado', '2026-06-15'),
(1, 'Park Playground Build', 'Constructing safe wooden playground structures for children.', 'Arequipa - Zamácola', '2026-06-22'),
(1, 'Accessibility Ramp Installation', 'Building wheelchair ramps for public community buildings.', 'Arequipa - Centro', '2026-07-05'),
(1, 'Library Shelving Assembly', 'Building and installing custom bookshelves for the neighborhood library.', 'Arequipa - Yanahuara', '2026-07-18'),
(1, 'Bridge Repair Assistance', 'Assisting engineers in reinforcing a small pedestrian bridge.', 'Cusco - Espinar', '2026-08-01'),

-- Proyectos para GreenHarvest Growers (ID 2)
(2, 'Urban Garden Setup', 'Creating vegetable beds and installing drip irrigation in vacant lots.', 'Arequipa - Cerro Colorado', '2026-06-10'),
(2, 'Composting Workshop', 'Teaching local residents how to turn organic waste into rich compost fertilizer.', 'Arequipa - Cayma', '2026-06-20'),
(2, 'Tree Planting Initiative', 'Planting native fruit trees along community pathways.', 'Arequipa - Selva Alegre', '2026-07-02'),
(2, 'School Greenhouse Maintenance', 'Repairing plastic sheeting and planting seeds for the school greenhouse.', 'Cusco - Espinar', '2026-07-15'),
(2, 'Harvest Festival Market', 'Organizing a local organic produce market and educational fair.', 'Arequipa - Centro', '2026-08-10'),

-- Proyectos para UnityServe Volunteers (ID 3)
(3, 'Food Drive Distribution', 'Sorting and packing grocery boxes for low-income families.', 'Arequipa - Zamácola', '2026-06-12'),
(3, 'Youth Tutoring Program', 'Providing free math and English tutoring for middle school students.', 'Arequipa - Cerro Colorado', '2026-06-18'),
(3, 'Elderly Care Visit', 'Spending time, playing board games, and bringing supplies to a retirement home.', 'Arequipa - Yanahuara', '2026-07-08'),
(3, 'Winter Clothing Drive', 'Collecting and distributing warm coats and blankets ahead of winter.', 'Cusco - Espinar', '2026-07-25'),
(3, 'Neighborhood Cleanup Day', 'Picking up litter and clearing plastic waste from public parks and streets.', 'Arequipa - Paucarpata', '2026-08-05');


--Create the category table
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- 2. Create the junction table (Many-to-Many relationship)
CREATE TABLE project_category (
    project_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    PRIMARY KEY (project_id, category_id),
    FOREIGN KEY (project_id) REFERENCES service_project (project_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE
);

-- 3. Insert at least 3 categories
INSERT INTO category (category_name) VALUES 
('Environmental'), 
('Community Service'), 
('Education');

-- 4. Associate projects with at least one category
-- (Assuming your projects have IDs from 1 to 15)
INSERT INTO project_category (project_id, category_id) VALUES
(1, 1), (2, 2), (3, 2), (4, 3), (5, 2),
(6, 1), (7, 1), (8, 1), (9, 1), (10, 3),
(11, 2), (12, 2), (13, 2), (14, 2), (15, 2);