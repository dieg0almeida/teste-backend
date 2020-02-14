const Enterprise = require('../models/enterprise');

exports.index = function (req, res) {
    if(Object.keys(req.query).length === 0){
        Enterprise.all(function(results){
            for (let i = 0; i < results.length; i++) {
                const enterprise_type_id = results[i].enterprise_type_id;
                const enterprise_type_name = results[i].enterprise_type_name;
                delete results[i].enterprise_type_id;
                delete results[i].enterprise_type_name;
                delete results[i].shares;
                delete results[i].own_shares;
                results[i].own_enterprise = results[i].own_enterprise ? true : false;
                results[i] = {
                    ...results[i],
                    "enterprise_type": {
                        "id": enterprise_type_id,
                        "enterprise_type_name": enterprise_type_name
                    }
                };
            }
            res.status(200);
            res.json({ enterprises: results });
        })
    }else{
        Enterprise.allWithFilter(req.query.enterprise_types, req.query.name, function (results) {
            for (let i = 0; i < results.length; i++) {
                const enterprise_type_id = results[i].enterprise_type_id;
                const enterprise_type_name = results[i].enterprise_type_name;
                delete results[i].enterprise_type_id;
                delete results[i].enterprise_type_name;
                delete results[i].shares;
                delete results[i].own_shares;
                results[i].own_enterprise = results[i].own_enterprise ? true : false;
                results[i] = {
                    ...results[i],
                    "enterprise_type": {
                        "id": enterprise_type_id,
                        "enterprise_type_name": enterprise_type_name
                    }
                };
            }
            res.json({ enterprises: results });
        })
    }
}

exports.show = function(req, res){
    Enterprise.find(req.params.id, function(results){
        for (let i = 0; i < results.length; i++) {
            const enterprise_type_id = results[i].enterprise_type_id;
            const enterprise_type_name = results[i].enterprise_type_name;
            delete results[i].enterprise_type_id;
            delete results[i].enterprise_type_name;
            results[i].own_enterprise = results[i].own_enterprise ? true : false;
            results[i] = {
                ...results[i],
                "enterprise_type": {
                    "id": enterprise_type_id,
                    "enterprise_type_name": enterprise_type_name
                }
            };

            res.json({ enterprise: results[0], success: true });
        }
    })
}

