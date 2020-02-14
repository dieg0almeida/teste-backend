const express = require('express');
const routes = express.Router();
const EnterpriseController = require('./app/controllers/enterpriseController');
const InvestorController = require('./app/controllers/investorController');
const authMiddleware = require('./middlewares/auth');

routes.post('/api/v1/users/auth/sign_in', InvestorController.signIn);

routes.use(authMiddleware);

routes.get('/api/v1/enterprises', EnterpriseController.index);
routes.get('/api/v1/enterprises/:id', EnterpriseController.show);

module.exports = routes;