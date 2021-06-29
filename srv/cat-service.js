
module.exports = cds.service.impl(async (cds)=>{
    cds.on('userInfo', req=>{
        let results = {};
        results.user = req.user.id;
        if (req.user.hasOwnProperty('locale')) {
            results.locale = req.user.locale;
        }
        results.scopes = {};
        results.scopes.identified = req.user.is('identified-user');
        results.scopes.authenticated = req.user.is('authenticated-user');
        results.scopes.User = req.user.is('User');
        results.scopes.Admin = req.user.is('Admin');
        results.attrs = {};
        if (req.user.hasOwnProperty('attr')) {
            results.attrs.Region = req.user.attr.Region;
        }
        return results;
    });
});