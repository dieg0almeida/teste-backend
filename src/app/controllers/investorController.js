const Investor = require('../models/investor');
const jwt = require('jsonwebtoken');
const authConfig = require('../../config/auth.json');

exports.signIn = function (req, res) {
    Investor.singIn(req.body, function (results) {

        console.log(req.body.email);
        if (results.length === 0 || results[0].password !== req.body.password) {
            return res.json({
                "success": false,
                "errors": [
                    "Invalid login credentials. Please try again."
                ]
            });
        } else {
            const token = jwt.sign({ id: results[0].investor_id },
                authConfig.secret,
                { expiresIn: 86400 });
            
            

            Investor.getInvestorEnterprise(results[0].investor_id, function(enteprises){

                delete results[0].password;
                results[0].first_access = results[0].first_access ? true : false;
                results[0].super_angel = results[0].super_angel ? true : false;
                results[0] = {
                    ...results[0],
                    "portfolio": {
                        "enterprises_number": enteprises.length,
                        "enterprises": enteprises
                    }
                }

                res.setHeader('access-token', token);
                res.setHeader('client', 'dasdadasdsa');
                res.setHeader('uid', results[0].email);
                res.status(200);
                res.json({ investor: results[0], enterprise: null, success: true });
            });
        }
    })
}