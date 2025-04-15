# README
This is a web project built with Ruby on Rails. This README contains information on how to set up the development environment, how to run the project, and a description of the required environment variables.

This site is going to be used in the religious umbanda community of "Tenda de Umbanda Ogum Yara".
It's a project made to replace the current site, which does not have a good design, is difficult to use and does not have all the necessary features. 

# Setup

## ⚙️ Environment Setup

Before running the project, you need to configure some environment variables in the `.env` file for the system to work properly. The environment variables contain sensitive information such as database credentials and API keys.

### Environment Variables

#### Database Variables
- **DB_PASSWORD**: The password for the database user. This value is used to connect to the PostgreSQL database.
  - Example: `DB_PASSWORD=123`

#### API Keys
- **MAILERSEND_API_KEY**: The API key for the **Mailersend** email service. This is required for configuring email sending in the system.
- **APIDECK_KEY**: The API key for integrating with the **Apideck** API.
- **APIDECK_ID**: The identifier of your **Apideck** account.

#### AWS Configuration Variables
- **AWS_ACCESS_KEY_ID**: The access key for AWS authentication.
- **AWS_SECRET_ACCESS_KEY**: The secret key associated with the **AWS_ACCESS_KEY_ID** for authentication.
- **AWS_REGION**: The region where the AWS resources are located. Example: `sa-east-1` (São Paulo).
- **AWS_BUCKET**: The name of the S3 **bucket** used for file storage.

#### Email Configuration Variables
- **ADMIN_EMAIL**: The email address of the system administrator.
  - Example: `ADMIN_EMAIL=adminuccDazo@admin.com`
- **ADMIN_PASSWORD**: The password for the administrator account.
  - Example: `ADMIN_PASSWORD=W0@StB4vrV96v06&`
- **CONTACT_EMAIL**: The contact email address for the system.
- **BASE_EMAIL**: The base email used for transactional messages.
- **SMTP_USERNAME**: The username for the SMTP server used to send emails.
- **SMTP_PORT**: The SMTP server port (usually 587 for TLS).
- **SMTP_PASSWORD**: The password used for authentication on the SMTP server.
- **SMTP_DOMAIN**: The domain of the SMTP server.

---

### 💡 How to Use

1. **Set Up Environment Variables**:
    - Create a `.env` file at the root of your project.
    - Add the environment variables with their respective values as described above.
    - Ensure that the database credentials (e.g., `DB_PASSWORD`) and other sensitive information are kept secure and never shared publicly.
    - The mandatory environment variables are:
    - `DB_PASSWORD`
    - `ADMIN_EMAIL`
    - `ADMIN_PASSWORD`

    - The other variables are optional and can be used if needed. For example, for sending emails, you can set up SMTP configuration variables. For AWS S3 storage, you can set up the AWS credentials.

2. **Create the Database**:
    - Before running the project, you need to create a PostgreSQL database. Make sure you have PostgreSQL installed and running.
    - You can create the database using the following command (replace `terreiro_umbanda` with the database name you're using):
    
    ```bash
    createdb -U guidd terreiro_umbanda
    ```

    - This will create the database using the username `guidd` and the password from your `.env` file (via `DB_PASSWORD`).

3. **Run Migrations**:
    - After creating the database, you need to run the database migrations to set up the tables and schema.
    - Run the following command to execute the migrations:
    
    ```bash
    rake db:migrate
    ```

    - This will apply all the migration files located in the `db/migrate` directory, setting up the required tables for your project to work.

4. **Start the Rails Server**:
    - Once the database is set up and migrations are run, you can start the Rails development server with:
    
    ```bash
    rails server
    ```

    - This will make the application accessible at `http://localhost:3000`.

---

By following these steps, you will have your development environment set up, including the database and migrations, and the application will be ready to run.


---

By providing this explanation, any developer or collaborator will quickly understand what each environment variable does and how to configure them correctly.