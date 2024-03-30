# API Gateway

The API Gateway serves as a central proxy server that directs incoming client requests to the appropriate services within the infrastructure, providing a unified access point for the backend services. It simplifies the client-side communication by offering a single endpoint for various services and handles routing, authentication, and authorization.

## Installation

To deploy the API Gateway, ensure Docker and Docker Compose are installed on your system. Start the project using the command below:

```bash
docker-compose up --build
```

## Services

### Wallet Money Auth Service

- **Repository:** [Wallet Money Auth Service](https://github.com/DeadNord/wallet-money-auth-service)
- **Swagger UI:** [Auth Service API Documentation](https://wallet-money-api-gateway.fly.dev/api/auth/swagger)

The Wallet Money Auth Service is a robust authentication system designed for the Wallet Money ecosystem, built with Nest.js. It provides essential features for managing user authentication securely and efficiently.

#### Features:

- **User Registration:** Enables new users to create an account.
- **User Login:** Handles user authentication and sessions.
- **Password Management:** Offers functionalities for password recovery and updates.
- **Token Management:** Generates and validates access tokens for user sessions.
- **Security:** Implements security best practices to protect user data.

### Finances Service API

- **Repository:** [Finances Service API](https://github.com/DeadNord/wallet-money-finances-service)
- **Swagger UI:** [Finances Service API Documentation](https://wallet-money-api-gateway.fly.dev/swagger)
- **ReDoc:** [Finances Service API ReDoc Documentation](https://wallet-money-api-gateway.fly.dev/redoc)

The Finances Service API focuses on managing financial transactions and budgets for users. It enables efficient tracking and analysis of personal finances.

#### Features:

- **Budget Management:** Allows users to set, adjust, and monitor budget limits.
- **Transaction Recording:** Enables recording and tracking of income and expense transactions.
- **Category Management:** Users can categorize their transactions for better organization.
- **Analytics:** Provides insights and summaries based on transactions, categories, and time periods.

### Wallet Money Client

- **Repository:** [Wallet Money Client](https://github.com/DeadNord/wallet-money-client)
- **Live Demo:** [Wallet Money Client App](https://wallet-money-client.netlify.app/)

The Wallet Money Client is the front-end application that interacts with the Auth Service and Finances Service, providing a user-friendly interface for managing personal finances and authentication.

## Access Points

The API Gateway provides a single point of entry for accessing the Swagger UI documentation of both the Auth Service and Finances Service, making it easier for developers to integrate and use the services.
