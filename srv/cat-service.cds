using acn.treinamento as treinamento from '../db/data-model';

service CatalogService @(requires : 'authenticated-user') {
    entity Alunos @(restrict : [
        {
            grant : [
                'READ',
                'CREATE',
                'DELETE',
                'UPDATE'
            ],
            to    : ['User', 'Token_Exchange']
        },
        {
            grant : ['WRITE'],
            to    : 'Admin'
        }
    ]) as projection on treinamento.Alunos;

    type userScopes {
        identified    : Boolean;
        authenticated : Boolean;
        Viewer        : Boolean;
        Admin         : Boolean;
    };

    type userAttrs {
        Region : many String;
    };

    type user {
        user   : String;
        locale : String;
        scopes : userScopes;
        attrs  : userAttrs;
    };

    function userInfo() returns user;
}
