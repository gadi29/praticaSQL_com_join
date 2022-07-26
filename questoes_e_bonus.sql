-- Questão 01
SELECT
	users.id as "userId",
	users.name,
	cities.name as city
FROM users
JOIN cities
	ON users."cityId"=cities.id
WHERE cities.name LIKE '%Rio de Janeiro%'
ORDER BY users.id ASC;

-- Questão 02
SELECT
	testimonials.id as "testimonialId",
	writer.name as writer,
	recipient.name as recipient,
	testimonials.message
FROM testimonials
JOIN users as writer
	ON testimonials."writerId"=writer.id
JOIN users as recipient
	ON testimonials."recipientId"=recipient.id
ORDER BY testimonials.id ASC;

-- Questão 03
SELECT
	users.id as "userId",
	users.name,
	courses.name as course,
	schools.name as school,
	educations."endDate"
FROM educations
JOIN users
	ON educations."userId"=users.id
JOIN courses
	ON educations."courseId"=courses.id
JOIN schools
	ON educations."schoolId"=schools.id
WHERE users.id=30 AND educations.status='finished'
ORDER BY educations."endDate" ASC;

-- Questão 04
SELECT
	users.id as "userId",
	users.name,
	roles.name as "role",
	companies.name as company,
	experiences."startDate"
FROM experiences
JOIN users
	ON experiences."userId"=users.id
JOIN roles
	ON experiences."roleId"=roles.id
JOIN companies
	ON experiences."companyId"=companies.id
WHERE experiences."userId"=50 AND experiences."endDate" IS NULL;

-- Bônus
SELECT
	schools.id as "schoolId",
	schools.name as "school",
	courses.name as "course",
	companies.name as "company",
	roles.name as "role"
FROM jobs
JOIN roles
	ON jobs."roleId"=roles.id
JOIN companies
	ON jobs."companyId"=companies.id
JOIN applicants
	ON jobs.id=applicants."jobId"
JOIN users
	ON applicants."userId"=users.id
JOIN educations
	ON educations."userId"=users.id
JOIN schools
	ON educations."schoolId"=schools.id
JOIN courses
	ON educations."courseId"=courses.id
WHERE
	jobs."companyId"=10 AND
	roles.name='Software Engineer' AND
	jobs.active=true;