
## Features

- JWT authentication

- Nodemailer for email verification

- Upload image using multer

- Form validation using joi

- CRUD for all tables required in the application

## Built With

- [ExpressJs](https://expressjs.com/)
- [MySQL](https://www.mysql.com/)
- [JWT](https://jwt.io/)
- [Nodemailer](https://nodemailer.com/)
- [Moment](https://momentjs.com/)
- [Joi](https://www.npmjs.com/package/joi)
- [Bcrypt](https://www.npmjs.com/package/bcrypt)
- [Multer](https://www.npmjs.com/package/multer)
- [Morgan](https://www.npmjs.com/package/morgan)
- [Cors](https://www.npmjs.com/package/cors)
- [Dotenv](https://www.npmjs.com/package/dotenv)
- [Ip](https://www.npmjs.com/package/ip)

## Prerequisites

- [NodeJs](https://nodejs.org/en/download/)

## Installation

1. Clone the repository

```
git clone
cd apps
```

2. Install package

```
npm install
```

3. Create a new database with a name `apps` and import `apps.sql` from this repository

4. Create .env file

```
# Host & Port
HOST=
PORT=
PORT_FRONTEND=

# Database
DB_HOST=
DB_USER=
DB_PASS=
DB_NAME=apps

# Secret Key
SECRET_KEY=

# Email
EMAIL_USER=
EMAIL_PASS=
```

5. Run application

```
npm run dev
```

Or

```
npm start
```