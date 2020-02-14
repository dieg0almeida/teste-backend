const db = require('../../config/db');

module.exports = {
    all(callback){
        const query = `SELECT * FROM enterprise JOIN enterprise_type WHERE
        enterprise.enterprise_type_id = enterprise_type.enterprise_type_id`;
        db.query(query, function(err, results){
            if(err) throw "DATABASE ERROR!" + err;
            return callback(results);
        });
    },
    allWithFilter(enterprise_types, name, callback){
        const query = `SELECT * FROM enterprise JOIN enterprise_type WHERE
        enterprise.enterprise_type_id = ${enterprise_types} AND 
        enterprise.enterprise_name like '%${name}%' AND 
        enterprise.enterprise_type_id = enterprise_type.enterprise_type_id`;
        db.query(query, function(err, results){
            if(err) throw "DATABASE ERROR!" + err;
            return callback(results);
        });
    },
    find(id, callback){
        const query = `SELECT * FROM enterprise JOIN enterprise_type WHERE
        enterprise.enterprise_id = ${id} AND 
        enterprise.enterprise_type_id = enterprise_type.enterprise_type_id`;
        db.query(query, function(err, results){
            if(err) throw "DATABASE ERROR!" + err;
            return callback(results);
        });
    }
}