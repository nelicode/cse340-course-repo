import db from './db.js';

const getAllCategories = async () => {
    const query = `
        SELECT category_id, category_name
        FROM public.category
        ORDER BY category_name;
    `;
    const result = await db.query(query);
    return result.rows;
};
const getCategoryDetails = async (categoryId) => {
    const query = `
        SELECT category_id, category_name
        FROM category
        WHERE category_id = $1;
    `;
    const queryParams = [categoryId];
    const result = await db.query(query, queryParams);
    return result.rows.length > 0 ? result.rows[0] : null;
};

const getProjectsByCategoryId = async (categoryId) => {
    const query = `
        SELECT p.project_id, p.title
        FROM service_project p
        JOIN project_category pc ON p.project_id = pc.project_id
        WHERE pc.category_id = $1
        ORDER BY p.title;
    `;
    const queryParams = [categoryId];
    const result = await db.query(query, queryParams);
    return result.rows;
};

export { getAllCategories, getCategoryDetails, getProjectsByCategoryId };
