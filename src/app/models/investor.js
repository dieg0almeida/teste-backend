const db = require('../../config/db');

module.exports = {
    singIn(user, callback){
        const query = `SELECT * FROM investor WHERE email like '${user.email}'`;
        db.query(query, function(err, results){
            if(err) throw "DATABASE ERROR!" + err;

            return callback(results);
        });
    },
    getInvestorEnterprise(investor_id, callback){
        const query = `SELECT enterprise.enterprise_name
        FROM enterprise JOIN investor_enterprise 
        WHERE enterprise.enterprise_id = investor_enterprise.enterprise_id
        AND investor_id = ${investor_id}`;

        db.query(query, function(err, results){
            if(err) throw "DATABASE ERROR!" + err;

            return callback(results);
        });
    }
}