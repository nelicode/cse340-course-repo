import db from './db.js';

/**
 * Retrieves all service projects along with their sponsoring organization names.
 */
export async function getAllProjects() {
    try {
        const query = `
            SELECT 
                p.project_id,
                p.title,
                p.description,
                p.location,
                p.date,
                o.name AS organization_name
            FROM service_project p
            JOIN organization o ON p.organization_id = o.organization_id
            ORDER BY p.date ASC;
        `;
        const result = await db.query(query);
        return result.rows;
    } catch (error) {
        console.error('Error retrieving service projects:', error.message);
        throw error;
    }
}